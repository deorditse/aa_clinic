// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) {
  return _UserDataModel.fromJson(json);
}

/// @nodoc
mixin _$UserDataModel {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  set username(String value) => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  set lastName(String? value) => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  set firstName(String value) => throw _privateConstructorUsedError;
  String? get middleName => throw _privateConstructorUsedError;
  set middleName(String? value) => throw _privateConstructorUsedError;
  int? get gender => throw _privateConstructorUsedError;
  set gender(int? value) => throw _privateConstructorUsedError;
  String? get lastRequest => throw _privateConstructorUsedError;
  set lastRequest(String? value) => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  set email(String value) => throw _privateConstructorUsedError;
  bool? get isBanned => throw _privateConstructorUsedError;
  set isBanned(bool? value) => throw _privateConstructorUsedError;
  bool? get isEmailVerified => throw _privateConstructorUsedError;
  set isEmailVerified(bool? value) => throw _privateConstructorUsedError;
  int get role => throw _privateConstructorUsedError;
  set role(int value) =>
      throw _privateConstructorUsedError; // //[ 0 - patient, 1 - specialist, 2 - moder, 5 - admin, 7 - InnerService ]
  String? get subscription =>
      throw _privateConstructorUsedError; // //[ 0 - patient, 1 - specialist, 2 - moder, 5 - admin, 7 - InnerService ]
  set subscription(String? value) => throw _privateConstructorUsedError;
  List<String?> get attachedSpecialists => throw _privateConstructorUsedError;
  set attachedSpecialists(List<String?> value) =>
      throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  set bio(String? value) => throw _privateConstructorUsedError;
  int get availableAppointments => throw _privateConstructorUsedError;
  set availableAppointments(int value) => throw _privateConstructorUsedError;
  List<String?> get achievements => throw _privateConstructorUsedError;
  set achievements(List<String?> value) => throw _privateConstructorUsedError;
  String? get bdate => throw _privateConstructorUsedError;
  set bdate(String? value) => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  set phoneNumber(String? value) => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  set location(String? value) => throw _privateConstructorUsedError;
  Address? get address => throw _privateConstructorUsedError;
  set address(Address? value) => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  set avatar(String? value) => throw _privateConstructorUsedError;
  String? get avatarThumbnail => throw _privateConstructorUsedError;
  set avatarThumbnail(String? value) => throw _privateConstructorUsedError;
  String? get lang => throw _privateConstructorUsedError;
  set lang(String? value) => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  set createdAt(String? value) => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  set updatedAt(String? value) => throw _privateConstructorUsedError;
  bool get isOnline => throw _privateConstructorUsedError;
  set isOnline(bool value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDataModelCopyWith<UserDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataModelCopyWith<$Res> {
  factory $UserDataModelCopyWith(
          UserDataModel value, $Res Function(UserDataModel) then) =
      _$UserDataModelCopyWithImpl<$Res, UserDataModel>;
  @useResult
  $Res call(
      {String id,
      String username,
      String? lastName,
      String firstName,
      String? middleName,
      int? gender,
      String? lastRequest,
      String email,
      bool? isBanned,
      bool? isEmailVerified,
      int role,
      String? subscription,
      List<String?> attachedSpecialists,
      String? bio,
      int availableAppointments,
      List<String?> achievements,
      String? bdate,
      String? phoneNumber,
      String? location,
      Address? address,
      String? avatar,
      String? avatarThumbnail,
      String? lang,
      String? createdAt,
      String? updatedAt,
      bool isOnline});

  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$UserDataModelCopyWithImpl<$Res, $Val extends UserDataModel>
    implements $UserDataModelCopyWith<$Res> {
  _$UserDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? lastName = freezed,
    Object? firstName = null,
    Object? middleName = freezed,
    Object? gender = freezed,
    Object? lastRequest = freezed,
    Object? email = null,
    Object? isBanned = freezed,
    Object? isEmailVerified = freezed,
    Object? role = null,
    Object? subscription = freezed,
    Object? attachedSpecialists = null,
    Object? bio = freezed,
    Object? availableAppointments = null,
    Object? achievements = null,
    Object? bdate = freezed,
    Object? phoneNumber = freezed,
    Object? location = freezed,
    Object? address = freezed,
    Object? avatar = freezed,
    Object? avatarThumbnail = freezed,
    Object? lang = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isOnline = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int?,
      lastRequest: freezed == lastRequest
          ? _value.lastRequest
          : lastRequest // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isBanned: freezed == isBanned
          ? _value.isBanned
          : isBanned // ignore: cast_nullable_to_non_nullable
              as bool?,
      isEmailVerified: freezed == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as int,
      subscription: freezed == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as String?,
      attachedSpecialists: null == attachedSpecialists
          ? _value.attachedSpecialists
          : attachedSpecialists // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      availableAppointments: null == availableAppointments
          ? _value.availableAppointments
          : availableAppointments // ignore: cast_nullable_to_non_nullable
              as int,
      achievements: null == achievements
          ? _value.achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      bdate: freezed == bdate
          ? _value.bdate
          : bdate // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarThumbnail: freezed == avatarThumbnail
          ? _value.avatarThumbnail
          : avatarThumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      lang: freezed == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserDataModelCopyWith<$Res>
    implements $UserDataModelCopyWith<$Res> {
  factory _$$_UserDataModelCopyWith(
          _$_UserDataModel value, $Res Function(_$_UserDataModel) then) =
      __$$_UserDataModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String username,
      String? lastName,
      String firstName,
      String? middleName,
      int? gender,
      String? lastRequest,
      String email,
      bool? isBanned,
      bool? isEmailVerified,
      int role,
      String? subscription,
      List<String?> attachedSpecialists,
      String? bio,
      int availableAppointments,
      List<String?> achievements,
      String? bdate,
      String? phoneNumber,
      String? location,
      Address? address,
      String? avatar,
      String? avatarThumbnail,
      String? lang,
      String? createdAt,
      String? updatedAt,
      bool isOnline});

  @override
  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$$_UserDataModelCopyWithImpl<$Res>
    extends _$UserDataModelCopyWithImpl<$Res, _$_UserDataModel>
    implements _$$_UserDataModelCopyWith<$Res> {
  __$$_UserDataModelCopyWithImpl(
      _$_UserDataModel _value, $Res Function(_$_UserDataModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? lastName = freezed,
    Object? firstName = null,
    Object? middleName = freezed,
    Object? gender = freezed,
    Object? lastRequest = freezed,
    Object? email = null,
    Object? isBanned = freezed,
    Object? isEmailVerified = freezed,
    Object? role = null,
    Object? subscription = freezed,
    Object? attachedSpecialists = null,
    Object? bio = freezed,
    Object? availableAppointments = null,
    Object? achievements = null,
    Object? bdate = freezed,
    Object? phoneNumber = freezed,
    Object? location = freezed,
    Object? address = freezed,
    Object? avatar = freezed,
    Object? avatarThumbnail = freezed,
    Object? lang = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isOnline = null,
  }) {
    return _then(_$_UserDataModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int?,
      lastRequest: freezed == lastRequest
          ? _value.lastRequest
          : lastRequest // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isBanned: freezed == isBanned
          ? _value.isBanned
          : isBanned // ignore: cast_nullable_to_non_nullable
              as bool?,
      isEmailVerified: freezed == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as int,
      subscription: freezed == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as String?,
      attachedSpecialists: null == attachedSpecialists
          ? _value.attachedSpecialists
          : attachedSpecialists // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      availableAppointments: null == availableAppointments
          ? _value.availableAppointments
          : availableAppointments // ignore: cast_nullable_to_non_nullable
              as int,
      achievements: null == achievements
          ? _value.achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      bdate: freezed == bdate
          ? _value.bdate
          : bdate // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarThumbnail: freezed == avatarThumbnail
          ? _value.avatarThumbnail
          : avatarThumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      lang: freezed == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserDataModel implements _UserDataModel {
  _$_UserDataModel(
      {required this.id,
      required this.username,
      this.lastName,
      required this.firstName,
      this.middleName,
      required this.gender,
      this.lastRequest,
      required this.email,
      this.isBanned,
      this.isEmailVerified,
      required this.role,
      this.subscription,
      required this.attachedSpecialists,
      this.bio,
      required this.availableAppointments,
      required this.achievements,
      this.bdate,
      this.phoneNumber,
      this.location,
      this.address,
      this.avatar,
      this.avatarThumbnail,
      this.lang,
      this.createdAt,
      this.updatedAt,
      required this.isOnline});

  factory _$_UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserDataModelFromJson(json);

  @override
  String id;
  @override
  String username;
  @override
  String? lastName;
  @override
  String firstName;
  @override
  String? middleName;
  @override
  int? gender;
  @override
  String? lastRequest;
  @override
  String email;
  @override
  bool? isBanned;
  @override
  bool? isEmailVerified;
  @override
  int role;
// //[ 0 - patient, 1 - specialist, 2 - moder, 5 - admin, 7 - InnerService ]
  @override
  String? subscription;
  @override
  List<String?> attachedSpecialists;
  @override
  String? bio;
  @override
  int availableAppointments;
  @override
  List<String?> achievements;
  @override
  String? bdate;
  @override
  String? phoneNumber;
  @override
  String? location;
  @override
  Address? address;
  @override
  String? avatar;
  @override
  String? avatarThumbnail;
  @override
  String? lang;
  @override
  String? createdAt;
  @override
  String? updatedAt;
  @override
  bool isOnline;

  @override
  String toString() {
    return 'UserDataModel(id: $id, username: $username, lastName: $lastName, firstName: $firstName, middleName: $middleName, gender: $gender, lastRequest: $lastRequest, email: $email, isBanned: $isBanned, isEmailVerified: $isEmailVerified, role: $role, subscription: $subscription, attachedSpecialists: $attachedSpecialists, bio: $bio, availableAppointments: $availableAppointments, achievements: $achievements, bdate: $bdate, phoneNumber: $phoneNumber, location: $location, address: $address, avatar: $avatar, avatarThumbnail: $avatarThumbnail, lang: $lang, createdAt: $createdAt, updatedAt: $updatedAt, isOnline: $isOnline)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserDataModelCopyWith<_$_UserDataModel> get copyWith =>
      __$$_UserDataModelCopyWithImpl<_$_UserDataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDataModelToJson(
      this,
    );
  }
}

abstract class _UserDataModel implements UserDataModel {
  factory _UserDataModel(
      {required String id,
      required String username,
      String? lastName,
      required String firstName,
      String? middleName,
      required int? gender,
      String? lastRequest,
      required String email,
      bool? isBanned,
      bool? isEmailVerified,
      required int role,
      String? subscription,
      required List<String?> attachedSpecialists,
      String? bio,
      required int availableAppointments,
      required List<String?> achievements,
      String? bdate,
      String? phoneNumber,
      String? location,
      Address? address,
      String? avatar,
      String? avatarThumbnail,
      String? lang,
      String? createdAt,
      String? updatedAt,
      required bool isOnline}) = _$_UserDataModel;

  factory _UserDataModel.fromJson(Map<String, dynamic> json) =
      _$_UserDataModel.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get username;
  set username(String value);
  @override
  String? get lastName;
  set lastName(String? value);
  @override
  String get firstName;
  set firstName(String value);
  @override
  String? get middleName;
  set middleName(String? value);
  @override
  int? get gender;
  set gender(int? value);
  @override
  String? get lastRequest;
  set lastRequest(String? value);
  @override
  String get email;
  set email(String value);
  @override
  bool? get isBanned;
  set isBanned(bool? value);
  @override
  bool? get isEmailVerified;
  set isEmailVerified(bool? value);
  @override
  int get role;
  set role(int value);
  @override // //[ 0 - patient, 1 - specialist, 2 - moder, 5 - admin, 7 - InnerService ]
  String?
      get subscription; // //[ 0 - patient, 1 - specialist, 2 - moder, 5 - admin, 7 - InnerService ]
  set subscription(String? value);
  @override
  List<String?> get attachedSpecialists;
  set attachedSpecialists(List<String?> value);
  @override
  String? get bio;
  set bio(String? value);
  @override
  int get availableAppointments;
  set availableAppointments(int value);
  @override
  List<String?> get achievements;
  set achievements(List<String?> value);
  @override
  String? get bdate;
  set bdate(String? value);
  @override
  String? get phoneNumber;
  set phoneNumber(String? value);
  @override
  String? get location;
  set location(String? value);
  @override
  Address? get address;
  set address(Address? value);
  @override
  String? get avatar;
  set avatar(String? value);
  @override
  String? get avatarThumbnail;
  set avatarThumbnail(String? value);
  @override
  String? get lang;
  set lang(String? value);
  @override
  String? get createdAt;
  set createdAt(String? value);
  @override
  String? get updatedAt;
  set updatedAt(String? value);
  @override
  bool get isOnline;
  set isOnline(bool value);
  @override
  @JsonKey(ignore: true)
  _$$_UserDataModelCopyWith<_$_UserDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  String? get zipCode => throw _privateConstructorUsedError;
  set zipCode(String? value) => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  set country(String? value) => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  set city(String? value) => throw _privateConstructorUsedError;
  String? get street => throw _privateConstructorUsedError;
  set street(String? value) => throw _privateConstructorUsedError;
  String? get house => throw _privateConstructorUsedError;
  set house(String? value) => throw _privateConstructorUsedError;
  String? get appartment => throw _privateConstructorUsedError;
  set appartment(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call(
      {String? zipCode,
      String? country,
      String? city,
      String? street,
      String? house,
      String? appartment});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zipCode = freezed,
    Object? country = freezed,
    Object? city = freezed,
    Object? street = freezed,
    Object? house = freezed,
    Object? appartment = freezed,
  }) {
    return _then(_value.copyWith(
      zipCode: freezed == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      house: freezed == house
          ? _value.house
          : house // ignore: cast_nullable_to_non_nullable
              as String?,
      appartment: freezed == appartment
          ? _value.appartment
          : appartment // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$_AddressCopyWith(
          _$_Address value, $Res Function(_$_Address) then) =
      __$$_AddressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? zipCode,
      String? country,
      String? city,
      String? street,
      String? house,
      String? appartment});
}

/// @nodoc
class __$$_AddressCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$_Address>
    implements _$$_AddressCopyWith<$Res> {
  __$$_AddressCopyWithImpl(_$_Address _value, $Res Function(_$_Address) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zipCode = freezed,
    Object? country = freezed,
    Object? city = freezed,
    Object? street = freezed,
    Object? house = freezed,
    Object? appartment = freezed,
  }) {
    return _then(_$_Address(
      zipCode: freezed == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      house: freezed == house
          ? _value.house
          : house // ignore: cast_nullable_to_non_nullable
              as String?,
      appartment: freezed == appartment
          ? _value.appartment
          : appartment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Address implements _Address {
  _$_Address(
      {this.zipCode,
      this.country,
      this.city,
      this.street,
      this.house,
      this.appartment});

  factory _$_Address.fromJson(Map<String, dynamic> json) =>
      _$$_AddressFromJson(json);

  @override
  String? zipCode;
  @override
  String? country;
  @override
  String? city;
  @override
  String? street;
  @override
  String? house;
  @override
  String? appartment;

  @override
  String toString() {
    return 'Address(zipCode: $zipCode, country: $country, city: $city, street: $street, house: $house, appartment: $appartment)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddressCopyWith<_$_Address> get copyWith =>
      __$$_AddressCopyWithImpl<_$_Address>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressToJson(
      this,
    );
  }
}

abstract class _Address implements Address {
  factory _Address(
      {String? zipCode,
      String? country,
      String? city,
      String? street,
      String? house,
      String? appartment}) = _$_Address;

  factory _Address.fromJson(Map<String, dynamic> json) = _$_Address.fromJson;

  @override
  String? get zipCode;
  set zipCode(String? value);
  @override
  String? get country;
  set country(String? value);
  @override
  String? get city;
  set city(String? value);
  @override
  String? get street;
  set street(String? value);
  @override
  String? get house;
  set house(String? value);
  @override
  String? get appartment;
  set appartment(String? value);
  @override
  @JsonKey(ignore: true)
  _$$_AddressCopyWith<_$_Address> get copyWith =>
      throw _privateConstructorUsedError;
}
