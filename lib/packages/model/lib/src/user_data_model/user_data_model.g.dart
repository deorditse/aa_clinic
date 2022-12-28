// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDataModel _$$_UserDataModelFromJson(Map<String, dynamic> json) =>
    _$_UserDataModel(
      id: json['id'] as String,
      username: json['username'] as String,
      lastName: json['lastName'] as String?,
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String?,
      gender: json['gender'] as int?,
      lastRequest: json['lastRequest'] as String?,
      email: json['email'] as String,
      isBanned: json['isBanned'] as bool?,
      isEmailVerified: json['isEmailVerified'] as bool?,
      role: json['role'] as int,
      subscription: json['subscription'] as String?,
      attachedSpecialists: (json['attachedSpecialists'] as List<dynamic>)
          .map((e) => e as String?)
          .toList(),
      bio: json['bio'] as String?,
      availableAppointments: json['availableAppointments'] as int,
      achievements: (json['achievements'] as List<dynamic>)
          .map((e) => e as String?)
          .toList(),
      bdate: json['bdate'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      location: json['location'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      avatar: json['avatar'] as String?,
      avatarThumbnail: json['avatarThumbnail'] as String?,
      lang: json['lang'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      isOnline: json['isOnline'] as bool,
    );

Map<String, dynamic> _$$_UserDataModelToJson(_$_UserDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'gender': instance.gender,
      'lastRequest': instance.lastRequest,
      'email': instance.email,
      'isBanned': instance.isBanned,
      'isEmailVerified': instance.isEmailVerified,
      'role': instance.role,
      'subscription': instance.subscription,
      'attachedSpecialists': instance.attachedSpecialists,
      'bio': instance.bio,
      'availableAppointments': instance.availableAppointments,
      'achievements': instance.achievements,
      'bdate': instance.bdate,
      'phoneNumber': instance.phoneNumber,
      'location': instance.location,
      'address': instance.address,
      'avatar': instance.avatar,
      'avatarThumbnail': instance.avatarThumbnail,
      'lang': instance.lang,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isOnline': instance.isOnline,
    };

_$_Address _$$_AddressFromJson(Map<String, dynamic> json) => _$_Address(
      zipCode: json['zipCode'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      street: json['street'] as String?,
      house: json['house'] as String?,
      appartment: json['appartment'] as String?,
    );

Map<String, dynamic> _$$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'zipCode': instance.zipCode,
      'country': instance.country,
      'city': instance.city,
      'street': instance.street,
      'house': instance.house,
      'appartment': instance.appartment,
    };
