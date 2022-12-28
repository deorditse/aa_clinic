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
  Future<RealTimeCallModel?> getIncomingRealTimeCalls(
      {required String accessToken}) async {
    try {
      final queryParameters = {'filter[finishedAt]': "null"};
      Uri url = urlMain(
          urlPath: 'api/realTimeCalls', queryParameters: queryParameters);

      var response = await http.get(url, headers: {
        "Authorization": "Bearer $accessToken",
      });
      print(
          'Response status from getIncomingRealTimeCalls: ${response.statusCode}');
      log('getIncomingRealTimeCalls ${jsonDecode(response.body)}');

      if (response.statusCode == 200) {
        return RealTimeCallModel.fromJson(jsonDecode(response.body));
      }
      return null;
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error getIncomingRealTimeCalls: $error',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from getIncomingRealTimeCalls $error ');
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
      print('Response status from getRealTimeCallById: ${response.statusCode}');
      log('getRealTimeCallById RealTimeCall ${response.body}');

      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        return RealTimeCall.fromJson(jsonDecode(response.body));
      }
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error getRealTimeCallById: $error',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from getRealTimeCallById $error ');
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

  ///Роут для заканчивания звонка по его id
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
