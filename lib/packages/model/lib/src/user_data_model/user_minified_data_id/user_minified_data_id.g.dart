// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_minified_data_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserMinifiedDataIdModel _$$_UserMinifiedDataIdModelFromJson(
        Map<String, dynamic> json) =>
    _$_UserMinifiedDataIdModel(
      id: json['id'] as String,
      lastName: json['lastName'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      avatar: json['avatar'] as String?,
      specialist: json['specialist'] as String?,
    );

Map<String, dynamic> _$$_UserMinifiedDataIdModelToJson(
        _$_UserMinifiedDataIdModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'avatar': instance.avatar,
      'specialist': instance.specialist,
    };
