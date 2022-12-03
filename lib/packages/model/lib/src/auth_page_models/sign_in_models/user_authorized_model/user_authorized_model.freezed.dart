// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_authorized_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserAuthorizedModel _$UserAuthorizedModelFromJson(Map<String, dynamic> json) {
  return _UserAuthorizedModel.fromJson(json);
}

/// @nodoc
mixin _$UserAuthorizedModel {
  String? get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError; //firstName
  String? get lastName => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError; //username
  double get role => throw _privateConstructorUsedError; //role
  String get accessToken => throw _privateConstructorUsedError; //accessToken
  String get refreshToken => throw _privateConstructorUsedError; //refreshToken
  double get expiresIn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAuthorizedModelCopyWith<UserAuthorizedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAuthorizedModelCopyWith<$Res> {
  factory $UserAuthorizedModelCopyWith(
          UserAuthorizedModel value, $Res Function(UserAuthorizedModel) then) =
      _$UserAuthorizedModelCopyWithImpl<$Res, UserAuthorizedModel>;
  @useResult
  $Res call(
      {String? id,
      String? firstName,
      String? lastName,
      String? username,
      double role,
      String accessToken,
      String refreshToken,
      double expiresIn});
}

/// @nodoc
class _$UserAuthorizedModelCopyWithImpl<$Res, $Val extends UserAuthorizedModel>
    implements $UserAuthorizedModelCopyWith<$Res> {
  _$UserAuthorizedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? username = freezed,
    Object? role = null,
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiresIn = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as double,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserAuthorizedModelCopyWith<$Res>
    implements $UserAuthorizedModelCopyWith<$Res> {
  factory _$$_UserAuthorizedModelCopyWith(_$_UserAuthorizedModel value,
          $Res Function(_$_UserAuthorizedModel) then) =
      __$$_UserAuthorizedModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? firstName,
      String? lastName,
      String? username,
      double role,
      String accessToken,
      String refreshToken,
      double expiresIn});
}

/// @nodoc
class __$$_UserAuthorizedModelCopyWithImpl<$Res>
    extends _$UserAuthorizedModelCopyWithImpl<$Res, _$_UserAuthorizedModel>
    implements _$$_UserAuthorizedModelCopyWith<$Res> {
  __$$_UserAuthorizedModelCopyWithImpl(_$_UserAuthorizedModel _value,
      $Res Function(_$_UserAuthorizedModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? username = freezed,
    Object? role = null,
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiresIn = null,
  }) {
    return _then(_$_UserAuthorizedModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as double,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserAuthorizedModel implements _UserAuthorizedModel {
  const _$_UserAuthorizedModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.username,
      required this.role,
      required this.accessToken,
      required this.refreshToken,
      required this.expiresIn});

  factory _$_UserAuthorizedModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserAuthorizedModelFromJson(json);

  @override
  final String? id;
  @override
  final String? firstName;
//firstName
  @override
  final String? lastName;
  @override
  final String? username;
//username
  @override
  final double role;
//role
  @override
  final String accessToken;
//accessToken
  @override
  final String refreshToken;
//refreshToken
  @override
  final double expiresIn;

  @override
  String toString() {
    return 'UserAuthorizedModel(id: $id, firstName: $firstName, lastName: $lastName, username: $username, role: $role, accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserAuthorizedModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName,
      username, role, accessToken, refreshToken, expiresIn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserAuthorizedModelCopyWith<_$_UserAuthorizedModel> get copyWith =>
      __$$_UserAuthorizedModelCopyWithImpl<_$_UserAuthorizedModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserAuthorizedModelToJson(
      this,
    );
  }
}

abstract class _UserAuthorizedModel implements UserAuthorizedModel {
  const factory _UserAuthorizedModel(
      {final String? id,
      final String? firstName,
      final String? lastName,
      final String? username,
      required final double role,
      required final String accessToken,
      required final String refreshToken,
      required final double expiresIn}) = _$_UserAuthorizedModel;

  factory _UserAuthorizedModel.fromJson(Map<String, dynamic> json) =
      _$_UserAuthorizedModel.fromJson;

  @override
  String? get id;
  @override
  String? get firstName;
  @override //firstName
  String? get lastName;
  @override
  String? get username;
  @override //username
  double get role;
  @override //role
  String get accessToken;
  @override //accessToken
  String get refreshToken;
  @override //refreshToken
  double get expiresIn;
  @override
  @JsonKey(ignore: true)
  _$$_UserAuthorizedModelCopyWith<_$_UserAuthorizedModel> get copyWith =>
      throw _privateConstructorUsedError;
}
