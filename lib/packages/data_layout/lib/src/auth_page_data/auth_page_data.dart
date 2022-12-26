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
      print(
          'Response status from postSignInUserDataAuth: ${response.statusCode}');
      log('postSignInUserDataAuth UserAuthorizedModel ${response.body}');

      if (response.statusCode == 200) {
        return {'${response.statusCode}': json.decode(response.body)};
      } else {
        return {'${response.statusCode}': json.decode(response.body)};
      }
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
      print(
          'Response status from postSignUpUserDataAuth: ${response.statusCode}');
      log('postSignUpUserDataAuth ${response.body}');

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
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request postSignUpUserDataAuth: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
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
      print('Response status from updateEmailData: ${response.statusCode}');
      log('updateEmailData ${response.body}');

      if (response.statusCode == 200) {
        Get.snackbar(
          'Exception',
          'Email обновлен',
          snackPosition: SnackPosition.TOP,
        );
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request: status ${response.statusCode}',
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
  Future<void> verifyEmailData({required String code}) async {}
}
