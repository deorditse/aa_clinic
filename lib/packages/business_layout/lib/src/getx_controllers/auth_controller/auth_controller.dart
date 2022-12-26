import 'package:business_layout/business_layout.dart';
import 'package:data_layout/data_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:model/model.dart';

//для страницы регистрации смены пароля, вхорда, чтобы выводить соответствующие виджеты делаю enum
enum FormType { login, register, passwordRecovery, confirmMail }

class ImplementAuthController extends GetxController {
  static ImplementAuthController instance = Get.find<ImplementAuthController>();
  final AuthPageData _services = AuthPageData();
  String? userName;
  String? password;
  FlutterSecureStorage? _storageSecure; //локальная база данных - секьюрная
  UserAuthorizedModel? userAuthorizedData;

  Future<void> initMainDataApp() async {
    await Hive.initFlutter(); //иннициализируем Hive
    // с security

    _storageSecure = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    );

    userName = await _storageSecure?.read(key: 'username');
    password = await _storageSecure?.read(key: 'password');
    update();

    await signInUser(username: userName, password: password);
  }

  FormType formType = FormType.login;

  //для проверки какой виджет выводить
  switchForm({required FormType newFormType}) {
    formType = newFormType;
    update();
  }

  //когда пользователь зарегистрировался сохранять ID в локальную базу и каждый раз при входе проверять актуальность данныхч
  ///для виджета входа
  Future<void> signInUser(
      {required String? username, required String? password}) async {
    if (username != null && password != null) {
      return await _services
          .postSignInUserDataAuth(username: username, password: password)
          .then(
        (Map<String, Map<String, dynamic>> newUserAuthorizedData) async {
          await _savePassAndLoginInLocalStorage(
            username: username.trim(),
            newPassword: password.trim(),
          );
          if (newUserAuthorizedData.keys.first == '200') {
            if (newUserAuthorizedData.values.first.isNotEmpty) {
              userAuthorizedData = UserAuthorizedModel.fromJson(
                  newUserAuthorizedData.values.first);
              update();

              Get.offAllNamed("/main");
            }else{
              Get.snackbar(
                'Ошибка входа',
                'Ошибка сервера, попробуйте позже',
                snackPosition: SnackPosition.TOP,
              );
            }

          } else if (newUserAuthorizedData.keys.first == '401') {
            //Обработка ошибки 401 Unathorized
            print(newUserAuthorizedData.values.first);
            String _code = newUserAuthorizedData.values.first['code'];

            if (_code == "TOKEN_EXPIRED") {
              Get.snackbar(
                'Ошибка входа',
                'Войдите в аккаунт!',
                snackPosition: SnackPosition.TOP,
              );
              switchForm(newFormType: FormType.login);
            } else if (_code == "EMAIL_IS_NOT_VERIFIED") {
              Get.snackbar(
                'Ваш email не подтвержден',
                'Необходимо подвердить email!',
                snackPosition: SnackPosition.TOP,
              );
              switchForm(newFormType: FormType.confirmMail);
            } else if (_code == "WRONG_DATA") {
              Get.snackbar(
                'Проверьте данные входа',
                'Логин или пароль неверны',
                snackPosition: SnackPosition.TOP,
              );
              switchForm(newFormType: FormType.login);
            }
          }
        },
      );
    }
  }

  Future<void> _savePassAndLoginInLocalStorage(
      {required String? username, required String? newPassword}) async {
    userName = username;
    password = newPassword;
    update();
    // логин save secure
    await _storageSecure?.write(
      key: 'username',
      value: username,
      iOptions: const IOSOptions(
        accessibility: KeychainAccessibility.first_unlock,
      ),
    );

    //save пароль с шифрованием через save secure
    await _storageSecure?.write(
      key: 'password',
      value: newPassword,
      iOptions: const IOSOptions(
        accessibility: KeychainAccessibility.first_unlock,
      ),
    );
  }

  ///для виджета регистрация
  Future<bool> signUpUser(
      {required RegistrationDataModel registrationData}) async {
    return await _services.postSignUpUserDataAuth(
        registrationData: registrationData);
  }

  ///для восстановления пароля
  Future<void> passwordRecovery({required String code}) async {
    // await _services.signUpUserDataAuth(registrationData: registrationData);
  }

  ///Роут для запроса на сброс пароля +

  ///для обновлеения почты
  Future<void> updateEmail({required String newEmail}) async {
    await _services.updateEmailData(
        newEmail: newEmail.toLowerCase(),
        accessToken: userAuthorizedData!.accessToken);
    switchForm(newFormType: FormType.login);
  }

  Future<void> signOut() async {
    userAuthorizedData = null;
    update();
    // userAuthorizedData = null;
    // update();
    // // обнуляю пароли

    // await _savePassAndLoginInLocalStorage(
    //   username: userName,
    //   newPassword: null,
    // );
    //
    // await Get.deleteAll(force: true); //deleting all controllers
    // Phoenix.rebirth(Get.context!); // Restarting app
    // Get.reset(); // resetting getx
    // print('signOut');
  }

  ///для верификации почты
  Future<void> verifyEmail({required String code}) async {
    await _services.verifyEmailData(code: code);
  }
}
