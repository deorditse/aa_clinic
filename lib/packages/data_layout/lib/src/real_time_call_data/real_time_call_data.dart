import 'dart:convert';
import 'dart:developer';
import 'package:data_layout/data_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:model/model.dart';
import 'package:health/health.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class RealTimeCallData {
  Function newRTCCallback = () {};
  Function finishRTCCallback = () {};

  void initializeDataRTC() {
    SettingPageData.socket?.on('newRealTimeCall', (data) {
      newRTCCallback(RealTimeCallSocketEvent.fromJson(data));
    });
    SettingPageData.socket?.on('finishRealTimeCall', (data) {
      // TODO: add model for finish callback struct
      finishRTCCallback();
    });
  }

  void setNewRTCCallback(Function callback) {
    newRTCCallback = callback;
  }

  void setFinishRTCCallback(Function callback) {
    finishRTCCallback = callback;
  }

  Future<RealTimeCallModel?> getIncomingRealTimeCalls(
      {required String accessToken}) async {
    try {
      Uri url = urlMain(
          urlPath: 'api/realTimeCalls?${makeQuery({
            'filter': {'finishedAt': 'null'}
          })}');

      var response = await http.get(url, headers: {
        "Authorization": "Bearer $accessToken",
      });
      print('Response status from getTimeCall: ${response.statusCode}');
      log('getIncomingRealTimeCalls ${jsonDecode(response.body)}');

      if (response.statusCode == 200) {
        return RealTimeCallModel.fromJson(jsonDecode(response.body));
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request getTimeCall: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
      return null;
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error getTimeCall: $error',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from getTimeCall $error ');
    }
  }

  Future<RealTimeCall?> getRealTimeCallById({
    required String accessToken,
    required String id,
  }) async {
    try {
      Uri url = urlMain(urlPath: 'api/realTimeCalls/$id');
      var response = await http.get(url, headers: {
        "Authorization": "Bearer $accessToken",
      });
      print('Response status from getTimeCallById: ${response.statusCode}');
      log('getRealTimeCallById RealTimeCall ${response.body}');

      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        return RealTimeCall.fromJson(jsonDecode(response.body));
      } else {
        Get.snackbar(
          '${response.statusCode}',
          response.body,
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error getTimeCall: $error',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from getTimeCall $error ');
    }
    return null;
  }

  Future acceptRealTimeCalls({
    required String id,
    required String accessToken,
  }) async {
    try {
      Uri url = urlMain(urlPath: 'api/realTimeCalls/accept/$id');

      var response = await http.put(
        url,
        headers: {'Authorization': 'Bearer ${accessToken}'},
      );
      print('Response status from acceptRealTimeCalls: ${response.statusCode}');
      if (response.statusCode == 200) {
        print(
            'Response status from acceptRealTimeCalls: ${response.statusCode}');
        log('acceptRealTimeCalls ${response.body}');
      } else {
        print(url.toString());
        Get.snackbar(
          'Exception',
          jsonDecode(response.body)['message'],
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error acceptRealTimeCalls:$error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from acceptRealTimeCalls $error ');
    }
  }

  Future finishRealTimeCalls({
    required String id,
    required String accessToken,
  }) async {
    try {
      Uri url = urlMain(urlPath: 'api/realTimeCalls/finish/$id');

      var response = await http.put(
        url,
        headers: {'Authorization': 'Bearer ${accessToken}'},
      );
      print('Response status from finishRealTimeCalls: ${response.statusCode}');
      log('finishRealTimeCalls ${response.body}');

      if (response.statusCode == 200) {
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request finishRealTimeCalls: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error finishRealTimeCalls:$error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from finishRealTimeCalls $error ');
    }
  }
}
