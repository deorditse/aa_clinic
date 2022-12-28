import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:data_layout/data_layout.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:model/model.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class CalendarUserChatData {
  ///получение марок в календаре для юзера+
  Future<Map<String, Map<String, int>>> getMonthlyCalendarMarksData({
    required String accessToken,
    required DateTime dateMark,
    required String specialistId,
  }) async {
    try {
      final queryParameters = {'date': "${dateMark.year}-${dateMark.month}"};
      Uri url = urlMain(
        urlPath:
            'api/specialistReceptionSchedule/monthlyCalendarMarks/$specialistId',
        queryParameters: queryParameters,
      );

      var response = await http.get(url, headers: {
        "Authorization": "Bearer ${accessToken}",
      });

      print(
          'Response status from getMonthlyCalendarMarksData: ${response.statusCode}');
      log('getMonthlyCalendarMarksData ${jsonDecode(response.body)}');
      if (response.statusCode == 200) {
        Map<String, dynamic> data = await jsonDecode(response.body);
        Map<String, Map<String, int>> _res = {};

        ///{'dateTime : {total : num, free : num}}
        ///total Количество всех окон специалиста на этот день
        ///free Количество свободных окон специалиста на этот день
        data.forEach((keyTime, value) {
          final int total = data[keyTime]["total"];
          if ((total != 0) && (total != '0')) {
            print(total);
            DateTime _date = DateTime.parse(keyTime);

            _res["${_date.year}-${_date.month}-${_date.day}"] = {
              "total": data[keyTime]["total"],
              "free": data[keyTime]["free"],
            };
          }
        });

        log(_res.toString());
        return _res;
      }
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error calendar marks: $error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from getMonthlyCalendarMarksData $error ');
    }
    return {};
  }


  ///получение событий выбранной даты +
  Future<List<DailyReceptionScheduleEventModel?>> getDailyCalendarEventsData(
      {required String accessToken,
        required DateTime dateDaily,
        required String specialistId}) async {
    try {
      final queryParameters = {
        'date': '${dateDaily.year}-${dateDaily.month}-${dateDaily.day}',
      };
      Uri url = urlMain(
          urlPath:
          'api/specialistReceptionSchedule/dailyReceptionScheduleEvent/$specialistId',
          queryParameters: queryParameters);

      var response = await http
          .get(url, headers: {"Authorization": "Bearer ${accessToken}"});

      print(
          'Response status from getDailyCalendarEventsData: ${response.statusCode}');
      log('getDailyCalendarEventsData ${response.body}');
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<DailyReceptionScheduleEventModel?> listMapDailyCalendarEventsModel =
        data
            .map<DailyReceptionScheduleEventModel?>((dailyEvent) =>
            DailyReceptionScheduleEventModel.fromJson(
                Map<String, dynamic>.from(dailyEvent)))
            .toList();
        print(listMapDailyCalendarEventsModel);
        return listMapDailyCalendarEventsModel; // listMapDailyCalendarEventsModel;
      }
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error daily events:$error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from getDailyCalendarEventsData $error ');
    }
    return [];
  }

  ///Роут для записи на приём по расписанию +
  Future<void> putMakeAnAppointmentData({
    required String scheduleId,
    required String specialistId,
    required String healthComplaint,
    required String accessToken,
  }) async {
    try {
      Uri url = urlMain(
          urlPath:
          'api/specialistReceptionSchedule/makeAnAppointment/$scheduleId');

      var response = await http.put(
        url,
        headers: {'Authorization': 'Bearer ${accessToken}'},
        body: {
          "specialistId": specialistId,
          "healthComplaint": healthComplaint,
        },
      );
      print(
          'Response status from putMakeAnAppointmentData: ${response.statusCode}');
      log('putMakeAnAppointmentData ${response.body}');


    } catch (error) {
      Get.snackbar(
        'Exception',
        'error putMakeAnAppointmentData:$error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from putMakeAnAppointmentData $error ');
    }
  }
}
