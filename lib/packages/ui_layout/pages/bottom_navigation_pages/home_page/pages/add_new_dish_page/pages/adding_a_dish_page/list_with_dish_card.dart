import 'dart:io';

import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:business_layout/business_layout.dart';
import 'package:get/get.dart';

import 'widgets/add_dish_enable_card.dart';

///добавление фото в блюдо для нового календарного события
RxList<AddDishEnableCard> listAddDishEnableCard =
    [AddDishEnableCard(index: 0)].obs;

RxSet<int> listIndexWherePhotosNotAdded = <int>{}.obs;

List<GlobalKey<FormState>> listFormKey = [GlobalKey<FormState>()];

RxList<NutriDishModel> newListDishes = [NutriDishModel()].obs;

void changeListAddDishEnableCard({
  AddDishEnableCard? addDishEnableCard,
  int? index,
}) {
  if (addDishEnableCard != null) {
    listAddDishEnableCard.add(addDishEnableCard);
    newListDishes.add(NutriDishModel());
    listFormKey.add(GlobalKey<FormState>());
    return;
  }
  if (index != null) {
    if (listAddDishEnableCard.length > 1) {
      listAddDishEnableCard.removeAt(index);
      newListDishes.removeAt(index);
      listFormKey.removeAt(index);
      return;
    } else {
      print('clear');
      listAddDishEnableCard.value = [AddDishEnableCard(index: 0)];
      newListDishes.value = [NutriDishModel()];
      listFormKey = [GlobalKey<FormState>()];
      HomePageCalendarControllerGetxState.instance
          .changeListPhotoAddDishEnableCard(
        indexDishCard: index,
        isRemoveForIndex: true,
      );
      return;
    }
  } else {
    //чистим лист с файлами
    HomePageCalendarControllerGetxState.instance
        .changeListPhotoAddDishEnableCard(indexDishCard: 0, isRemoveAll: true);
    listAddDishEnableCard.value = [AddDishEnableCard(index: 0)];
    newListDishes.value = [NutriDishModel()];
    listFormKey = [GlobalKey<FormState>()];
  }
}
