// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_nutri_meals_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NutriMealsModel _$$_NutriMealsModelFromJson(Map<String, dynamic> json) =>
    _$_NutriMealsModel(
      id: json['id'] as String,
      creatorId: json['creatorId'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      dishes: (json['dishes'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : NutriDishModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      typeId: json['typeId'] as String?,
      additionalData:
          json['additionalData'] as Map<String, dynamic>? ?? const {},
      description: json['description'] as String?,
      comment: json['comment'] as String?,
      startedAt: json['startedAt'] as String?,
      finishedAt: json['finishedAt'] as String?,
      fulfillment: json['fulfillment'] as int? ?? 0,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$_NutriMealsModelToJson(_$_NutriMealsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creatorId': instance.creatorId,
      'userId': instance.userId,
      'title': instance.title,
      'dishes': instance.dishes,
      'typeId': instance.typeId,
      'additionalData': instance.additionalData,
      'description': instance.description,
      'comment': instance.comment,
      'startedAt': instance.startedAt,
      'finishedAt': instance.finishedAt,
      'fulfillment': instance.fulfillment,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$_NutriDishModel _$$_NutriDishModelFromJson(Map<String, dynamic> json) =>
    _$_NutriDishModel(
      file: json['file'],
      title: json['title'] as String?,
      image: json['image'] as String?,
      lifeImage: json['lifeImage'] as String?,
      thumbnail: json['thumbnail'] as String?,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String?).toList() ??
              const [],
      typeId: json['typeId'] as String?,
      kcal: json['kcal'] as int?,
      mass: json['mass'] as int?,
      description: json['description'] as String?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$$_NutriDishModelToJson(_$_NutriDishModel instance) =>
    <String, dynamic>{
      'file': instance.file,
      'title': instance.title,
      'image': instance.image,
      'lifeImage': instance.lifeImage,
      'thumbnail': instance.thumbnail,
      'tags': instance.tags,
      'typeId': instance.typeId,
      'kcal': instance.kcal,
      'mass': instance.mass,
      'description': instance.description,
      'comment': instance.comment,
    };
