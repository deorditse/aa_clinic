import 'package:freezed_annotation/freezed_annotation.dart';

import 'dart:io';

part 'calendar_nutri_meals_model.freezed.dart';

part 'calendar_nutri_meals_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class NutriMealsModel with _$NutriMealsModel {
  const factory NutriMealsModel({
    required String id,
    required String creatorId,
    required String userId,
    required String title,
    //array with dishes objects
    @Default([]) List<NutriDishModel?> dishes,
    String? typeId,
    @Default({}) Map additionalData,
    String? description,
    String? comment,
    String? startedAt,
    String? finishedAt,
    @Default(0) int fulfillment,
    String? createdAt,
    String? updatedAt,
  }) = _NutriMealsModel;

  factory NutriMealsModel.fromJson(Map<String, Object?> json) =>
      _$NutriMealsModelFromJson(json);
}

@unfreezed
class NutriDishModel with _$NutriDishModel {
  factory NutriDishModel({
    File? file, //для себя чтобы добавить новое событие приема пищи
    String? title,
    String? image,
    String? lifeImage,
    String? thumbnail,
    @Default([]) List<String?> tags,
    String? typeId,
    int? kcal,
    int? mass,
    String? description,
    String? comment,
  }) = _NutriDishModel;

  factory NutriDishModel.fromJson(Map<String, Object?> json) =>
      _$NutriDishModelFromJson(json);
}
