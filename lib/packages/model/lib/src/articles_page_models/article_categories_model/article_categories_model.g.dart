// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArticleCategoriesModel _$$_ArticleCategoriesModelFromJson(
        Map<String, dynamic> json) =>
    _$_ArticleCategoriesModel(
      docs: (json['docs'] as List<dynamic>?)
              ?.map((e) => ArticleCategory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalDocs: json['totalDocs'] as int,
      limit: json['limit'] as int?,
      page: json['page'] as int,
      totalPages: json['totalPages'] as int?,
      hasPrevPage: json['hasPrevPage'] as bool,
      hasNextPage: json['hasNextPage'] as bool,
      prevPage: json['prevPage'] as int?,
      nextPage: json['nextPage'] as int?,
    );

Map<String, dynamic> _$$_ArticleCategoriesModelToJson(
        _$_ArticleCategoriesModel instance) =>
    <String, dynamic>{
      'docs': instance.docs,
      'totalDocs': instance.totalDocs,
      'limit': instance.limit,
      'page': instance.page,
      'totalPages': instance.totalPages,
      'hasPrevPage': instance.hasPrevPage,
      'hasNextPage': instance.hasNextPage,
      'prevPage': instance.prevPage,
      'nextPage': instance.nextPage,
    };

_$_ArticleCategory _$$_ArticleCategoryFromJson(Map<String, dynamic> json) =>
    _$_ArticleCategory(
      id: json['id'] as String,
      title: json['title'] as String,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$_ArticleCategoryToJson(_$_ArticleCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
