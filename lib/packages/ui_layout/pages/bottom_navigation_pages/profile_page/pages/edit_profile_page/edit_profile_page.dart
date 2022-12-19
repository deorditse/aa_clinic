import 'dart:convert';
import 'dart:io';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/profile_page/top_proile_widget/row_with_photo_and_progress.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/profile_page/top_proile_widget/top_proile_widget.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/sceleton_show_bottomSheet.dart';
import 'package:business_layout/business_layout.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:model/model.dart';
import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/main_login_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/utils/validate_email.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'widgets/add_photo_bottom_sheet_widget_edit_photo.dart';
import 'package:http/http.dart' as http;

class BodyEditProfilePage extends StatelessWidget {
  static const String id = '/bodyEditProfilePage';

  const BodyEditProfilePage({Key? key}) : super(key: key);

  static showBottomSheetWidgetBodyEditProfilePage({required context}) {
    showBottomSheetContainer(
      context: context,
      titleAppBar: 'Редактирование профиля',
      widgetBody: BodyEditProfilePage(),
      deleteAppBar: true,
      bottomBorderRadius: true,
      enableDrag: false,
      expand: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          Platform.isAndroid ? Get.size.height * 0.8 : Get.size.height * 0.76,
      child: MediaQuery(
        data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: RowWithPhotoAndProgress(
                deleteOnTap: true,
                voidCallbackOnPhotoUser: () {
                  showAddPhotoBottomSheetWidgetEditPhotoUserPage(
                    context: context,
                  );
                },
              ),
            ),
            Expanded(
              flex: 8,
              child: _UserDataEditingForms(),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserDataEditingForms extends StatefulWidget {
  const _UserDataEditingForms({Key? key}) : super(key: key);

  @override
  State<_UserDataEditingForms> createState() => _UserDataEditingFormsState();
}

class _UserDataEditingFormsState extends State<_UserDataEditingForms> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RxString statusMessage = ''.obs;

  Future<void> _submit({required UserDataModel userEdit}) async {
    if (_formKey.currentState!.validate() && statusMessage.value == '') {
      _formKey.currentState!.save();

      statusMessage.value = 'Обновление...';

      await ImplementSettingGetXController.instance
          .updateMeUser(editUserAllData: userEdit);

      statusMessage.value = 'Данные успешно обновлены';
      //для обновления аватарки
      if (ProfileControllerGetxState.instance.photoProfile != null) {
        await ProfileControllerGetxState.instance.postSetAvatarData().then(
              (value) => print(value),
            );
      }
      Navigator.of(context).pop();
    }
  }

  //делаю копию данных для редактирования
  late UserDataModel _userForEdit;

  @override
  void initState() {
    super.initState();
    statusMessage.value = '';
    _userForEdit = ImplementSettingGetXController.instance.userAllData!;
  }

  var maskFormatterPhoneNumber = MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  var maskFormatterBdate = MaskTextInputFormatter(
      mask: '##.##.####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImplementSettingGetXController>(
      builder: (controllerSetting) {
        UserDataModel? userDataProfile = controllerSetting.userAllData;

        String? _getInitialValuebBdate() {
          if (userDataProfile?.bdate != null) {
            final _res = DateTime.parse(userDataProfile!.bdate!);
            return DateFormat.yMd().format(_res);
          }
        }

        return Column(
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: myTopPaddingForContent),
                    const SizedBox(height: myTopPaddingForContent),
                    Flexible(
                      child: TextFormField(
                        initialValue: userDataProfile?.lastName,
                        cursorColor: myColorIsActive,
                        key: Key('fieldLastName'),
                        validator: (value) {
                          if (value == '') return 'Введите фамилию';
                          return null;
                        },
                        onFieldSubmitted: (lastName) {
                          _userForEdit.lastName = lastName;
                        },

                        //если нет контроллера, можно делать через initialValue
                        decoration: myStyleTextField(
                          context,
                          labelText: 'Фамилия...',
                        ),
                      ),
                    ),
                    const SizedBox(height: myTopPaddingForContent),
                    Flexible(
                      child: TextFormField(
                        cursorColor: myColorIsActive,
                        initialValue: userDataProfile?.firstName,
                        key: Key('fieldName'),
                        //for testing
                        decoration: myStyleTextField(
                          context,
                          labelText: 'Имя...',
                        ),
                        onFieldSubmitted: (firstName) {
                          _userForEdit.firstName = firstName;
                        },

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
                        key: Key('patronymic'),
                        //for testing
                        initialValue: userDataProfile?.middleName,

                        onFieldSubmitted: (middleName) {
                          _userForEdit.middleName = middleName;
                        },
                        decoration: myStyleTextField(
                          context,
                          labelText: 'Отчество...',
                        ),
                        /*validator: (value) {
                          if (value == '') return 'Введите отчество';
                          return null;
                        },*/
                      ),
                    ),
                    const SizedBox(height: myTopPaddingForContent),
                    Flexible(
                      child: TextFormField(
                        cursorColor: myColorIsActive,
                        key: Key('dateOfBirth'),
                        validator: (value) {
                          //if (value == '') return 'Введите дату рождения';
                          if (value != '' &&
                              value!.split('.').toString().length < 14)
                            return 'Некорректная дата рождения';
                          return null;
                        },
                        initialValue: _getInitialValuebBdate(),
                        onFieldSubmitted: (bdate) {
                          if (bdate.length == 10) {
                            List<String?> _res = bdate.split('.').toList();
                            _userForEdit.bdate =
                                '${_res[2] ?? ''}-${_res[1] ?? ''}-${_res[0] ?? ''}';
                          }
                        },
                        decoration: myStyleTextField(
                          context,
                          labelText: 'Дата рождения...',
                          hintText: '05.08.1998',
                        ),
                        keyboardType: TextInputType.datetime,
                        inputFormatters: [maskFormatterBdate],
                      ),
                    ),
                    const SizedBox(height: myTopPaddingForContent),
                    Flexible(
                      child: TextFormField(
                        //for testing
                        key: Key('fieldEmail'),
                        cursorColor: myColorIsActive,

                        onFieldSubmitted: (email) {
                          _userForEdit.email = email;
                        },
                        // validator: (value) {
                        //   if (value == '') return 'Заполните поле email';
                        //   if (!validateEmail(
                        //       value!)) //проверка на совпадения символам
                        //     return 'Поле содержит недопустимые символы';
                        //   return null;
                        // },
                        initialValue: userDataProfile?.email,
                        // controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        // initialValue: '${dataProfile?.email}',
                        decoration: myStyleTextField(
                          context,
                          labelText: 'Почта...',
                          hintText: 'test@test.com',
                        ),
                      ),
                    ),
                    const SizedBox(height: myTopPaddingForContent),
                    Flexible(
                      child: TextFormField(
                          cursorColor: myColorIsActive,
                          key: Key('fieldPhone'),
                          validator: (value) {
                            //if (value == '') return 'Введите телефон';

                            if (value != '' && value!.length.toInt() < 18)
                              return 'Некорректный номер телефона';
                            return null;
                          },
                          initialValue: userDataProfile?.phoneNumber,
                          decoration: myStyleTextField(
                            context,
                            labelText: 'Телефон...',
                            hintText: '+7 (123) 456-78-90',
                            // helperText: 'Поле для поиска заметок',
                          ),
                          onFieldSubmitted: (phoneNumber) {
                            _userForEdit.phoneNumber = phoneNumber;
                          },
                          keyboardType: TextInputType.phone,
                          inputFormatters: [maskFormatterPhoneNumber]),
                    ),
                    mySizedHeightBetweenContainer,
                    _rowWithCheckBox(),
                  ],
                ),
              ),
            ),
            Obx(
              () => Column(
                children: [
                  if (statusMessage.value != '')
                    Text(
                      '${statusMessage.value}',
                      style: myTextStyleFontUbuntu(
                          context: context, textColor: myColorIsActive),
                    ),
                ],
              ),
            ),
            const SizedBox(height: myTopPaddingForContent),
            _buttonRow(context: context, userEdit: _userForEdit),
          ],
        );
      },
    );
  }

  _buttonRow({required BuildContext context, required UserDataModel userEdit}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Color.fromRGBO(224, 121, 114, 1),
            ),
          ),
          onPressed: () {
            ProfileControllerGetxState.instance.changePhotoProfile(file: null);
            Navigator.of(context).pop();
          },
          child: Text('ОТМЕНИТЬ'),
        ),
        ElevatedButton(
          onPressed: () {
            _submit(userEdit: userEdit);
          },
          child: Text('СОХРАНИТЬ'),
        ),
      ],
    );
  }

  _rowWithCheckBox() {
    //получаю гендер
    final int? isGender =
        ImplementSettingGetXController.instance.userAllData!.gender;

    Rx<bool> manCheckbox = (isGender == 0
            ? false
            : isGender == 2
                ? true
                : false)
        .obs;
    Rx<bool> womanCheckbox = (isGender == 0
            ? false
            : isGender == 1
                ? true
                : false)
        .obs;

    return Row(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              if (!manCheckbox.value) {
                _userForEdit.gender = 2;
                manCheckbox.value = true;
                womanCheckbox.value = false;
              } else {}
            },
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  child: Container(
                    color: Get.isDarkMode
                        ? Color.fromRGBO(82, 82, 82, 0.5)
                        : Color.fromRGBO(212, 214, 219, 0.5),
                    child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Obx(
                          () => SvgPicture.asset(
                            'assets/icons/circle_point.svg',
                            semanticsLabel: 'circle_point',
                            color:
                                manCheckbox.value ? null : Colors.transparent,
                            fit: BoxFit.contain,
                            alignment: Alignment.centerLeft,
                          ),
                        )),
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  'Муж',
                  style: myTextStyleFontUbuntu(
                    context: context,
                    textColor: Theme.of(context).textTheme.headline2!.color,
                    newFontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              if (!womanCheckbox.value) {
                _userForEdit.gender = 1;
                womanCheckbox.value = true;
                manCheckbox.value = false;
              }
            },
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  child: Container(
                    color: Get.isDarkMode
                        ? Color.fromRGBO(82, 82, 82, 0.5)
                        : Color.fromRGBO(212, 214, 219, 0.5),
                    child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Obx(
                          () => SvgPicture.asset(
                            'assets/icons/circle_point.svg',
                            semanticsLabel: 'circle_point',
                            color:
                                womanCheckbox.value ? null : Colors.transparent,
                            fit: BoxFit.contain,
                            alignment: Alignment.centerLeft,
                          ),
                        )),
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  'Жен',
                  style: myTextStyleFontUbuntu(
                    context: context,
                    newFontWeight: FontWeight.w300,
                    textColor: Theme.of(context).textTheme.headline2!.color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
