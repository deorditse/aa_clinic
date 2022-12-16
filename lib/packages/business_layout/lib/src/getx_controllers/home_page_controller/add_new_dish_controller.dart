import 'dart:collection';
import 'dart:io';
import 'package:business_layout/business_layout.dart';
import 'package:model/model.dart';
import 'package:data_layout/data_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ImplementAddNewDishController extends GetxController {
  static ImplementAddNewDishController instance =
      Get.find<ImplementAddNewDishController>();

  List<AddNewDishCardModel> modelDishCardList = [
    AddNewDishCardModel(
      indexDishCard: 0,
      globalKeyFormState: GlobalKey<FormState>(),
      nutriDish: NutriDishModel(),
    )
  ];

  ///добавление фото в блюдо для нового календарного события
  //Map<indexDishCard, File >

  void changeListAddDishEnableCard({
    bool deletePhoto = false,
    AddNewDishCardModel? modelDishCard,
    required int index,
    File? file,
  }) {
    if (modelDishCard != null) {
      modelDishCardList.add(modelDishCard);
      update();
      return;
    } else if (file != null) {
      modelDishCardList[index].nutriDish.file = file;
      update();
      return;
    } else if (deletePhoto) {
      modelDishCardList[index].nutriDish.file = null;
      update();
      return;
    } else {
      print('clear index $index');

      if (modelDishCardList.length > 1) {
        modelDishCardList.removeAt(index);
        update();

        return;
      } else {
        modelDishCardList = [
          AddNewDishCardModel(
            indexDishCard: 0,
            globalKeyFormState: GlobalKey<FormState>(),
            nutriDish: NutriDishModel(),
          )
        ];
        update();
        return;
      }
    }
  }
}
