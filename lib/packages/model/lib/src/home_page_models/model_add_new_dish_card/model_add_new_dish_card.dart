import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:model/model.dart';
import 'dart:io';

import 'package:flutter/material.dart';

part 'model_add_new_dish_card.freezed.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@unfreezed
class AddNewDishCardModel with _$AddNewDishCardModel {
   factory AddNewDishCardModel({
    required int indexDishCard,
    required GlobalKey<FormState> globalKeyFormState,
    required NutriDishModel nutriDish,
  }) = _AddNewDishCardModel;
}
