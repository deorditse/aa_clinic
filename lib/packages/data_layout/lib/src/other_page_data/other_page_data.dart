import 'dart:convert';
import 'dart:developer';
import 'package:data_layout/data_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:model/model.dart';
import 'package:health/health.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class OtherPageData {
  ///Роут для обновления пароля пользователя этого сеанса +
  Future<void> updatePasswordData({required String newPassword,
    required String lastPassword,
    required String accessToken}) async {
    try {
      Uri url = Uri.http(urlMainApiConst, 'api/users/updatePassword');
      var response = await http.put(
        url,
        headers: {'Authorization': 'Bearer ${accessToken}'},
        body: {
          "password": newPassword,
          "lastPassword": lastPassword,
        },
      );
      print('Response status from updatePasswordData: ${response.statusCode}');
      if (response.statusCode == 200) {} else {
        Get.snackbar(
          'Exception',
          'Bad Request updatePasswordData: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
      log('updatePasswordData ${response.body}');
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error updatePasswordData:$error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from updatePasswordData $error ');
    }
  }

  ///Роут для получения списка подписок на маркет +
  Future<SubscriptionsModel?> getMarketSubscriptionsData(
      {required String accessToken}) async {
    try {
      Uri url = Uri.http(urlMainApiConst, 'api/marketSubscriptions');
      var response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer ${accessToken}',
        },
      );
      print(
          'Response status from getMarketSubscriptionsData: ${response
              .statusCode}');
      if (response.statusCode == 200) {
        return SubscriptionsModel.fromJson(jsonDecode(response.body));
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request getMarketSubscriptionsData: status ${response
              .statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
      log('getMarketSubscriptionsData SubscriptionsModel ${response.body}');
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error getMarketSubscriptionsData:$error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from getMarketSubscriptionsData $error ');
      return null;
    }
  }

  ///Роут для получения списка заказов +
  Future<OrdersModel?> getOrdersData({required String accessToken}) async {
    try {
      Uri url = Uri.http(urlMainApiConst, 'api/orders');
      var response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer ${accessToken}',
        },
      );
      print('Response status from getOrdersData: ${response.statusCode}');
      if (response.statusCode == 200) {
        return OrdersModel.fromJson(jsonDecode(response.body));
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request getOrdersData: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
      log('getOrdersData OrdersModel ${response.body}');
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error getOrdersData:$error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from getOrdersData $error ');
      return null;
    }
  }

  ///Роут для получения продукта маркета по его id
  Future<MarketProductModel?> getMarketProductByOrderIdData(
      {required String accessToken, required String idOrder}) async {
    try {
      Uri url = Uri.http(urlMainApiConst, 'api/marketProducts/$idOrder');
      var response = await http
          .get(url, headers: {"Authorization": "Bearer ${accessToken}"});

      print(
          'Response status from getMarketProductByOrderId: ${response
              .statusCode}');
      if (response.statusCode == 200) {
        return MarketProductModel.fromJson(jsonDecode(response.body));
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request getMarketProductByOrderId: status ${response
              .statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
      log('getMarketProductByOrderId MarketProductModel ${response.body}');
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error getMarketProductByOrderId: $error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from getMarketProductByOrderId $error ');
    }
    return null;
  }

}