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
    required String userId,
  }) async {
    try {
      final queryParameters = {'date': "${dateMark.year}-${dateMark.month}"};
      Uri url = urlMain(
        urlPath: 'api/specialistReceptionSchedule/monthlyCalendarMarks/$userId',
        queryParameters: queryParameters,
      );

      var response = await http.get(url, headers: {
        "Authorization": "Bearer ${accessToken}",
      });

      print(
          'Response status from getMonthlyCalendarMarksData: ${response.statusCode}');
      log('getMonthlyCalendarMarksData ${response.body}');
      if (response.statusCode == 200) {
        Map<String, dynamic> data = await jsonDecode(response.body);

        Map<String, Map<String, int>> _res = {};

        ///{'dateTime : {total : num, free : num}}
        ///total Количество всех окон специалиста на этот день
        ///free Количество свободных окон специалиста на этот день
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
}
