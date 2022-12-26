// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_find_many_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatFindManyModel _$$_ChatFindManyModelFromJson(Map<String, dynamic> json) =>
    _$_ChatFindManyModel(
      id: json['id'] as String,
      specialistId: json['specialistId'] as String?,
      patientId: json['patientId'] as String?,
      isHidden: json['isHidden'] as bool? ?? false,
      lastMessageDate: json['lastMessageDate'] as String?,
      lastMessage: json['lastMessage'] as String?,
      unreadedMessages: json['unreadedMessages'] as int?,
    );

Map<String, dynamic> _$$_ChatFindManyModelToJson(
        _$_ChatFindManyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'specialistId': instance.specialistId,
      'patientId': instance.patientId,
      'isHidden': instance.isHidden,
      'lastMessageDate': instance.lastMessageDate,
      'lastMessage': instance.lastMessage,
      'unreadedMessages': instance.unreadedMessages,
    };
