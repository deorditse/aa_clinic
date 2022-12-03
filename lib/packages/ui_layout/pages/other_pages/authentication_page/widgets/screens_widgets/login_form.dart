import 'dart:convert' as convert;
import 'package:aa_clinic/packages/model/lib/model.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/main_login_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../utils/validate_email.dart';
import 'package:business_layout/business_layout.dart';
import 'package:http/http.dart' as http;

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        titleTextForAuth(
          titleText: 'ВОЙДИТЕ В АККАУНТ',
          context: context,
        ),
        Expanded(child: _FormSignIn()),
      ],
    );
  }
}

class _FormSignIn extends StatelessWidget {
  _FormSignIn({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _submit(
      {required String username, required String password}) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Get.offNamed('/main');///todo delete
      await ImplementAuthController.instance
          .signInUser(username: username.trim(), password: password.trim())
          .then(
        (status) {
          if (status == '200') {
          } else if (status == '401') {
            Get.snackbar(
              'Неправильные данные',
              'Проверьте поля логина и пароля!',
              snackPosition: SnackPosition.TOP,
            );
          } else {
            Get.snackbar(
              'Exception',
              'Status $status',
              snackPosition: SnackPosition.TOP,
            );
          }
        },
      );
    }
  }

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImplementAuthController>(
      builder: (controllerAuth) {
        _nameController.text = controllerAuth.userName?.trim() ?? '';
        _passwordController.text = controllerAuth.password?.trim() ?? '';

        return Column(
          children: [
            //for test
            // Text(
            //   controllerAuth.userAuthorizedData?.accessToken ?? 'null',
            //   maxLines: 1,
            // ),
            Expanded(
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      //for testing
                      key: Key('fieldEmail'),
                      cursorColor: myColorIsActive,
                      validator: (value) {
                        if (value == '') return 'Введите логин';

                        if (_nameController.text.contains('@') &&
                            !validateEmail(value!)) {
                          return 'Поле содержит недопустимые символы';
                        }
                        return null;
                      },

                      controller: _nameController,
                      keyboardType: TextInputType.text,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.singleLineFormatter,
                      ],
                      decoration: myStyleTextField(
                        context,
                        labelText: 'Введите логин...',
                        hintText: 'логин',
                        // helperText: 'Поле для поиска заметок',
                      ),
                    ),
                    const SizedBox(height: myTopPaddingForContent),
                    TextFormField(
                      cursorColor: myColorIsActive,
                      controller: _passwordController,
                      key: const Key('fieldPassword'),
                      validator: (value) {
                        if (value == '') return 'Введите пароль';
                        //if (value.length.toInt() > 11) return 'Некорректный номер телефона';
                        return null;
                      },
                      decoration: myStyleTextField(
                        context,
                        labelText: 'Введите пароль...',
                        hintText: '*****',
                        // helperText: 'Поле для поиска заметок',
                      ),
                      onFieldSubmitted: (password) => _submit(
                        username: _nameController.text,
                        password: password,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.singleLineFormatter,
                      ],
                      obscureText: true,
                    ),
                    mySizedHeightBetweenContainer,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            ImplementAuthController.instance.switchForm(
                              newFormType: FormType.passwordRecovery,
                            );
                          },
                          child: Text(
                            'Забыли пароль',
                            style: myTextStyleFontUbuntu(
                                context: context,
                                fontSize: 14,
                                textColor: myColorIsActive),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            ImplementAuthController.instance
                                .switchForm(newFormType: FormType.register);
                          },
                          child: Text(
                            'У меня нет аккаунта',
                            style: myTextStyleFontUbuntu(
                                context: context,
                                fontSize: 14,
                                textColor: myColorIsActive),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              child: Text('ВОЙТИ'),
              onPressed: () {
                _submit(
                  username: _nameController.text,
                  password: _passwordController.text,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
