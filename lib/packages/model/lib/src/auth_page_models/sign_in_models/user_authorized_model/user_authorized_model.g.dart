// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_authorized_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserAuthorizedModel _$$_UserAuthorizedModelFromJson(
        Map<String, dynamic> json) =>
    _$_UserAuthorizedModel(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      username: json['username'] as String?,
      role: (json['role'] as num).toDouble(),
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expiresIn: (json['expiresIn'] as num).toDouble(),
    );

Map<String, dynamic> _$$_UserAuthorizedModelToJson(
        _$_UserAuthorizedModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
      'role': instance.role,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expiresIn': instance.expiresIn,
    };
