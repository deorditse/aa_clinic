// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'real_time_call_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RealTimeCallModel _$$_RealTimeCallModelFromJson(Map<String, dynamic> json) =>
    _$_RealTimeCallModel(
      docs: (json['docs'] as List<dynamic>?)
              ?.map((e) => RealTimeCall.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalDocs: json['totalDocs'] as int,
      page: json['page'] as int,
      limit: json['limit'] as int,
      totalPages: json['totalPages'] as int,
      hasPrevPage: json['hasPrevPage'] as bool?,
      hasNextPage: json['hasNextPage'] as bool?,
      prevPage: json['prevPage'] as String?,
      nextPage: json['nextPage'] as String?,
    );

Map<String, dynamic> _$$_RealTimeCallModelToJson(
        _$_RealTimeCallModel instance) =>
    <String, dynamic>{
      'docs': instance.docs,
      'totalDocs': instance.totalDocs,
      'page': instance.page,
      'limit': instance.limit,
      'totalPages': instance.totalPages,
      'hasPrevPage': instance.hasPrevPage,
      'hasNextPage': instance.hasNextPage,
      'prevPage': instance.prevPage,
      'nextPage': instance.nextPage,
    };

_$_RealTimeCall _$$_RealTimeCallFromJson(Map<String, dynamic> json) =>
    _$_RealTimeCall(
      id: json['id'] as String,
      members: (json['members'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
      token: json['token'] as String?,
      appId: json['appId'] as String?,
      channelName: json['channelName'] as String,
      createdAt: json['createdAt'] as String?,
      finishedAt: json['finishedAt'] as String?,
    );

Map<String, dynamic> _$$_RealTimeCallToJson(_$_RealTimeCall instance) =>
    <String, dynamic>{
      'id': instance.id,
      'members': instance.members,
      'token': instance.token,
      'appId': instance.appId,
      'channelName': instance.channelName,
      'createdAt': instance.createdAt,
      'finishedAt': instance.finishedAt,
    };
