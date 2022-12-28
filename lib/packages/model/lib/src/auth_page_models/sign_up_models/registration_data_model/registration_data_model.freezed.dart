// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegistrationDataModel _$RegistrationDataModelFromJson(
    Map<String, dynamic> json) {
  return _RegistrationDataModel.fromJson(json);
}

/// @nodoc
mixin _$RegistrationDataModel {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegistrationDataModelCopyWith<RegistrationDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationDataModelCopyWith<$Res> {
  factory $RegistrationDataModelCopyWith(RegistrationDataModel value,
          $Res Function(RegistrationDataModel) then) =
      _$RegistrationDataModelCopyWithImpl<$Res, RegistrationDataModel>;
  @useResult
  $Res call({String firstName, String lastName, String email, String password});
}

/// @nodoc
class _$RegistrationDataModelCopyWithImpl<$Res,
        $Val extends RegistrationDataModel>
    implements $RegistrationDataModelCopyWith<$Res> {
  _$RegistrationDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegistrationDataModelCopyWith<$Res>
    implements $RegistrationDataModelCopyWith<$Res> {
  factory _$$_RegistrationDataModelCopyWith(_$_RegistrationDataModel value,
          $Res Function(_$_RegistrationDataModel) then) =
      __$$_RegistrationDataModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String firstName, String lastName, String email, String password});
}

/// @nodoc
class __$$_RegistrationDataModelCopyWithImpl<$Res>
    extends _$RegistrationDataModelCopyWithImpl<$Res, _$_RegistrationDataModel>
    implements _$$_RegistrationDataModelCopyWith<$Res> {
  __$$_RegistrationDataModelCopyWithImpl(_$_RegistrationDataModel _value,
      $Res Function(_$_RegistrationDataModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_RegistrationDataModel(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RegistrationDataModel implements _RegistrationDataModel {
  const _$_RegistrationDataModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password});

  factory _$_RegistrationDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_RegistrationDataModelFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'RegistrationDataModel(firstName: $firstName, lastName: $lastName, email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegistrationDataModel &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, firstName, lastName, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegistrationDataModelCopyWith<_$_RegistrationDataModel> get copyWith =>
      __$$_RegistrationDataModelCopyWithImpl<_$_RegistrationDataModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegistrationDataModelToJson(
      this,
    );
  }
}

abstract class _RegistrationDataModel implements RegistrationDataModel {
  const factory _RegistrationDataModel(
      {required final String firstName,
      required final String lastName,
      required final String email,
      required final String password}) = _$_RegistrationDataModel;

  factory _RegistrationDataModel.fromJson(Map<String, dynamic> json) =
      _$_RegistrationDataModel.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_RegistrationDataModelCopyWith<_$_RegistrationDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
