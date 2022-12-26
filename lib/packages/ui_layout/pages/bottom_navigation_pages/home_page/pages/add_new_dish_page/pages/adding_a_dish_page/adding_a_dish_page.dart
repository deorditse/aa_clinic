import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:aa_clinic/packages/data_layout/lib/data_layout.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/main_bottom_menu_sceleton.dart';
import 'package:business_layout/business_layout.dart';
import 'package:model/model.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/material_sceleton_without_borders.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'widgets/button_add_dish_card.dart';
import 'package:http/http.dart' as http;

import 'widgets/dish_enable_card/dish_enable_card.dart';

class AddNewEventHomePage extends StatelessWidget {
  static const String id = '/addNewEventHomePage';

  const AddNewEventHomePage({Key? key, this.title, this.description})
      : super(key: key);
  final String? title;
  final String? description;

  static addNewEventHomePage({
    required context,
    required String title,
    required String? description,
  }) =>
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: RouteSettings(name: AddNewEventHomePage.id),
        screen: AddNewEventHomePage(title: title, description: description),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );

  @override
  Widget build(BuildContext context) {
    return MyMaterialNewPageWithoutBorder(
      titleAppBar: 'Добавление блюда',
      widgetBody: _BodyAddNewEventHomePage(
        title: title!,
        description: description,
      ),
    );
  }
}

RxSet<int> listIndexWherePhotosNotAdded = <int>{}.obs;

class _BodyAddNewEventHomePage extends StatefulWidget {
  const _BodyAddNewEventHomePage(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  final String title;
  final String? description;

  @override
  State<_BodyAddNewEventHomePage> createState() =>
      _BodyAddNewEventHomePageState();
}

class _BodyAddNewEventHomePageState extends State<_BodyAddNewEventHomePage> {
  RxString messageInfo = "".obs;

  Future<void> _submit({
    required String title,
    required String? description,
    required BuildContext context,
  }) async {
    FocusManager.instance.primaryFocus?.unfocus();
    messageInfo.value = "Проверка данных...";
    Rx<bool> _isAllValidate = false.obs;
    final List<AddNewDishCardModel> modelDishCardList =
        ImplementAddNewDishController.instance.modelDishCardList;

    for (var modelDish in modelDishCardList) {
      if (modelDish.globalKeyFormState.currentState!.validate()) {
        modelDish.globalKeyFormState.currentState!.save();
        _isAllValidate.value = true;
      } else {
        _isAllValidate.value = false;
        messageInfo.value = "";
      }
      if (modelDish.nutriDish.file == null) {
        listIndexWherePhotosNotAdded.add(modelDishCardList.indexOf(modelDish));
        messageInfo.value = "";
      }
    }

    List<NutriDishModel> _listDishes = [];

    if (listIndexWherePhotosNotAdded.isEmpty && _isAllValidate.value) {
      messageInfo.value = "Отправка фото на сервер...";
      for (var dish in modelDishCardList) {
        if (dish.nutriDish.file != null) {
          await ImplementSettingGetXController.instance
              .postStaticFilesAndGetIdImage(
            filePath: dish.nutriDish.file!.path,
            isAttachmentsRoute: false,
          )
              .then(
            (coverId) {
              if (coverId != null) {
                dish.nutriDish.lifeImage = coverId;
                dish.nutriDish.image = coverId;
              }
            },
          );

          //обнуляю файл
          dish.nutriDish.file = null;
          _listDishes.add(dish.nutriDish);
        } else {
          print(
              "dish.nutriDish.file == null from _BodyAddNewEventHomePageState");
        }
      }
      messageInfo.value = "Завершение загрузки...";
      await HomePageCalendarControllerGetxState.instance.postNutriMeals(
        title: title,
        description: description,
        listDishes: _listDishes,
      );

      Navigator.of(context).pop();
      Navigator.of(context).pop();
      //cleat all list
      ImplementAddNewDishController.instance
          .changeListAddDishEnableCard(index: 0);
      messageInfo.value = "";
    } else {
      Get.snackbar(
        '',
        'Не все поля заполнены',
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    Get.put(ImplementAddNewDishController());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImplementAddNewDishController>(
      builder: (controllerAddDish) {
        return Stack(
          children: [
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              primary: false,
              itemCount: controllerAddDish.modelDishCardList.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: myTopPaddingForContent),
                      child: AddDishEnableCard(index: index),
                    ),
                    if (index == controllerAddDish.modelDishCardList.length - 1)
                      Padding(
                        padding: EdgeInsets.only(bottom: Get.height / 15),
                        child: addDishDisableCard(
                          context: context,
                          index: index + 1,
                        ),
                      ),
                  ],
                );
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: myTopPaddingForContent,
                      ),
                      child: Text(
                        messageInfo.value,
                        style: myTextStyleFontUbuntu(
                            context: context, textColor: myColorIsActive),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _submit(
                          title: widget.title,
                          description: widget.description,
                          context: context,
                        );
                      },
                      child: Text('СОХРАНИТЬ'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
