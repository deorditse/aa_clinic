import 'dart:async';
import 'package:aa_clinic/packages/data_layout/lib/data_layout.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/utils/validate_email.dart';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/main_login_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PasswordRecovery extends StatelessWidget {
  const PasswordRecovery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        titleTextForAuth(
          titleText: 'ВОССТАНОВЛЕНИЕ ПАРОЛЯ',
          context: context,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(child: _SendCode()),
              const SizedBox(height: myTopPaddingForContent),
              mySizedHeightBetweenContainer,
            ],
          ),
        ),
      ],
    );
  }
}

class _SendCode extends StatelessWidget {
  _SendCode({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  // final TextEditingController _codeController = TextEditingController();
  Rx<String> _codeController = ' '.obs;

  Rx<bool> timeMessage = false.obs;

  void _submit() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      await ImplementAuthController.instance
          .postResetPasswordRequest(
        emailUser: '${_emailController.text}',
      )
          .then(
        (value) {
          if (value.keys.first == '200') {
            timeMessage.value = true;

            _timerPeriodicForCode();
          } else if (value.keys.first == '404') {
            Get.snackbar(
              '',
              'Пользователь не найден (проверьте email или зарегистрируйтесь)',
              snackPosition: SnackPosition.TOP,
            );
          } else if (value.keys.first == '429') {
            Get.snackbar(
              '',
              'Частые запросы кода, подождите',
              snackPosition: SnackPosition.TOP,
            );
          } else {
            Get.snackbar(
              'Ошибка',
              'Проверьте email или зарегистрируйтесь',
              snackPosition: SnackPosition.TOP,
            );
          }
        },
      );
    }
  }

  final Rx<int> _timerData = 45.obs;

  _timerPeriodicForCode() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _timerData.value -= 1;
      if (_timerData.value <= 0) {
        timer.cancel();
        _timerData.value = 45;

        timeMessage.value = false;
      }
    });
  }

  var maskFormatterCode = MaskTextInputFormatter(
    mask: '### ###',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Expanded(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Flexible(
                    child: TextFormField(
                      //for testing
                      key: Key('fieldEmail'),
                      cursorColor: myColorIsActive,
                      validator: (value) {
                        if (value == '') return 'Введите логин';
                        if (!validateEmail(
                            value!)) //проверка на совпадения символам
                          return 'Поле содержит недопустимые символы';
                        return null;
                      },
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: myStyleTextField(
                        context,
                        labelText: 'Введите логин...',
                        hintText: '',
                        // helperText: 'Поле для поиска заметок',
                      ),
                    ),
                  ),
                  const SizedBox(height: myTopPaddingForContent),
                  Flexible(
                    child: IntrinsicWidth(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Obx(
                              () => ElevatedButton(
                                child: Text('ОТПРАВИТЬ КОД'),
                                onPressed:
                                    _timerData.value == 45 ? _submit : null,
                              ),
                            ),
                          ),
                          const SizedBox(height: myTopPaddingForContent),
                          Flexible(
                            child: TextField(
                              textAlign: TextAlign.center,
                              // controller: _codeController,
                              cursorColor: myColorIsActive,
                              key: Key('fieldCode'),
                              inputFormatters: [maskFormatterCode],
                              keyboardType: TextInputType.number,
                              decoration: myStyleTextField(
                                context,
                                labelText: 'Код...',
                                hintText: '',
                              ),
                              onChanged: (code) {
                                _codeController.value = code;
                              },
                              onTap: () {
                                timeMessage.value = false;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (timeMessage.value)
                    FittedBox(
                      child: Obx(
                        () => Container(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            _timerData.value <= 45
                                ? '00 : ${_timerData < 10 ? '0' : ''}${_timerData}'
                                : 'запросите заново',
                            style: myTextStyleFontUbuntu(
                              context: context,
                              textColor: Color.fromRGBO(134, 134, 134, 1),
                            ),
                          ),
                        )),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: _UpdatePassword(
              statusValidate: _formKey.currentState?.validate() ?? false,
              email: _emailController.text.toLowerCase(),
              code: _codeController.value.removeAllWhitespace,
            ),
          ),
        ],
      ),
    );
  }
}

