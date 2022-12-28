// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_appointments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppointmentsModel _$$_AppointmentsModelFromJson(Map<String, dynamic> json) =>
    _$_AppointmentsModel(
      id: json['id'] as String,
      patientId: json['patientId'] as String,
      specialistId: json['specialistId'] as String,
      specialist: json['specialist'] == null
          ? null
          : SpecialistModel.fromJson(
              json['specialist'] as Map<String, dynamic>),
      healthComplaint: json['healthComplaint'] as String?,
      videoFileId: json['videoFileId'] as String?,
      videoFileLink: json['videoFileLink'] as String?,
      startedAt: json['startedAt'] as String?,
      finishedAt: json['finishedAt'] as String?,
      status: json['status'] as int,
      cancelBy: json['cancelBy'] as String?,
      cancelReason: json['cancelReason'] as String?,
      rateBySpecialist: json['rateBySpecialist'] == null
          ? null
          : RateBy.fromJson(json['rateBySpecialist'] as Map<String, dynamic>),
      rateByPatient: json['rateByPatient'] == null
          ? null
          : RateBy.fromJson(json['rateByPatient'] as Map<String, dynamic>),
      conclusion: json['conclusion'] as String?,
      recommendations: (json['recommendations'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$_AppointmentsModelToJson(
        _$_AppointmentsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientId': instance.patientId,
      'specialistId': instance.specialistId,
      'specialist': instance.specialist,
      'healthComplaint': instance.healthComplaint,
      'videoFileId': instance.videoFileId,
      'videoFileLink': instance.videoFileLink,
      'startedAt': instance.startedAt,
      'finishedAt': instance.finishedAt,
      'status': instance.status,
      'cancelBy': instance.cancelBy,
      'cancelReason': instance.cancelReason,
      'rateBySpecialist': instance.rateBySpecialist,
      'rateByPatient': instance.rateByPatient,
      'conclusion': instance.conclusion,
      'recommendations': instance.recommendations,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$_SpecialistModel _$$_SpecialistModelFromJson(Map<String, dynamic> json) =>
    _$_SpecialistModel(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      middleName: json['middleName'] as String?,
      bdate: json['bdate'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$$_SpecialistModelToJson(_$_SpecialistModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'bdate': instance.bdate,
      'avatar': instance.avatar,
    };

_$_RateBy _$$_RateByFromJson(Map<String, dynamic> json) => _$_RateBy(
      value: json['value'] as int?,
      positive: (json['positive'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
      negative: (json['negative'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_RateByToJson(_$_RateBy instance) => <String, dynamic>{
      'value': instance.value,
      'positive': instance.positive,
      'negative': instance.negative,
    };
