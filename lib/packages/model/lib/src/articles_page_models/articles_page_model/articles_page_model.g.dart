// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArticlesPageModel _$$_ArticlesPageModelFromJson(Map<String, dynamic> json) =>
    _$_ArticlesPageModel(
      docs: (json['docs'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : ArticleModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalDocs: json['totalDocs'] as int,
      limit: json['limit'] as int?,
      page: json['page'] as int,
      totalPages: json['totalPages'] as int,
      hasPrevPage: json['hasPrevPage'] as bool? ?? false,
      hasNextPage: json['hasNextPage'] as bool? ?? false,
      prevPage: json['prevPage'] as int?,
      nextPage: json['nextPage'] as int?,
    );

Map<String, dynamic> _$$_ArticlesPageModelToJson(
        _$_ArticlesPageModel instance) =>
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

_$_ArticleModel _$$_ArticleModelFromJson(Map<String, dynamic> json) =>
    _$_ArticleModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      coverFileId: json['coverFileId'] as String?,
      category: json['category'] as String?,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String?).toList() ??
              const [],
      status: json['status'] as int,
      rate: (json['rate'] as num?)?.toDouble(),
      rejectedReason: json['rejectedReason'] as String?,
      publisherId: json['publisherId'] as String?,
      publishedAt: json['publishedAt'] as String,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$_ArticleModelToJson(_$_ArticleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'body': instance.body,
      'coverFileId': instance.coverFileId,
      'category': instance.category,
      'tags': instance.tags,
      'status': instance.status,
      'rate': instance.rate,
      'rejectedReason': instance.rejectedReason,
      'publisherId': instance.publisherId,
      'publishedAt': instance.publishedAt,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
