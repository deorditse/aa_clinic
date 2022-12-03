import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:aa_clinic/packages/data_layout/lib/data_layout.dart';
import 'package:model/model.dart';
import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/main_login_page.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/material_sceleton_without_borders.dart';
import 'package:business_layout/business_layout.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/container_for_photo.dart';

import '../edit_profile_page/widgets/add_photo_bottom_sheet_widget_edit_photo.dart';
import 'widgets/add_photo_bottom_sheet_widget_add_document.dart';

class AddNewDocumentProfilePage extends StatelessWidget {
  static const String id = '/addNewDocumentProfilePage';

  const AddNewDocumentProfilePage({Key? key}) : super(key: key);

  static addPageNewDocumentProfilePage({required context}) =>
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: RouteSettings(name: AddNewDocumentProfilePage.id),
        screen: AddNewDocumentProfilePage(),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );

  @override
  Widget build(BuildContext context) {
    return MyMaterialNewPageWithoutBorder(
      titleAppBar: 'Документы',
      widgetBody: _BodyAddNewDocumentProfilePage(),
    );
  }
}

class _BodyAddNewDocumentProfilePage extends StatefulWidget {
  const _BodyAddNewDocumentProfilePage({Key? key}) : super(key: key);

  @override
  State<_BodyAddNewDocumentProfilePage> createState() =>
      _BodyAddNewDocumentProfilePageState();
}

class _BodyAddNewDocumentProfilePageState
    extends State<_BodyAddNewDocumentProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool successMessage = false;
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  Future<List<String>> getListCoverId() async {
    List<String> _listCoverId = [];
    for (var newFileImage
        in ProfileControllerGetxState.instance.listWithPhotoImage) {
      await ProfileControllerGetxState.instance
          .postAttachmentsAndGetIdImage(fileImage: newFileImage)
          .then(
        (idFile) {
          if (idFile != null) {
            _listCoverId.add(idFile);
          }
        },
      );
    }
    return _listCoverId;
  }

  Future<void> _submit({
    required String title,
    required String? description,
  }) async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      setState(() {
        successMessage = true;
      });
      //достану все coverID
      List<String> _listWithCoverId = await getListCoverId();
      await ProfileControllerGetxState.instance.postPatientDocuments(
        category: 'Здоровье',
        title: title,
        description: description,
        attachmentsIds: _listWithCoverId,
      );

      //обнуляю лист с фото
      ProfileControllerGetxState.instance
          .changeListWithPhotoImage(isRemoveAll: true);

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      mySizedHeightBetweenContainer,
                      TextFormField(
                        cursorColor: myColorIsActive,
                        controller: _nameController,
                        key: Key('addName'),
                        validator: (value) {
                          if (value == '') {
                            return 'Введите название документа';
                          }
                          return null;
                        },
                        //если нет контроллера, можно делать через initialValue
                        // initialValue: dataUser?.surname,
                        decoration: myStyleTextField(
                          context,
                          labelText: 'Введите название документа...',
                        ),
                      ),
                      const SizedBox(height: myTopPaddingForContent),
                      SizedBox(
                        // width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          maxLines: 10,
                          cursorColor: myColorIsActive,
                          controller: _descriptionController,
                          key: Key('fieldDeccript'),
                          //for testing
                          decoration: myStyleTextField(
                            context,
                            labelText: 'Введите описание...',
                          ).copyWith(
                            alignLabelWithHint: true,
                          ),
                          // validator: (value) {
                          //   if (value == '') return 'Введите описание';
                          //   return null;
                          // },
                        ),
                      ),
                      // mySizedHeightBetweenContainer,
                    ],
                  ),
                ),
                mySizedHeightBetweenContainer,
                _gridWithPhoto(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: _rowWithPhotoButton(),
                ),
                const SizedBox(height: myTopPaddingForContent * 5),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (successMessage)
                  Text(
                    'Загрузка на сервер',
                    style: myTextStyleFontUbuntu(
                        context: context, textColor: myColorIsActive),
                  ),
                const SizedBox(height: myTopPaddingForContent),
                Align(
                  alignment: Alignment.bottomRight,
                  child: _buttonRow(context: context),
                ),
                mySizedHeightBetweenContainer,
              ],
            ),
          )
        ],
      ),
    );
  }

  _gridWithPhoto() {
    return GetBuilder<ProfileControllerGetxState>(
      builder: (controllerProfile) {
        return controllerProfile.listWithPhotoImage.isNotEmpty
            ? GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                primary: false,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: myHorizontalPaddingForContainer,
                  crossAxisSpacing: myHorizontalPaddingForContainer,
                  childAspectRatio: 0.8,
                ),
                itemCount: controllerProfile.listWithPhotoImage.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Container(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        decoration: myStyleContainer(context: context),
                        clipBehavior: Clip.hardEdge,
                        child: Image.file(
                          controllerProfile.listWithPhotoImage[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: () {
                              ProfileControllerGetxState.instance
                                  .changeListWithPhotoImage(index: index);
                            },
                            icon: Icon(
                              Icons.close,
                              color: Colors.red,
                            )),
                      ),
                    ],
                  );
                },
              )
            : Container();
      },
    );
  }

  _buttonRow({required BuildContext context}) {
    return ElevatedButton(
      onPressed: () => _submit(
        title: _nameController.text,
        description: _descriptionController.text,
      ),
      child: Text('СОХРАНИТЬ'),
    );
  }

  _rowWithPhotoButton() {
    return TextButton(
      style:
          const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
      onPressed: () {
        FocusManager.instance.primaryFocus?.unfocus();
        showAddPhotoBottomSheetWidgetProfilePage(context: context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            Get.isDarkMode
                ? 'assets/icons/camera.svg'
                : 'assets/icons/for_light_theme/camera_light.svg',
            semanticsLabel: 'camera',
            fit: BoxFit.cover,
          ),
          const SizedBox(width: myHorizontalPaddingForContainer),
          Text(
            'Добавить фото...',
            style: myTextStyleFontUbuntu(
                context: context,
                textColor: Theme.of(context).textTheme.headline3!.color),
          ),
        ],
      ),
    );
  }
}
