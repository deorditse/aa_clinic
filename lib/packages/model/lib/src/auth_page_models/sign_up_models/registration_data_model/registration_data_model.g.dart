// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegistrationDataModel _$$_RegistrationDataModelFromJson(
        Map<String, dynamic> json) =>
    _$_RegistrationDataModel(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$_RegistrationDataModelToJson(
        _$_RegistrationDataModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
    };
