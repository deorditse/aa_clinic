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


class HomePageData {
  ///Роут для завершения календарного события и изменение его на статуса done +
  Future<void> calendarActionDoneData({
    required String targetId,
    required String accessToken,
  }) async {
    try {
      Uri url = Uri.http(urlMainApiConst, 'api/calendarActions/done/$targetId');
      var response = await http.put(
        url,
        headers: {'Authorization': 'Bearer ${accessToken}'},
      );
      if (response.statusCode == 200) {
        print(
            'Response status from calendarActionDoneData: ${response
                .statusCode}');
        // print(jsonEncode(userEdit));
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request calendarActionDoneData: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
      log('calendarActionDoneData ${response.body}');
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error calendarActionDoneData:$error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from calendarActionDoneData $error ');
    }
  }

  ///Роут для отмены приёма по его id +
  Future<void> calendarAppointmentsCancelData({
    required String targetId,
    required String cancelReason,
    required String accessToken,
  }) async {
    try {
      Uri url = Uri.http(urlMainApiConst, 'api/appointments/cancel/$targetId');
      var response = await http.put(
        url,
        headers: {'Authorization': 'Bearer ${accessToken}'},
        body: {'cancelReason': cancelReason},
      );
      if (response.statusCode == 200) {
        print(
            'Response status from calendarAppointmentsCancelData: ${response.statusCode}');
        // print(jsonEncode(userEdit));
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request calendarAppointmentsCancelData: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
      log('calendarAppointmentsCancelData ${response.body}');
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error calendarAppointmentsCancelData:$error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from calendarAppointmentsCancelData $error ');
    }
  }

  ///Роут для отмены календарного события и изменение его на статуса cancel+
  Future<void> calendarActionCancelData({
    required String targetId,
    required String cancelReason,
    required String accessToken,
  }) async {
    try {
      Uri url =
      Uri.http(urlMainApiConst, 'api/calendarActions/cancel/$targetId');
      var response = await http.put(
        url,
        headers: {'Authorization': 'Bearer ${accessToken}'},
        body: {'cancelReason': cancelReason},
      );
      if (response.statusCode == 200) {
        print(
            'Response status from calendarActionCancelData: ${response.statusCode}');
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request calendarActionCancelData: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
      log('calendarActionCancelData ${response.body}');
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error calendarActionCancelData:$error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from calendarActionCancelData $error ');
    }
  }

  ///СТРАНИЦА ПО ДЕФОЛТУ для получения данных на странице задачи на день +
  Future<CalendarActionsWithIdModel?> getCalendarActionsWithIdData(
      {required String accessToken, required String targetId}) async {
    try {
      Uri url = Uri.http(urlMainApiConst, 'api/calendarActions/$targetId');
      var response = await http.get(url, headers: {
        "Authorization": "Bearer ${accessToken}",
      });

      print(
          'Response status from getCalendarActionsData: ${response
              .statusCode}');
      if (response.statusCode == 200) {
        print(CalendarActionsWithIdModel.fromJson(jsonDecode(response.body)));
        return CalendarActionsWithIdModel.fromJson(jsonDecode(response.body));
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request getCalendarActionsWithIdData: status ${response
              .statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
      log('getCalendarActionsWithIdData CalendarActionsWithIdModel ${response.body}');
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error getCalendarActionsWithIdData: $error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from getCalendarActionsData $error ');
    }
    return null;
  }

  ///СТРАНИЦА FITNESS WORKOUT для получения данных на странице задачи на день +
  Future<FitnessWorkoutModel?> getFitnessWorkoutsWithIdData(
      {required String accessToken, required String targetId}) async {
    try {
      Uri url = Uri.http(urlMainApiConst, 'api/fitnessWorkouts/$targetId');
      var response = await http.get(url, headers: {
        "Authorization": "Bearer ${accessToken}",
      });

      print(
          'Response status from getFitnessWorkoutsWithIdData: ${response
              .statusCode}');
      if (response.statusCode == 200) {
        print(FitnessWorkoutModel.fromJson(jsonDecode(response.body)));
        return FitnessWorkoutModel.fromJson(jsonDecode(response.body));
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request getFitnessWorkoutsWithIdData: status ${response
              .statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
      log('getFitnessWorkoutsWithIdData FitnessWorkoutModel ${response.body}');
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error getFitnessWorkoutsWithIdData: $error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from getFitnessWorkoutsWithIdData $error ');
    }
    return null;
  }

  ///СТРАНИЦА Nutri Meal для получения данных на странице задачи на день +
  Future<NutriMealsModel?> getNutriMealsWithIdData(
      {required String accessToken, required String targetId}) async {
    try {
      Uri url = Uri.http(urlMainApiConst, 'api/nutriMeals/$targetId');
      var response = await http.get(url, headers: {
        "Authorization": "Bearer ${accessToken}",
      });

      print(
          'Response status from getNutriMealsWithIdData: ${response
              .statusCode}');
      if (response.statusCode == 200) {
        print(NutriMealsModel.fromJson(jsonDecode(response.body)));
        return NutriMealsModel.fromJson(jsonDecode(response.body));
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request getNutriMealsWithIdData: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
      log('getNutriMealsWithIdData NutriMealsModel ${response.body}');
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error getNutriMealsWithIdData: $error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from getNutriMealsWithIdData $error ');
    }
    return null;
  }

  ///СТРАНИЦА Appointment для получения данных на странице задачи на день +
  Future<AppointmentsModel?> getAppointmentsWithIdData(
      {required String accessToken, required String targetId}) async {
    try {
      Uri url = Uri.http(urlMainApiConst, 'api/appointments/$targetId');
      var response = await http.get(url, headers: {
        "Authorization": "Bearer ${accessToken}",
      });

      print(
          'Response status from getAppointmentsWithIdData: ${response
              .statusCode}');
      if (response.statusCode == 200) {
        return AppointmentsModel.fromJson(jsonDecode(response.body));
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request getAppointmentsWithIdData: status ${response
              .statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
      log('getAppointmentsWithIdData AppointmentsModel ${response.body}');
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error getAppointmentsWithIdData: $error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from getAppointmentsWithIdData $error ');
    }
    return null;
  }

  ///получение марок в календаре +
  Future<Map<String, List<int>>> getMonthlyCalendarMarksData(
      {required String accessToken, required DateTime dateMark}) async {
    try {
      final queryParameters = {'date': "${dateMark.year}-${dateMark.month}"};

      Uri url = Uri.http(
          urlMainApiConst, 'api/monthlyCalendarMarks', queryParameters);
      var response = await http.get(url, headers: {
        "Authorization": "Bearer ${accessToken}",
      });

      print(
          'Response status from getMonthlyCalendarMarksData: ${response.statusCode}');
      log('getMonthlyCalendarMarksData ${response.body}');
      if (response.statusCode == 200) {
        var data = await jsonDecode(response.body) as Map<String, dynamic>;

        Map<String, List<int>> _res = {};
        data.forEach((key, value) {
          if (value != null && value != 0) {
            final _date = DateTime.parse(key);
            _res["${_date.year}-${_date.month}-${_date.day}"] = [value];
          }
        });
        print(_res);
        return _res;
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
        return {};
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
  Future<List<DailyCalendarEventsModel?>> getDailyCalendarEventsData(
      {required String accessToken, required DateTime dateDaily}) async {
    try {
      final queryParameters = {
        'date': '${dateDaily.year}-${dateDaily.month}-${dateDaily.day}',
      };

      Uri url =
      Uri.http(urlMainApiConst, 'api/dailyCalendarEvents', queryParameters);
      var response = await http
          .get(url, headers: {"Authorization": "Bearer ${accessToken}"});

      print(
          'Response status from getDailyCalendarEventsData: ${response.statusCode}');
      log('getDailyCalendarEventsData ${response.body}');
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<DailyCalendarEventsModel?> listMapDailyCalendarEventsModel = data
            .map<DailyCalendarEventsModel?>((dailyEvent) =>
            DailyCalendarEventsModel.fromJson(
                Map<String, dynamic>.from(dailyEvent)))
            .toList();
        print(listMapDailyCalendarEventsModel);
        return listMapDailyCalendarEventsModel; // listMapDailyCalendarEventsModel;
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
        return [];
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

  ///Роут для получения оценки показателя здоровья (Значение показателя здоровья от 1 до 100) +
  Future<int?> getHealthRatesData({required String accessToken}) async {
    try {
      Uri url = Uri.http(urlMainApiConst, 'api/healthRates');
      var response = await http.get(url, headers: {
        "Authorization": "Bearer ${accessToken}",
      });

      print('Response status from getHealthRatesData: ${response.statusCode}');
      if (response.statusCode == 200) {
        final List? res = jsonDecode(response.body)['docs'];
        if(res!.isEmpty){
          return null;
        }
        final int? valHealth = res?.first['value'];
        return valHealth;
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request getHealthRatesData: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
        print(response.body);
      }
      log('getHealthRatesData ${response.body}');
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error getHealthRatesData: $error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from getHealthRatesData $error ');
    }
    return null;
  }

  ///новое создание приема еды NutriMeals +
  Future<void> postNutriMealsData({
    required String accessToken,
    required String title,
    required String? description,
    required List<NutriDishModel> listDishes,
  }) async {
    try {
      Uri url = Uri.http(urlMainApiConst, 'api/nutriMeals');
      print(listDishes);
      Map<String, dynamic> _jsonData = {
        "title": title,
        "dishes": listDishes,
        "typeId": '',
        "additionalData": {},
        "description": description,
        "startedAt": DateTime.now().toIso8601String(),
        "finishedAt": DateTime.now().toIso8601String(),
      };
      var response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer ${accessToken}',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(_jsonData),
      );
      print(
          'Response status from updateNutriMealsData: ${response.statusCode}');

      if (response.statusCode == 201) {
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request updateNutriMealsData: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
      log('updateNutriMealsData ${response.body}');
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error updateLifeImage:$error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from updateNutriMealsData $error ');
    }
  }

  ///обновление lifeImage еды чтобы закрыть прием пищи +
  Future<void> updateNutriMealsData({
    required String targetId,
    required NutriMealsModel dataNutriMeal,
    required String? coverIdLifeImage,
    required String accessToken,
  }) async {
    try {
      Uri url = Uri.http(urlMainApiConst, 'api/nutriMeals/$targetId');

      Map<String, dynamic> _jsonData = {
        "id": dataNutriMeal.id,
        "userId": dataNutriMeal.userId,
        "creatorId": dataNutriMeal.creatorId,
        "title": dataNutriMeal.title,
        "dishes": dataNutriMeal.dishes,
      };

      var response = await http.put(
        url,
        headers: {
          'Authorization': 'Bearer ${accessToken}',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(_jsonData),
      );
      print(
          'Response status from updateNutriMealsData: ${response.statusCode}');

      if (response.statusCode == 200) {
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request updateNutriMealsData: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
      log('updateNutriMealsData ${response.body}');
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error updateLifeImage:$error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from updateNutriMealsData $error ');
    }
  }
}
