// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'static_file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StaticFileModel _$$_StaticFileModelFromJson(Map<String, dynamic> json) =>
    _$_StaticFileModel(
      id: json['id'] as String,
      ownerId: json['ownerId'] as String?,
      fileCategory: json['fileCategory'] as int?,
      path: json['path'] as String?,
      size: json['size'] as int?,
      mimetype: json['mimetype'] as String?,
      fieldname: json['fieldname'] as String?,
      filename: json['filename'] as String?,
      originalname: json['originalname'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      creatorId: json['creatorId'] as String,
    );

Map<String, dynamic> _$$_StaticFileModelToJson(_$_StaticFileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'fileCategory': instance.fileCategory,
      'path': instance.path,
      'size': instance.size,
      'mimetype': instance.mimetype,
      'fieldname': instance.fieldname,
      'filename': instance.filename,
      'originalname': instance.originalname,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'creatorId': instance.creatorId,
    };
