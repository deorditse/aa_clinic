// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_find_many_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatFindManyModel _$$_ChatFindManyModelFromJson(Map<String, dynamic> json) =>
    _$_ChatFindManyModel(
      id: json['id'] as String,
      userMinifiedData: json['userMinifiedData'] == null
          ? null
          : UserMinifiedDataIdModel.fromJson(
              json['userMinifiedData'] as Map<String, dynamic>),
      specialistId: json['specialistId'] as String?,
      patientId: json['patientId'] as String?,
      isHidden: json['isHidden'] as bool? ?? false,
      lastMessageDate: json['lastMessageDate'] as String?,
      lastMessage: json['lastMessage'] as String?,
      unreadedMessages: json['unreadedMessages'] as int?,
      isSpecialistOnline: json['isSpecialistOnline'] as bool,
    );

Map<String, dynamic> _$$_ChatFindManyModelToJson(
        _$_ChatFindManyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userMinifiedData': instance.userMinifiedData,
      'specialistId': instance.specialistId,
      'patientId': instance.patientId,
      'isHidden': instance.isHidden,
      'lastMessageDate': instance.lastMessageDate,
      'lastMessage': instance.lastMessage,
      'unreadedMessages': instance.unreadedMessages,
      'isSpecialistOnline': instance.isSpecialistOnline,
    };
