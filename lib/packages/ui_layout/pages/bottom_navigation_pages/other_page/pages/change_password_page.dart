import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/main_login_page.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/sliver_sceleton_pages/sliver_sceleton_without_borders.dart';
import 'package:business_layout/business_layout.dart';
import 'package:model/model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChangePasswordOtherPage extends StatelessWidget {
  static const String id = '/changePasswordOtherPage';

  const ChangePasswordOtherPage({Key? key}) : super(key: key);

  static openChangePasswordOtherPage({required BuildContext context}) =>
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: RouteSettings(name: ChangePasswordOtherPage.id),
        screen: ChangePasswordOtherPage(),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );

  @override
  Widget build(BuildContext context) {
    return MySliverNewPageWithoutBorder(
      titleAppBar: 'Изменение пароля',
      widgetBody: _BodyChangePasswordOtherPage(),
    );
  }
}

class _BodyChangePasswordOtherPage extends StatefulWidget {
  const _BodyChangePasswordOtherPage({Key? key}) : super(key: key);

  @override
  State<_BodyChangePasswordOtherPage> createState() =>
      _BodyChangePasswordOtherPageState();
}

class _BodyChangePasswordOtherPageState
    extends State<_BodyChangePasswordOtherPage> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordControllerRepeat =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool successMessage = false;

  void _submit(
      {required String newPassword, required String lastPassword}) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      OtherControllerGetxState.instance
          .updatePassword(newPassword: newPassword, lastPassword: lastPassword)
          .then((value) {
        setState(() {
          successMessage = true;
          Navigator.of(context).pop();
        });
      });
    }
  }

  Rx<int> _status = 0.obs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtherControllerGetxState>(
      builder: (controllerOther) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.78,
          child: Column(
            children: [
              mySizedHeightBetweenContainer,
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: TextFormField(
                          cursorColor: myColorIsActive,
                          controller: _oldPasswordController,
                          key: const Key('fieldPassword'),
                          validator: (value) {
                            if (value == '') return 'Введите пароль';

                            return null;
                          },
                          decoration: myStyleTextField(
                            context,
                            labelText: 'Введите старый пароль...',
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
                          controller: _passwordController,
                          key: const Key('fieldPassword'),
                          onChanged: (value) {
                            int _length = value!.split('').length;

                            if (_length > 0 && _length < 5) {
                              _status.value = 0;
                            } else if (_length >= 5 && _length <= 10) {
                              _status.value = 1;
                            } else if (_length > 10) {
                              _status.value = 2;
                            }
                          },
                          validator: (value) {
                            if (value == '')
                              return 'Введите пароль от 6 символов';
                            if (value!.split('').length > 15)
                              return 'Некорректный пароль';
                            return null;
                          },
                          decoration: myStyleTextField(
                            context,
                            labelText: 'Введите новый пароль...',
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
                            if (value == '')
                              return 'Введите пароль от 6 символов';
                            if (value!.split('').length < 6 ||
                                value!.split('').length > 15)
                              return 'Некорректный пароль';
                            if (_passwordControllerRepeat.text !=
                                _passwordController.text)
                              return "Пароли не совпадают";
                            return null;
                          },
                          decoration: myStyleTextField(
                            context,
                            labelText: 'Повторите новый пароль...',
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
                      Obx(
                        () => Row(
                          children: [
                            Text(
                              "Пароль: ",
                              style: myTextStyleFontUbuntu(
                                  fontSize: 13,
                                  newFontWeight: FontWeight.w300,
                                  context: context),
                            ),
                            Text(
                              _status.value == 0
                                  ? 'слабый'
                                  : _status.value == 1
                                      ? 'средний'
                                      : _status.value == 2
                                          ? 'надежный'
                                          : '',
                              style: myTextStyleFontUbuntu(
                                  textColor: (_status.value == 0)
                                      ? Colors.red
                                      : (_status.value == 1)
                                          ? Color.fromRGBO(209, 186, 141, 1)
                                          : _status.value == 2
                                              ? Colors.green
                                              : Colors.transparent,
                                  fontSize: 13,
                                  newFontWeight: FontWeight.w300,
                                  context: context),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (successMessage)
                Text(
                  'Пароль успешно обновлен',
                  style: myTextStyleFontUbuntu(
                      textColor: myColorIsActive, context: context),
                ),
              const SizedBox(height: myTopPaddingForContent),
              ElevatedButton(
                onPressed: () async {
                  _submit(
                    newPassword: _passwordController.text,
                    lastPassword: _oldPasswordController.text,
                  );
                },
                child: Text('СОХРАНИТЬ'),
              ),
            ],
          ),
        );
      },
    );
  }
}
