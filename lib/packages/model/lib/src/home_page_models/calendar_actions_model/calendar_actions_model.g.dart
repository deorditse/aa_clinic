// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_actions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CalendarActionsWithIdModel _$$_CalendarActionsWithIdModelFromJson(
        Map<String, dynamic> json) =>
    _$_CalendarActionsWithIdModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      creatorId: json['creatorId'] as String,
      title: json['title'] as String,
      type: json['type'] as String,
      data: json['data'] as Map<String, dynamic>? ?? const {},
      startedAt: json['startedAt'] as String?,
      finishedAt: json['finishedAt'] as String?,
      description: json['description'] as String?,
      isCanceled: json['isCanceled'] as bool? ?? false,
      cancelReason: json['cancelReason'] as String?,
      canceledAt: json['canceledAt'] as String?,
      isDone: json['isDone'] as bool? ?? false,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$_CalendarActionsWithIdModelToJson(
        _$_CalendarActionsWithIdModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'creatorId': instance.creatorId,
      'title': instance.title,
      'type': instance.type,
      'data': instance.data,
      'startedAt': instance.startedAt,
      'finishedAt': instance.finishedAt,
      'description': instance.description,
      'isCanceled': instance.isCanceled,
      'cancelReason': instance.cancelReason,
      'canceledAt': instance.canceledAt,
      'isDone': instance.isDone,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
