// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documents_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DocumentForIdModel _$$_DocumentForIdModelFromJson(
        Map<String, dynamic> json) =>
    _$_DocumentForIdModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      creatorId: json['creatorId'] as String?,
      category: json['category'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      attachmentsIds: (json['attachmentsIds'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : Attachment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$_DocumentForIdModelToJson(
        _$_DocumentForIdModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'creatorId': instance.creatorId,
      'category': instance.category,
      'title': instance.title,
      'description': instance.description,
      'attachmentsIds': instance.attachmentsIds,
      'attachments': instance.attachments,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$_Attachment _$$_AttachmentFromJson(Map<String, dynamic> json) =>
    _$_Attachment(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      type: json['type'] as String?,
      thumbnailFileId: json['thumbnailFileId'] as String?,
      fileId: json['fileId'] as String?,
    );

Map<String, dynamic> _$$_AttachmentToJson(_$_Attachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': instance.type,
      'thumbnailFileId': instance.thumbnailFileId,
      'fileId': instance.fileId,
    };
