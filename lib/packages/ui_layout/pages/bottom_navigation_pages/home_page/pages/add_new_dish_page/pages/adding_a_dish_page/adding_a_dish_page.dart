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
import 'widgets/add_dish_disable_card.dart';
import 'list_with_dish_card.dart';
import 'package:http/http.dart' as http;

import 'widgets/add_dish_enable_card.dart';

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

class _BodyAddNewEventHomePage extends StatelessWidget {
  const _BodyAddNewEventHomePage(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  final String title;
  final String? description;

  Future<void> _submit({
    required List<NutriDishModel> listDishes,
    required String title,
    required String? description,
    required BuildContext context,
  }) async {
    FocusManager.instance.primaryFocus?.unfocus();

    for (var dish in listDishes) {
      if (dish.file == null) {
        listIndexWherePhotosNotAdded.add(listDishes.indexOf(dish));
      }
    }
    Rx<bool> _isAllValidate = false.obs;

    for (var keyForm in listFormKey) {
      if (keyForm.currentState!.validate()) {
        keyForm.currentState!.save();
        _isAllValidate.value = true;
      } else {
        _isAllValidate.value = false;
      }
    }

    if (listIndexWherePhotosNotAdded.isEmpty && _isAllValidate.value) {
      for (var dish in listDishes) {
        await ImplementSettingGetXController.instance
            .postStaticFilesAndGetIdImage(
                fileImage: dish.file!, category: "publicForUsers")
            .then((coverId) {
          dish.lifeImage = coverId;
          dish.image = coverId;
        });
      }
      List<NutriDishModel> _listDishes = [];

      for (var dish in listDishes) {
        dish.file = null;
        _listDishes.add(dish);
      }

      await HomePageCalendarControllerGetxState.instance.postNutriMeals(
        title: title,
        description: description,
        listDishes: _listDishes,
      );
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      //cleat all list
      changeListAddDishEnableCard();
    } else {
      Get.snackbar(
        '',
        'Не все поля заполнены',
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Stack(
          children: [
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              primary: false,
              itemCount: listAddDishEnableCard.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: myTopPaddingForContent),
                      child: listAddDishEnableCard[index],
                    ),
                    if (index == listAddDishEnableCard.length - 1)
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
              child: Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: ElevatedButton(
                  onPressed: () => _submit(
                    title: title,
                    description: description,
                    listDishes: newListDishes,
                    context: context,
                  ),
                  child: Text('СОХРАНИТЬ'),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
