import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:data_layout/data_layout.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:model/model.dart';

class AuthPageData {
  ///вход в приложение
  Future<Map<String, Map<String, dynamic>>> postSignInUserDataAuth(
      {required String username, required String password}) async {
    try {
      Uri url = urlMain(urlPath: 'api/auth/signin');

      var response = await http.post(
        url,
        body: {
          'username': "$username",
          'password': "$password",
        },
      );

      log('Response status from postSignInUserDataAuth: ${response.statusCode} ${response.body}');

      return {'${response.statusCode}': json.decode(response.body)};
    } catch (error) {
      print('я в ошибке from postSignInUserDataAuth $error');
      return {'error $error': {}};
    }
  }

  ///регистрация в приложении
  Future<bool> postSignUpUserDataAuth(
      {required RegistrationDataModel registrationData}) async {
    try {
      Uri url = urlMain(urlPath: 'api/auth/signup');
      var response = await http.post(url, body: registrationData.toJson());

      log('Response status from postSignUpUserDataAuth: ${response.statusCode} ${response.body}');

      if (response.statusCode == 201) {
        Get.snackbar(
          '',
          'Пользователь зарегистрирован',
          snackPosition: SnackPosition.TOP,
        );
        return true;
      } else if (response.statusCode == 400) {
        Get.snackbar('Ошибка валидации', jsonDecode(response.body)['message'],
            snackPosition: SnackPosition.TOP);
      }
    } catch (error) {
      Get.snackbar(
        'Exception',
        'Sign up error:$error}',
        snackPosition: SnackPosition.TOP,
      );

      print('я в ошибке from postSignUpUserDataAuth $error ');
    }
    return false;
  }

  ///для обновления почты
  Future<void> updateEmailData(
      {required String newEmail, required String accessToken}) async {
    try {
      Uri url = urlMain(urlPath: 'api/users/updateEmail');

      var response = await http.put(url, headers: {
        'Authorization': 'Bearer ${accessToken}',
      }, body: {
        "email": newEmail.toLowerCase(),
      });
      log('Response status from updateEmailData: ${response.statusCode} updateEmailData ${response.body}');

      if (response.statusCode == 200) {
        Get.snackbar(
          'Ошибка входа',
          'Перейдите по ссылке из письма',
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (error) {
      Get.snackbar(
        'Exception',
        'Update email error:$error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from updateEmailData $error ');
    }
  }

  ///для верификации почты (отправка кода
  Future<void> postResetPasswordData({required String code}) async {}

  ///Роут для запроса на сброс пароля +
  Future<Map<String, String?>> postResetPasswordRequestData(
      {required String emailUser}) async {
    try {
      Uri url = urlMain(urlPath: 'api/resetPasswordRequest');
      var response = await http.post(
        url,
        body: {"email": emailUser.toLowerCase()},
      );
      log('Response status from postResetPasswordRequestData: ${response.statusCode} updateEmailData ${response.body}');

      if (response.statusCode == 200) {
        Get.snackbar(
          '',
          'Код был отправлен на почту',
          snackPosition: SnackPosition.TOP,
        );
      }
      return {'${response.statusCode}': response.body};
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error from postResetPasswordRequestData: $error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from postResetPasswordRequestData $error ');
      return {};
    }
  }
}
