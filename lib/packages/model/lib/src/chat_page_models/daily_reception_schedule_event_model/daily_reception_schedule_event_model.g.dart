// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_reception_schedule_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DailyReceptionScheduleEventModel
    _$$_DailyReceptionScheduleEventModelFromJson(Map<String, dynamic> json) =>
        _$_DailyReceptionScheduleEventModel(
          id: json['id'] as String,
          userId: json['userId'] as String?,
          startedAt: json['startedAt'] as String?,
          finishedAt: json['finishedAt'] as String?,
          patientId: json['patientId'] as String?,
          appointmentId: json['appointmentId'] as String?,
        );

Map<String, dynamic> _$$_DailyReceptionScheduleEventModelToJson(
        _$_DailyReceptionScheduleEventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'startedAt': instance.startedAt,
      'finishedAt': instance.finishedAt,
      'patientId': instance.patientId,
      'appointmentId': instance.appointmentId,
    };
