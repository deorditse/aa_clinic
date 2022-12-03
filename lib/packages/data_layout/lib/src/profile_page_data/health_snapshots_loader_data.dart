import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:data_layout/data_layout.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:health/health.dart';
import 'package:model/model.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class HealthSnapshotsLoaderData {
  Future<Map<String, dynamic>?> getLastValues(
      {required String accessToken}) async {
    try {
      Uri url = Uri.http(urlMainApiConst, 'api/healthSnapshots/lastValues');
      var response = await http.get(url, headers: {
        "Authorization": "Bearer $accessToken",
      });
      print('Response status from getLastValues: ${response.statusCode}');
      if (response.statusCode == 200) {
        return await jsonDecode(response.body);
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request getLastValues: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (error) {
      print(error);
    }
    return null;
  }

  DateTime? _lastDataFetchedDateTime;

  // функция вызывает fetchData только при достижении определенного интервала (чтобы не перегружать)
  Future<void> safeFetchData({
    required String accessToken,
  }) async {
    if (_lastDataFetchedDateTime == null ||
        _lastDataFetchedDateTime!
            .isBefore(DateTime.now().subtract(const Duration(minutes: 1)))) {
      await fetchData(accessToken: accessToken);
      _lastDataFetchedDateTime = DateTime.now();
    }
  }

  Future<void> fetchData({
    required String accessToken,
  }) async {
    Map<String, dynamic>? lastValues =
        await getLastValues(accessToken: accessToken);
    if (lastValues == null) {
      return null;
    }
    //Список значений которые мы будем читать
    List<HealthDataPoint> _healthDataList = [];
    HealthFactory health = HealthFactory();
    List<HealthDataType> types = [];
    List<HealthDataAccess> permissions = [];
    //Проходим цикл для осуществления согласия пользователя для доступа к его личным данным(здоровья).
    for (var element in HealthDataType.values) {
      if (health.isDataTypeAvailable(element)) {
        types.add(element);
        permissions.add(HealthDataAccess.READ);
      }
    }
    await Permission.activityRecognition.request();
    bool requested =
        await health.requestAuthorization(types, permissions: permissions);
    if (!requested) {
      return null;
    }
    for (var element in HealthDataType.values) {
      if (health.isDataTypeAvailable(element)) {
        try {
          //Получаем healthDataType в нужном нам виде (без healthDataType)
          // i.e. element.toString = HealthDataTypes.HEIGHT, but only HEIGHT needed (check API)
          String dataType = element.toString().split('.')[1];
          // Окончание интервала интересующих нас данных - сегодняшний день
          final now = DateTime.now();
          // Начало интервала интересующих нас данных (по умолчанию) - 5 дней назад
          DateTime other = now.subtract(const Duration(days: 5));
          // Но если в полученных с сервера данных есть старый снимок такого типа
          if (lastValues.containsKey(dataType)) {
            //Парсим данные по параметру 'date_to' старого снимка такого типа исключая UTC время, добавляя 10 миллисекунд (чтобы в новый массив не вошел старый снимок)
            // и перезаписываем начало интервала в соответствии с date_to предыдущего снимка
            other =
                DateTime.parse(lastValues[dataType]['date_to'].split('Z')[0])
                    .add(const Duration(milliseconds: 10));
            print('other parsed datetime: $other; now: $now');
          }
          //Добавляем данные в лист по нужным нам параметрам
          List<HealthDataPoint> healthData =
              await health.getHealthDataFromTypes(other, now, [
            element,
          ]);
          _healthDataList.addAll(healthData);
        } catch (e) {
          // TODO: process
          print('Error in fetching $element: $e');
        }
      }
    }
    //Убираем дубликаты
    _healthDataList = HealthFactory.removeDuplicates(_healthDataList);
    _healthDataList.forEach((x) => print(x));
    //Если подключение к сокету = true, тогда отправляем данные на сервер
    if (SettingPageData.socketIOAvailable) {
      SettingPageData.socket
          ?.emit('createHealthSnapshotFromArray', {"data": _healthDataList});
    } else {
      // если прямо сейчас сокет не доступен, пробуем через 5 секунд
      SettingPageData.socket?.connect();
      Timer(
          const Duration(seconds: 10),
          () => {
                if (SettingPageData.socketIOAvailable)
                  {
                    SettingPageData.socket?.emit(
                        'createHealthSnapshotFromArray',
                        {"data": _healthDataList})
                  }
              });
    }
  }

  ///Получение определенных данных здоровья
  Future<ActiveValue?> getActiveHealthValues() async {
    ActiveValue result = ActiveValue(
        oxygen: null,
        heartRate: null,
        sleepinbed: null,
        energyBurned: null,
        arrhythmia: null,
        steps: null);

    /// Лист в котором будут храниться полученные значения
    List<HealthDataPoint> oxygen = [];
    List<HealthDataPoint> arrhythmia = [];
    List<HealthDataPoint> sleepinbed = [];
    List<HealthDataPoint> energyBurned = [];
    List<HealthDataPoint> heartRate = [];
    int? steps;
    HealthFactory health = HealthFactory();

    /// Типы данных здоровья, которые запрашиваем у пользователя
    List<HealthDataType> types = [
      HealthDataType.BLOOD_OXYGEN,
      HealthDataType.ACTIVE_ENERGY_BURNED,
      HealthDataType.SLEEP_IN_BED,
      HealthDataType.HEART_RATE,
      HealthDataType.STEPS
    ];

    /// Тип разрешения, которое запрашиваем у пользователя 1:1
    List<HealthDataAccess> permissions = [
      HealthDataAccess.READ,
      HealthDataAccess.READ,
      HealthDataAccess.READ,
      HealthDataAccess.READ,
      HealthDataAccess.READ,
    ];
    // Окончание интервала интересующих нас данных - сегодняшний день
    final now = DateTime.now();
    // Начало интервала интересующих нас данных - за сегодняшний день
    final prev_date = DateTime(now.year, now.month, now.day, 0, 0, 0);

    /// Поскольку аритмия может запрашиваться у пользователя только в том случае, если его устройство - IOS
    /// и он использует устройство для отслеживания данных здоровья - Apple Watch , то нужно осуществить проверку
    if (health
        .isDataTypeAvailable(HealthDataType.HEART_RATE_VARIABILITY_SDNN)) {
      ///Если его устройство позволяет отправлять данные об аритмии, то внесем его в лист типов и добавим в список на разрешение чтения данных.
      types.add(HealthDataType.HEART_RATE_VARIABILITY_SDNN);
      permissions.add(HealthDataAccess.READ);
    }

    /// Запрашиваем разрешения у пользователя на чтение его данных здоровья
    bool requested =
        await health.requestAuthorization(types, permissions: permissions);
    if (requested) {
      try {
        if (health
            .isDataTypeAvailable(HealthDataType.HEART_RATE_VARIABILITY_SDNN)) {
          arrhythmia = await health.getHealthDataFromTypes(
              prev_date, now, [HealthDataType.HEART_RATE_VARIABILITY_SDNN]);
        }
        oxygen = await health.getHealthDataFromTypes(
            prev_date, now, [HealthDataType.BLOOD_OXYGEN]);
        heartRate = await health.getHealthDataFromTypes(
            prev_date, now, [HealthDataType.HEART_RATE]);
        sleepinbed = await health.getHealthDataFromTypes(
            prev_date, now, [HealthDataType.SLEEP_IN_BED]);
        energyBurned = await health.getHealthDataFromTypes(
            prev_date, now, [HealthDataType.ACTIVE_ENERGY_BURNED]);
        steps = await health.getTotalStepsInInterval(prev_date, now);

        /// Удаляем дубликаты пульса
        heartRate = HealthFactory.removeDuplicates(heartRate);

        num sum = 0;

        /// Метод для подсчета среднего значения пульса
        for (HealthDataPoint point in heartRate) {
          if (point.value is NumericHealthValue) {
            sum += (point.value as NumericHealthValue).numericValue;
          }
        }
        if (heartRate.isNotEmpty) {
          result.heartRate = sum ~/ heartRate.length;
        }

        num energ = 0;

        /// Метод для подсчета сожженных калорий
        energyBurned = HealthFactory.removeDuplicates(energyBurned);
        for (HealthDataPoint point in energyBurned) {
          if (point.value is NumericHealthValue) {
            energ += (point.value as NumericHealthValue).numericValue;
          }
        }
        if (energyBurned.isNotEmpty) {
          double d = energ / energyBurned.length;
          String inString = d.toStringAsFixed(1);
          result.energyBurned = double.parse(inString);
        }
        num summ = 0;

        /// Метод для подсчета среднего значения кислорода в крови
        oxygen = HealthFactory.removeDuplicates(oxygen);
        for (HealthDataPoint point in oxygen) {
          if (point.value is NumericHealthValue) {
            summ += (point.value as NumericHealthValue).numericValue;
          }
        }
        if (oxygen.isNotEmpty) {
          double d = summ / oxygen.length;
          String inString = d.toStringAsFixed(1);
          result.oxygen = double.parse(inString);
        }

        num sleep = 0;

        /// Метод для подсчета среднего значения продолжительности сна
        sleepinbed = HealthFactory.removeDuplicates(sleepinbed);
        for (HealthDataPoint point in sleepinbed) {
          if (point.value is NumericHealthValue) {
            sleep += (point.value as NumericHealthValue).numericValue;
          }
        }
        if (sleepinbed.isNotEmpty) {
          double d = sleep / sleepinbed.length;
          String inString = d.toStringAsFixed(1);
          result.sleepinbed = double.parse(inString);
        }
        num arrhytm = 0;

        /// Метод для подсчета среднего значения аритмии
        arrhythmia = HealthFactory.removeDuplicates(arrhythmia);
        for (HealthDataPoint point in arrhythmia) {
          if (point.value is NumericHealthValue) {
            arrhytm += (point.value as NumericHealthValue).numericValue;
          }
        }
        if (arrhythmia.isNotEmpty) {
          result.arrhythmia = arrhytm ~/ arrhythmia.length;
        }

        /// Кол-во шагов
        result.steps = steps;

        return result;
      } catch (error) {
        print('$error');
      }
    }
    return null;
  }
}
