// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documents_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DocumentsListModel _$$_DocumentsListModelFromJson(
        Map<String, dynamic> json) =>
    _$_DocumentsListModel(
      docs: (json['docs'] as List<dynamic>?)
              ?.map(
                  (e) => DocumentForIdModel.fromJson(e as Map<String, dynamic>))
              .toSet() ??
          const {},
      totalDocs: json['totalDocs'] as int,
      limit: json['limit'] as int? ?? 0,
      page: json['page'] as int? ?? 1,
      totalPages: json['totalPages'] as int?,
      hasPrevPage: json['hasPrevPage'] as bool?,
      hasNextPage: json['hasNextPage'] as bool?,
      prevPage: json['prevPage'] as int?,
      nextPage: json['nextPage'] as int?,
    );

Map<String, dynamic> _$$_DocumentsListModelToJson(
        _$_DocumentsListModel instance) =>
    <String, dynamic>{
      'docs': instance.docs.toList(),
      'totalDocs': instance.totalDocs,
      'limit': instance.limit,
      'page': instance.page,
      'totalPages': instance.totalPages,
      'hasPrevPage': instance.hasPrevPage,
      'hasNextPage': instance.hasNextPage,
      'prevPage': instance.prevPage,
      'nextPage': instance.nextPage,
    };