class _UpdatePassword extends StatelessWidget {
  _UpdatePassword({
    Key? key,
    required this.email,
    required this.code,
    required this.statusValidate,
  }) : super(key: key);

  final String? code;
  final String? email;
  final bool statusValidate;

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _passwordControllerRepeat =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool successMessage = false;

  ///Роут для сброса пароля +
  Future<Map<String, String?>> postResetPasswordData({
    required String emailUser,
    required String code,
    required String password,
  }) async {
    try {
      Uri url = urlMain(urlPath: 'api/resetPassword');
      var response = await http.post(
        url,
        body: {
          "email": emailUser.toLowerCase(),
          "code": '$code',
          "password": "${password}",
        },
      );
      print(
          'Response status from postResetPasswordData: ${response.statusCode}');

      return {'${response.statusCode}': response.body};
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error from postResetPasswordData: $error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from postResetPasswordData $error ');
      return {};
    }
  }

  _submitResetPassword({
    required String emailUser,
    required String code,
    required String password,
  }) async {
    print(email!);
    print(code);
    print(_passwordController.text);
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (code != null && email != null && statusValidate) {
        postResetPasswordData(
          emailUser: emailUser,
          code: code,
          password: password,
        ).then(
          (value) async {
            if (value.keys.first == '200') {
              Get.snackbar(
                '',
                'Пароль успешно обновлен',
                snackPosition: SnackPosition.TOP,
              );
              await ImplementAuthController.instance
                  .savePassAndLoginInLocalStorage(
                username: emailUser,
                newPassword: password,
              );
              ImplementAuthController.instance
                  .switchForm(newFormType: FormType.login);
            } else if (value.keys.first == '404') {
              Get.snackbar(
                '',
                'Неправильный код',
                snackPosition: SnackPosition.TOP,
              );
            } else {
              Get.snackbar(
                'Ошибка',
                'Проверьте код или email',
                snackPosition: SnackPosition.TOP,
              );
            }
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: TextFormField(
              cursorColor: myColorIsActive,
              controller: _passwordController,
              key: const Key('fieldPassword'),
              validator: (value) {
                if (value == '') return 'Введите пароль от 6 символов';
                if (value!.split('').length < 6 || value!.split('').length > 15)
                  return 'Некорректный пароль';
                return null;
              },
              decoration: myStyleTextField(
                context,
                labelText: 'Введите пароль',
                hintText: '*****',
                // helperText: 'Поле для поиска заметок',
              ),
              keyboardType: TextInputType.visiblePassword,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.singleLineFormatter,
              ],
              obscureText: true,
            ),
          ),
          const SizedBox(height: myTopPaddingForContent),
          Flexible(
            child: TextFormField(
              cursorColor: myColorIsActive,
              controller: _passwordControllerRepeat,
              key: const Key('RepeatFieldPassword'),
              validator: (value) {
                if (value == '') return 'Введите пароль от 6 символов';
                if (value!.split('').length < 6 || value!.split('').length > 15)
                  return 'Некорректный пароль';
                if (_passwordControllerRepeat.text != _passwordController.text)
                  return "Пароли не совпадают";
                return null;
              },
              decoration: myStyleTextField(
                context,
                labelText: 'Повторите пароль',
                hintText: '*****',
                // helperText: 'Поле для поиска заметок',
              ),
              keyboardType: TextInputType.visiblePassword,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.singleLineFormatter,
              ],
              obscureText: true,
            ),
          ),
          const SizedBox(height: myTopPaddingForContent),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                statusValidate
                    ? null
                    : Theme.of(context)
                        .textTheme
                        .headline3!
                        .color!
                        .withOpacity(0.2),
              ),
            ),
            child: Text(
              'ДАЛЕЕ',
            ),
            onPressed: statusValidate
                ? () => _submitResetPassword(
                      emailUser: email!,
                      code: code!,
                      password: _passwordController.text,
                    )
                : null,
          ),
        ],
      ),
    );
  }
}
