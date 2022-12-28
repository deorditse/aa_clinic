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
      Uri url = urlMain(urlPath: 'api/calendarActions/done/$targetId');

      var response = await http.put(
        url,
        headers: {'Authorization': 'Bearer ${accessToken}'},
      );
      print(
          'Response status from calendarActionDoneData: ${response.statusCode}');
      log('calendarActionDoneData ${response.body}');

      if (response.statusCode == 200) {
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request calendarActionDoneData: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
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
      Uri url = urlMain(urlPath: 'api/appointments/cancel/$targetId');

      var response = await http.put(
        url,
        headers: {'Authorization': 'Bearer ${accessToken}'},
        body: {'cancelReason': cancelReason},
      );
      print(
          'Response status from calendarAppointmentsCancelData: ${response.statusCode}');
      log('calendarAppointmentsCancelData ${response.body}');

      if (response.statusCode == 200) {
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request calendarAppointmentsCancelData: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
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
      Uri url = urlMain(urlPath: 'api/calendarActions/cancel/$targetId');

      var response = await http.put(
        url,
        headers: {'Authorization': 'Bearer ${accessToken}'},
        body: {'cancelReason': cancelReason},
      );
      print(
          'Response status from calendarActionCancelData: ${response.statusCode}');
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
      Uri url = urlMain(urlPath: 'api/calendarActions/$targetId');

      var response = await http.get(url, headers: {
        "Authorization": "Bearer ${accessToken}",
      });

      print(
          'Response status from getCalendarActionsData: ${response.statusCode}');
      log('getCalendarActionsWithIdData CalendarActionsWithIdModel ${response.body}');

      if (response.statusCode == 200) {
        return CalendarActionsWithIdModel.fromJson(jsonDecode(response.body));
      }
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
      Uri url = urlMain(urlPath: 'api/fitnessWorkouts/$targetId');

      var response = await http.get(url, headers: {
        "Authorization": "Bearer ${accessToken}",
      });

      print(
          'Response status from getFitnessWorkoutsWithIdData: ${response.statusCode}');
      log('getFitnessWorkoutsWithIdData FitnessWorkoutModel ${response.body}');

      if (response.statusCode == 200) {
        return FitnessWorkoutModel.fromJson(jsonDecode(response.body));
      }
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
      Uri url = urlMain(urlPath: 'api/nutriMeals/$targetId');

      var response = await http.get(url, headers: {
        "Authorization": "Bearer ${accessToken}",
      });

      print(
          'Response status from getNutriMealsWithIdData: ${response.statusCode}');
      log('getNutriMealsWithIdData NutriMealsModel ${response.body}');

      if (response.statusCode == 200) {
        return NutriMealsModel.fromJson(jsonDecode(response.body));
      }
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
      Uri url = urlMain(urlPath: 'api/appointments/$targetId');

      var response = await http.get(url, headers: {
        "Authorization": "Bearer ${accessToken}",
      });

      print(
          'Response status from getAppointmentsWithIdData: ${response.statusCode}');
      log('getAppointmentsWithIdData AppointmentsModel ${response.body}');

      if (response.statusCode == 200) {
        return AppointmentsModel.fromJson(jsonDecode(response.body));
      }
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
  Future<Map<String, int>> getMonthlyCalendarMarksData({
    required String accessToken,
    required DateTime dateMark,
  }) async {
    try {
      final queryParameters = {'date': "${dateMark.year}-${dateMark.month}"};
      Uri url = urlMain(
          urlPath: 'api/monthlyCalendarMarks',
          queryParameters: queryParameters);

      var response = await http.get(url, headers: {
        "Authorization": "Bearer ${accessToken}",
      });

      print(
          'Response status from getMonthlyCalendarMarksData: ${response.statusCode}');
      log('getMonthlyCalendarMarksData ${response.body}');
      if (response.statusCode == 200) {
        Map<String, dynamic> data = await jsonDecode(response.body);

        Map<String, int> _res = {};

        data.forEach(
          (key, value) {
            if ((value != null) && (value != 0) && (value != '0')) {
              DateTime _date = DateTime.parse(key);
              _res["${_date.year}-${_date.month}-${_date.day}"] = value;
            }
          },
        );
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
  Future<List<DailyCalendarEventsModel?>> getDailyCalendarEventsData(
      {required String accessToken, required DateTime dateDaily}) async {
    try {
      final queryParameters = {
        'date': '${dateDaily.year}-${dateDaily.month}-${dateDaily.day}',
      };
      Uri url = urlMain(
          urlPath: 'api/dailyCalendarEvents', queryParameters: queryParameters);

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
      Uri url = urlMain(urlPath: 'api/healthRates');
      var response = await http.get(url, headers: {
        "Authorization": "Bearer ${accessToken}",
      });

      print('Response status from getHealthRatesData: ${response.statusCode}');
      log('getHealthRatesData ${response.body}');

      if (response.statusCode == 200) {
        final List? res = jsonDecode(response.body)['docs'];
        if (res!.isEmpty) {
          return null;
        }
        final int? valHealth = res.first['value'];
        return valHealth;
      }
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
      Uri url = urlMain(urlPath: 'api/nutriMeals');
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
          'Content-Type': 'application/json',
        },
        body: jsonEncode(_jsonData),
      );
      print(
          'Response status from updateNutriMealsData: ${response.statusCode}');
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
    required String accessToken,
  }) async {
    try {
      Uri url = urlMain(urlPath: 'api/nutriMeals/$targetId');

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
          'Content-Type': 'application/json',
        },
        body: json.encode(_jsonData),
      );
      print(
          'Response status from updateNutriMealsData: ${response.statusCode}');
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

  ///Route for update one fitness workouts by id
  Future<void> putFitnessWorkoutWithIdData(
      {required String accessToken,
      required FitnessWorkoutModel fitnessWorkout,
      required}) async {
    try {
      print(fitnessWorkout.exercises);
      Uri url = urlMain(urlPath: 'api/fitnessWorkouts/${fitnessWorkout.id}');
      Map<String, dynamic> _jsonData = {
        'userId': fitnessWorkout.userId,
        "creatorId": fitnessWorkout.creatorId,
        'startedAt': fitnessWorkout.startedAt,
        'finishedAt': fitnessWorkout.finishedAt,
        'description': fitnessWorkout.description ?? "",
        'title': fitnessWorkout.title,
        'exercises': fitnessWorkout.exercises,
      };
      var response = await http.put(
        url,
        headers: {
          'Authorization': 'Bearer ${accessToken}',
        },
        body: json.encode(_jsonData),
      );
      print(
          'Response status from putFitnessWorkoutWithIdData: ${response.statusCode}');
      log('putFitnessWorkoutWithIdData ${response.body}');
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error putFitnessWorkoutWithIdData:$error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from putFitnessWorkoutWithIdData $error ');
    }
  }
}
