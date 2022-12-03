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

class _SendCode extends StatefulWidget {
  const _SendCode({Key? key}) : super(key: key);

  @override
  State<_SendCode> createState() => _SendCodeState();
}

class _SendCodeState extends State<_SendCode> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();

  bool timeMessage = false;


  ///Роут для запроса на сброс пароля +
  Future<Map<String, String?>> postResetPasswordRequestData(
      {required String emailUser}) async {
    try {
      Uri url = Uri.http(urlMainApiConst, 'api/resetPasswordRequest');
      var response = await http.post(
        url,
        body: {"email": emailUser.toLowerCase()},
      );
      print(
          'Response status from postResetPasswordRequestData: ${response.statusCode}');
      if (response.statusCode == 200) {
        Get.snackbar(
          '',
          'Код был отправлен на почту',
          snackPosition: SnackPosition.TOP,
        );

        print(response.body);
      } else {
        print(
            'Bad Request postResetPasswordRequestData: ${response.statusCode} ${response.body}');
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

  void _submit() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      await postResetPasswordRequestData(emailUser: '${_emailController.text}')
          .then(
        (value) {
          if (value.keys.first == '200') {
            setState(() {
              timeMessage = true;
            });
            _timerPeriodicForCode();
          } else if (value.keys.first == '404') {
            Get.snackbar(
              '',
              'Пользователь не найден (проверьте email или зарегистрируйтесь)',
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

        setState(() {
          timeMessage = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                            controller: _codeController,
                            cursorColor: myColorIsActive,
                            key: Key('fieldCode'),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: myStyleTextField(
                              context,
                              labelText: 'Код...',
                              hintText: '',
                            ),
                            onSubmitted: (value) {
                              if (timeMessage) {
                                ///ToDo: create send method
                                print(value);
                              }
                            },
                            // validator: (value) {
                            //   if (value == '') return 'введите код';
                            //   return null;
                            // },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (timeMessage)
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
            statusValidate: timeMessage,
            email: _emailController.text,
            code: _codeController.text,
          ),
        ),
      ],
    );
  }
}

class _UpdatePassword extends StatefulWidget {
  const _UpdatePassword({
    Key? key,
    required this.email,
    required this.code,
    required this.statusValidate,
  }) : super(key: key);

  final String? code;
  final String? email;
  final bool statusValidate;

  @override
  State<_UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<_UpdatePassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordControllerRepeat =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool successMessage = false;


  ///Роут для сброса пароля +
  Future<Map<String, String?>> postResetPasswordData(
      {required String emailUser,
      required String code,
      required String password}) async {
    try {
      Uri url = Uri.http(urlMainApiConst, 'api/resetPassword/');
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
      if (response.statusCode == 200) {
        Get.snackbar(
          '',
          'Код был отправлен на почту',
          snackPosition: SnackPosition.TOP,
        );

        print(response.body);
      } else {
        print(
            'Bad Request postResetPasswordData: ${response.statusCode} ${response.body}');
      }
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

  _submit() async {
    Future.delayed(Duration(seconds: 2)).then((value) {
      ImplementAuthController.instance.switchForm(newFormType: FormType.login);
    });

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (widget.code != null &&
          widget.email != null &&
          widget.statusValidate) {
        postResetPasswordData(
          emailUser: widget.email!,
          code: widget.code!,
          password: _passwordController.text,
        ).then(
          (value) {
            if (value.keys.first == '200') {
              setState(() {
                successMessage = true;
              });
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
                widget.statusValidate
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
            onPressed: widget.statusValidate ? _submit : null,
          ),
          if (successMessage)
            Text(
              'Пароль успешно обновлен',
              style: myTextStyleFontUbuntu(
                  context: context, textColor: myColorIsActive),
            ),
        ],
      ),
    );
  }
}
