// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_minified_data_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserMinifiedDataIdModel _$UserMinifiedDataIdModelFromJson(
    Map<String, dynamic> json) {
  return _UserMinifiedDataIdModel.fromJson(json);
}

/// @nodoc
mixin _$UserMinifiedDataIdModel {
  String get id => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get middleName => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  Map<String, String> get specialist => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserMinifiedDataIdModelCopyWith<UserMinifiedDataIdModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserMinifiedDataIdModelCopyWith<$Res> {
  factory $UserMinifiedDataIdModelCopyWith(UserMinifiedDataIdModel value,
          $Res Function(UserMinifiedDataIdModel) then) =
      _$UserMinifiedDataIdModelCopyWithImpl<$Res, UserMinifiedDataIdModel>;
  @useResult
  $Res call(
      {String id,
      String? lastName,
      String? firstName,
      String? middleName,
      String? avatar,
      Map<String, String> specialist});
}

/// @nodoc
class _$UserMinifiedDataIdModelCopyWithImpl<$Res,
        $Val extends UserMinifiedDataIdModel>
    implements $UserMinifiedDataIdModelCopyWith<$Res> {
  _$UserMinifiedDataIdModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lastName = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? avatar = freezed,
    Object? specialist = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      specialist: null == specialist
          ? _value.specialist
          : specialist // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserMinifiedDataIdModelCopyWith<$Res>
    implements $UserMinifiedDataIdModelCopyWith<$Res> {
  factory _$$_UserMinifiedDataIdModelCopyWith(_$_UserMinifiedDataIdModel value,
          $Res Function(_$_UserMinifiedDataIdModel) then) =
      __$$_UserMinifiedDataIdModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? lastName,
      String? firstName,
      String? middleName,
      String? avatar,
      Map<String, String> specialist});
}

/// @nodoc
class __$$_UserMinifiedDataIdModelCopyWithImpl<$Res>
    extends _$UserMinifiedDataIdModelCopyWithImpl<$Res,
        _$_UserMinifiedDataIdModel>
    implements _$$_UserMinifiedDataIdModelCopyWith<$Res> {
  __$$_UserMinifiedDataIdModelCopyWithImpl(_$_UserMinifiedDataIdModel _value,
      $Res Function(_$_UserMinifiedDataIdModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lastName = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? avatar = freezed,
    Object? specialist = null,
  }) {
    return _then(_$_UserMinifiedDataIdModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      specialist: null == specialist
          ? _value._specialist
          : specialist // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserMinifiedDataIdModel implements _UserMinifiedDataIdModel {
  _$_UserMinifiedDataIdModel(
      {required this.id,
      this.lastName,
      this.firstName,
      this.middleName,
      this.avatar,
      final Map<String, String> specialist = const {}})
      : _specialist = specialist;

  factory _$_UserMinifiedDataIdModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserMinifiedDataIdModelFromJson(json);

  @override
  final String id;
  @override
  final String? lastName;
  @override
  final String? firstName;
  @override
  final String? middleName;
  @override
  final String? avatar;
  final Map<String, String> _specialist;
  @override
  @JsonKey()
  Map<String, String> get specialist {
    if (_specialist is EqualUnmodifiableMapView) return _specialist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_specialist);
  }

  @override
  String toString() {
    return 'UserMinifiedDataIdModel(id: $id, lastName: $lastName, firstName: $firstName, middleName: $middleName, avatar: $avatar, specialist: $specialist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserMinifiedDataIdModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            const DeepCollectionEquality()
                .equals(other._specialist, _specialist));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, lastName, firstName,
      middleName, avatar, const DeepCollectionEquality().hash(_specialist));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserMinifiedDataIdModelCopyWith<_$_UserMinifiedDataIdModel>
      get copyWith =>
          __$$_UserMinifiedDataIdModelCopyWithImpl<_$_UserMinifiedDataIdModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserMinifiedDataIdModelToJson(
      this,
    );
  }
}

abstract class _UserMinifiedDataIdModel implements UserMinifiedDataIdModel {
  factory _UserMinifiedDataIdModel(
      {required final String id,
      final String? lastName,
      final String? firstName,
      final String? middleName,
      final String? avatar,
      final Map<String, String> specialist}) = _$_UserMinifiedDataIdModel;

  factory _UserMinifiedDataIdModel.fromJson(Map<String, dynamic> json) =
      _$_UserMinifiedDataIdModel.fromJson;

  @override
  String get id;
  @override
  String? get lastName;
  @override
  String? get firstName;
  @override
  String? get middleName;
  @override
  String? get avatar;
  @override
  Map<String, String> get specialist;
  @override
  @JsonKey(ignore: true)
  _$$_UserMinifiedDataIdModelCopyWith<_$_UserMinifiedDataIdModel>
      get copyWith => throw _privateConstructorUsedError;
}
