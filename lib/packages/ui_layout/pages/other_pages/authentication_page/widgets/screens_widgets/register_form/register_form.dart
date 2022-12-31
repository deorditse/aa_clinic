import 'package:model/model.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/main_login_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/validate_email.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _FormRegistration();
  }
}

class _FormRegistration extends StatefulWidget {
  const _FormRegistration({Key? key}) : super(key: key);

  @override
  State<_FormRegistration> createState() => _FormRegistrationState();
}

class _FormRegistrationState extends State<_FormRegistration> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isSuccess = false;
  Rx<bool> browsingPrivacy = true.obs;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _passwordControllerRepeat =
      TextEditingController();

  Future<void> _handleSubmit(
      {required RegistrationDataModel registrationData}) async {
//сначала проверим прохождение валидации
    if (_formKey.currentState!.validate() && browsingPrivacy.value) {
      bool result = await ImplementAuthController.instance
          .signUpUser(registrationData: registrationData);
      if (result) {
        setState(() {
          _isSuccess = true;
        });
        ImplementAuthController.instance
            .switchForm(newFormType: FormType.confirmMail);
      } else {
        setState(() {
          _isSuccess = false;
        });
      }
    }
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
                titleTextForAuth(
                  titleText: 'РЕГИСТРАЦИЯ',
                  context: context,
                ),
                Flexible(
                  child: TextFormField(
                    cursorColor: myColorIsActive,
                    controller: _nameController,
                    key: Key('fieldName'),
                    //for testing
                    decoration: myStyleTextField(
                      context,
                      labelText: 'Имя...',
                      hintText: 'Ввод имени',
                    ),

                    validator: (value) {
                      if (value == '') return 'Введите имя';
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: myTopPaddingForContent),
                Flexible(
                  child: TextFormField(
                    cursorColor: myColorIsActive,
                    controller: _lastNameController,
                    key: Key('fieldLastName'),
                    decoration: myStyleTextField(
                      context,
                      labelText: 'Фамилия...',
                      hintText: 'Ввод фамилии',
                    ),
                    validator: (value) {
                      if (value == '') return 'Введите фамилию';
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: myTopPaddingForContent),
                Flexible(
                  child: TextFormField(
                    cursorColor: myColorIsActive,
                    controller: _emailController,
                    key: Key('fieldEmail'),
                    decoration: myStyleTextField(
                      context,
                      labelText: 'Почта...',
                      hintText: 'test@test.com',
                      // helperText: 'Поле для поиска заметок',
                    ),
                    validator: (value) {
                      if (value == '') return 'Заполните поле email';
                      if (!validateEmail(value!)) return 'Емейл не корректный';
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: myTopPaddingForContent),
                Flexible(
                  child: TextFormField(
                    cursorColor: myColorIsActive,
                    controller: _passwordController,
                    key: const Key('fieldPassword'),
                    validator: (value) {
                      if (value == '') return 'Введите пароль от 6 символов';
                      if (value!.split('').length < 4 ||
                          value!.split('').length > 15)
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
                      if (value!.split('').length < 4 ||
                          value!.split('').length > 15)
                        return 'Некорректный пароль';
                      if (_passwordControllerRepeat.text !=
                          _passwordController.text)
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
                _browsingPrivacy(),
              ],
            ),
          ),
        ),
        ElevatedButton(
            child: Text('ДАЛЕЕ'),
            onPressed: () {
              _handleSubmit(
                  registrationData: RegistrationDataModel(
                firstName: _nameController.text,
                lastName: _lastNameController.text,
                email: _emailController.text,
                password: _passwordController.text,
              ));
            }),
      ],
    );
  }

  Widget _browsingPrivacy() {
    return Obx(
      () => GestureDetector(
        onTap: () {
          browsingPrivacy.value = !browsingPrivacy.value;
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: Container(
                  color: Get.isDarkMode
                      ? Color.fromRGBO(82, 82, 82, 0.5)
                      : Color.fromRGBO(212, 214, 219, 0.5),
                  child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SvgPicture.asset(
                        'assets/icons/circle_point.svg',
                        semanticsLabel: 'circle_point',
                        color:
                            browsingPrivacy.value ? null : Colors.transparent,
                        fit: BoxFit.contain,
                        alignment: Alignment.centerLeft,
                      )),
                ),
              ),
              const SizedBox(
                width: myHorizontalPaddingForContainer,
              ),
              Text(
                'Принимаю политику конфиденциальности',
                style: myTextStyleFontUbuntu(
                  context: context,
                  fontSize: 12,
                  textColor: browsingPrivacy.value
                      ? Theme.of(context).textTheme.headline3!.color
                      : Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
