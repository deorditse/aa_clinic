// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_calendar_events_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DailyCalendarEventsModel _$$_DailyCalendarEventsModelFromJson(
        Map<String, dynamic> json) =>
    _$_DailyCalendarEventsModel(
      title: json['title'] as String,
      targetId: json['targetId'] as String,
      type: json['type'] as String?,
      actionType: json['actionType'] as String?,
      startedAt: json['startedAt'] as String?,
      finishedAt: json['finishedAt'] as String?,
      isCanceled: json['isCanceled'] as bool? ?? false,
      isDone: json['isDone'] as bool? ?? false,
      fulfillment: json['fulfillment'] as int? ?? 0,
    );

Map<String, dynamic> _$$_DailyCalendarEventsModelToJson(
        _$_DailyCalendarEventsModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'targetId': instance.targetId,
      'type': instance.type,
      'actionType': instance.actionType,
      'startedAt': instance.startedAt,
      'finishedAt': instance.finishedAt,
      'isCanceled': instance.isCanceled,
      'isDone': instance.isDone,
      'fulfillment': instance.fulfillment,
    };
