// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'calendar_actions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CalendarActionsWithIdModel _$CalendarActionsWithIdModelFromJson(
    Map<String, dynamic> json) {
  return _CalendarActionsWithIdModel.fromJson(json);
}

/// @nodoc
mixin _$CalendarActionsWithIdModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get creatorId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError; //
// ///ToDo: what type data???
  Map<dynamic, dynamic> get data => throw _privateConstructorUsedError;
  String? get startedAt => throw _privateConstructorUsedError;
  String? get finishedAt => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get isCanceled => throw _privateConstructorUsedError; //Причина отмены
  String? get cancelReason => throw _privateConstructorUsedError;
  String? get canceledAt => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalendarActionsWithIdModelCopyWith<CalendarActionsWithIdModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarActionsWithIdModelCopyWith<$Res> {
  factory $CalendarActionsWithIdModelCopyWith(CalendarActionsWithIdModel value,
          $Res Function(CalendarActionsWithIdModel) then) =
      _$CalendarActionsWithIdModelCopyWithImpl<$Res,
          CalendarActionsWithIdModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String creatorId,
      String title,
      String type,
      Map<dynamic, dynamic> data,
      String? startedAt,
      String? finishedAt,
      String? description,
      bool isCanceled,
      String? cancelReason,
      String? canceledAt,
      bool isDone,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$CalendarActionsWithIdModelCopyWithImpl<$Res,
        $Val extends CalendarActionsWithIdModel>
    implements $CalendarActionsWithIdModelCopyWith<$Res> {
  _$CalendarActionsWithIdModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? creatorId = null,
    Object? title = null,
    Object? type = null,
    Object? data = null,
    Object? startedAt = freezed,
    Object? finishedAt = freezed,
    Object? description = freezed,
    Object? isCanceled = null,
    Object? cancelReason = freezed,
    Object? canceledAt = freezed,
    Object? isDone = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      finishedAt: freezed == finishedAt
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isCanceled: null == isCanceled
          ? _value.isCanceled
          : isCanceled // ignore: cast_nullable_to_non_nullable
              as bool,
      cancelReason: freezed == cancelReason
          ? _value.cancelReason
          : cancelReason // ignore: cast_nullable_to_non_nullable
              as String?,
      canceledAt: freezed == canceledAt
          ? _value.canceledAt
          : canceledAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CalendarActionsWithIdModelCopyWith<$Res>
    implements $CalendarActionsWithIdModelCopyWith<$Res> {
  factory _$$_CalendarActionsWithIdModelCopyWith(
          _$_CalendarActionsWithIdModel value,
          $Res Function(_$_CalendarActionsWithIdModel) then) =
      __$$_CalendarActionsWithIdModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String creatorId,
      String title,
      String type,
      Map<dynamic, dynamic> data,
      String? startedAt,
      String? finishedAt,
      String? description,
      bool isCanceled,
      String? cancelReason,
      String? canceledAt,
      bool isDone,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$$_CalendarActionsWithIdModelCopyWithImpl<$Res>
    extends _$CalendarActionsWithIdModelCopyWithImpl<$Res,
        _$_CalendarActionsWithIdModel>
    implements _$$_CalendarActionsWithIdModelCopyWith<$Res> {
  __$$_CalendarActionsWithIdModelCopyWithImpl(
      _$_CalendarActionsWithIdModel _value,
      $Res Function(_$_CalendarActionsWithIdModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? creatorId = null,
    Object? title = null,
    Object? type = null,
    Object? data = null,
    Object? startedAt = freezed,
    Object? finishedAt = freezed,
    Object? description = freezed,
    Object? isCanceled = null,
    Object? cancelReason = freezed,
    Object? canceledAt = freezed,
    Object? isDone = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_CalendarActionsWithIdModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      finishedAt: freezed == finishedAt
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isCanceled: null == isCanceled
          ? _value.isCanceled
          : isCanceled // ignore: cast_nullable_to_non_nullable
              as bool,
      cancelReason: freezed == cancelReason
          ? _value.cancelReason
          : cancelReason // ignore: cast_nullable_to_non_nullable
              as String?,
      canceledAt: freezed == canceledAt
          ? _value.canceledAt
          : canceledAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CalendarActionsWithIdModel implements _CalendarActionsWithIdModel {
  const _$_CalendarActionsWithIdModel(
      {required this.id,
      required this.userId,
      required this.creatorId,
      required this.title,
      required this.type,
      final Map<dynamic, dynamic> data = const {},
      this.startedAt,
      this.finishedAt,
      this.description,
      this.isCanceled = false,
      this.cancelReason,
      this.canceledAt,
      this.isDone = false,
      this.createdAt,
      this.updatedAt})
      : _data = data;

  factory _$_CalendarActionsWithIdModel.fromJson(Map<String, dynamic> json) =>
      _$$_CalendarActionsWithIdModelFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String creatorId;
  @override
  final String title;
  @override
  final String type;
//
// ///ToDo: what type data???
  final Map<dynamic, dynamic> _data;
//
// ///ToDo: what type data???
  @override
  @JsonKey()
  Map<dynamic, dynamic> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  final String? startedAt;
  @override
  final String? finishedAt;
  @override
  final String? description;
  @override
  @JsonKey()
  final bool isCanceled;
//Причина отмены
  @override
  final String? cancelReason;
  @override
  final String? canceledAt;
  @override
  @JsonKey()
  final bool isDone;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'CalendarActionsWithIdModel(id: $id, userId: $userId, creatorId: $creatorId, title: $title, type: $type, data: $data, startedAt: $startedAt, finishedAt: $finishedAt, description: $description, isCanceled: $isCanceled, cancelReason: $cancelReason, canceledAt: $canceledAt, isDone: $isDone, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalendarActionsWithIdModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.finishedAt, finishedAt) ||
                other.finishedAt == finishedAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isCanceled, isCanceled) ||
                other.isCanceled == isCanceled) &&
            (identical(other.cancelReason, cancelReason) ||
                other.cancelReason == cancelReason) &&
            (identical(other.canceledAt, canceledAt) ||
                other.canceledAt == canceledAt) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      creatorId,
      title,
      type,
      const DeepCollectionEquality().hash(_data),
      startedAt,
      finishedAt,
      description,
      isCanceled,
      cancelReason,
      canceledAt,
      isDone,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CalendarActionsWithIdModelCopyWith<_$_CalendarActionsWithIdModel>
      get copyWith => __$$_CalendarActionsWithIdModelCopyWithImpl<
          _$_CalendarActionsWithIdModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CalendarActionsWithIdModelToJson(
      this,
    );
  }
}

abstract class _CalendarActionsWithIdModel
    implements CalendarActionsWithIdModel {
  const factory _CalendarActionsWithIdModel(
      {required final String id,
      required final String userId,
      required final String creatorId,
      required final String title,
      required final String type,
      final Map<dynamic, dynamic> data,
      final String? startedAt,
      final String? finishedAt,
      final String? description,
      final bool isCanceled,
      final String? cancelReason,
      final String? canceledAt,
      final bool isDone,
      final String? createdAt,
      final String? updatedAt}) = _$_CalendarActionsWithIdModel;

  factory _CalendarActionsWithIdModel.fromJson(Map<String, dynamic> json) =
      _$_CalendarActionsWithIdModel.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get creatorId;
  @override
  String get title;
  @override
  String get type;
  @override //
// ///ToDo: what type data???
  Map<dynamic, dynamic> get data;
  @override
  String? get startedAt;
  @override
  String? get finishedAt;
  @override
  String? get description;
  @override
  bool get isCanceled;
  @override //Причина отмены
  String? get cancelReason;
  @override
  String? get canceledAt;
  @override
  bool get isDone;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_CalendarActionsWithIdModelCopyWith<_$_CalendarActionsWithIdModel>
      get copyWith => throw _privateConstructorUsedError;
}
