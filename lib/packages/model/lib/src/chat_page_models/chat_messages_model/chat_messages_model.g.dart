// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_messages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OfficialChatMessagesModel _$$_OfficialChatMessagesModelFromJson(
        Map<String, dynamic> json) =>
    _$_OfficialChatMessagesModel(
      docs: (json['docs'] as List<dynamic>?)
              ?.map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalDocs: json['totalDocs'] as int?,
      limit: json['limit'] as int?,
      page: json['page'] as int? ?? 1,
      totalPages: json['totalPages'] as int?,
      offset: json['offset'] as int?,
      hasPrevPage: json['hasPrevPage'] as bool?,
      hasNextPage: json['hasNextPage'] as bool?,
      prevPage: json['prevPage'] as int?,
      nextPage: json['nextPage'] as int?,
    );

Map<String, dynamic> _$$_OfficialChatMessagesModelToJson(
        _$_OfficialChatMessagesModel instance) =>
    <String, dynamic>{
      'docs': instance.docs,
      'totalDocs': instance.totalDocs,
      'limit': instance.limit,
      'page': instance.page,
      'totalPages': instance.totalPages,
      'offset': instance.offset,
      'hasPrevPage': instance.hasPrevPage,
      'hasNextPage': instance.hasNextPage,
      'prevPage': instance.prevPage,
      'nextPage': instance.nextPage,
    };

_$_MessageModel _$$_MessageModelFromJson(Map<String, dynamic> json) =>
    _$_MessageModel(
      id: json['id'] as String,
      chatId: json['chatId'] as String?,
      senderId: json['senderId'] as String?,
      recipientId: json['recipientId'] as String?,
      text: json['text'] as String?,
      status: json['status'] as int?,
      isReaded: json['isReaded'] as bool? ?? false,
      attachmentsIds: (json['attachmentsIds'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : AttachmentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      readedAt: json['readedAt'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$_MessageModelToJson(_$_MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chatId': instance.chatId,
      'senderId': instance.senderId,
      'recipientId': instance.recipientId,
      'text': instance.text,
      'status': instance.status,
      'isReaded': instance.isReaded,
      'attachmentsIds': instance.attachmentsIds,
      'attachments': instance.attachments,
      'readedAt': instance.readedAt,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$_AttachmentModel _$$_AttachmentModelFromJson(Map<String, dynamic> json) =>
    _$_AttachmentModel(
      id: json['id'] as String,
      userId: json['userId'] as String?,
      type: json['type'] as String?,
      fileId: json['fileId'] as String?,
      thumbnailFileId: json['thumbnailFileId'] as String?,
    );

Map<String, dynamic> _$$_AttachmentModelToJson(_$_AttachmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': instance.type,
      'fileId': instance.fileId,
      'thumbnailFileId': instance.thumbnailFileId,
    };
