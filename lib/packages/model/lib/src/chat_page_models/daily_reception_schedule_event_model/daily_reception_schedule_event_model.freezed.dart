// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_reception_schedule_event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DailyReceptionScheduleEventModel _$DailyReceptionScheduleEventModelFromJson(
    Map<String, dynamic> json) {
  return _DailyReceptionScheduleEventModel.fromJson(json);
}

/// @nodoc
mixin _$DailyReceptionScheduleEventModel {
//Окна на этот день. PatientId и appointmentId могуть быть null (если никто не makeAnAppointment на это окно).
  String get id => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get startedAt => throw _privateConstructorUsedError;
  String? get finishedAt => throw _privateConstructorUsedError;
  String? get patientId => throw _privateConstructorUsedError;
  String? get appointmentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyReceptionScheduleEventModelCopyWith<DailyReceptionScheduleEventModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyReceptionScheduleEventModelCopyWith<$Res> {
  factory $DailyReceptionScheduleEventModelCopyWith(
          DailyReceptionScheduleEventModel value,
          $Res Function(DailyReceptionScheduleEventModel) then) =
      _$DailyReceptionScheduleEventModelCopyWithImpl<$Res,
          DailyReceptionScheduleEventModel>;
  @useResult
  $Res call(
      {String id,
      String? userId,
      String? startedAt,
      String? finishedAt,
      String? patientId,
      String? appointmentId});
}

/// @nodoc
class _$DailyReceptionScheduleEventModelCopyWithImpl<$Res,
        $Val extends DailyReceptionScheduleEventModel>
    implements $DailyReceptionScheduleEventModelCopyWith<$Res> {
  _$DailyReceptionScheduleEventModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? startedAt = freezed,
    Object? finishedAt = freezed,
    Object? patientId = freezed,
    Object? appointmentId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      finishedAt: freezed == finishedAt
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      patientId: freezed == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String?,
      appointmentId: freezed == appointmentId
          ? _value.appointmentId
          : appointmentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DailyReceptionScheduleEventModelCopyWith<$Res>
    implements $DailyReceptionScheduleEventModelCopyWith<$Res> {
  factory _$$_DailyReceptionScheduleEventModelCopyWith(
          _$_DailyReceptionScheduleEventModel value,
          $Res Function(_$_DailyReceptionScheduleEventModel) then) =
      __$$_DailyReceptionScheduleEventModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? userId,
      String? startedAt,
      String? finishedAt,
      String? patientId,
      String? appointmentId});
}

/// @nodoc
class __$$_DailyReceptionScheduleEventModelCopyWithImpl<$Res>
    extends _$DailyReceptionScheduleEventModelCopyWithImpl<$Res,
        _$_DailyReceptionScheduleEventModel>
    implements _$$_DailyReceptionScheduleEventModelCopyWith<$Res> {
  __$$_DailyReceptionScheduleEventModelCopyWithImpl(
      _$_DailyReceptionScheduleEventModel _value,
      $Res Function(_$_DailyReceptionScheduleEventModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? startedAt = freezed,
    Object? finishedAt = freezed,
    Object? patientId = freezed,
    Object? appointmentId = freezed,
  }) {
    return _then(_$_DailyReceptionScheduleEventModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      finishedAt: freezed == finishedAt
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      patientId: freezed == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String?,
      appointmentId: freezed == appointmentId
          ? _value.appointmentId
          : appointmentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DailyReceptionScheduleEventModel
    implements _DailyReceptionScheduleEventModel {
  const _$_DailyReceptionScheduleEventModel(
      {required this.id,
      this.userId,
      this.startedAt,
      this.finishedAt,
      this.patientId,
      this.appointmentId});

  factory _$_DailyReceptionScheduleEventModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_DailyReceptionScheduleEventModelFromJson(json);

//Окна на этот день. PatientId и appointmentId могуть быть null (если никто не makeAnAppointment на это окно).
  @override
  final String id;
  @override
  final String? userId;
  @override
  final String? startedAt;
  @override
  final String? finishedAt;
  @override
  final String? patientId;
  @override
  final String? appointmentId;

  @override
  String toString() {
    return 'DailyReceptionScheduleEventModel(id: $id, userId: $userId, startedAt: $startedAt, finishedAt: $finishedAt, patientId: $patientId, appointmentId: $appointmentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DailyReceptionScheduleEventModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.finishedAt, finishedAt) ||
                other.finishedAt == finishedAt) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, startedAt, finishedAt, patientId, appointmentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DailyReceptionScheduleEventModelCopyWith<
          _$_DailyReceptionScheduleEventModel>
      get copyWith => __$$_DailyReceptionScheduleEventModelCopyWithImpl<
          _$_DailyReceptionScheduleEventModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DailyReceptionScheduleEventModelToJson(
      this,
    );
  }
}

abstract class _DailyReceptionScheduleEventModel
    implements DailyReceptionScheduleEventModel {
  const factory _DailyReceptionScheduleEventModel(
      {required final String id,
      final String? userId,
      final String? startedAt,
      final String? finishedAt,
      final String? patientId,
      final String? appointmentId}) = _$_DailyReceptionScheduleEventModel;

  factory _DailyReceptionScheduleEventModel.fromJson(
      Map<String, dynamic> json) = _$_DailyReceptionScheduleEventModel.fromJson;

  @override //Окна на этот день. PatientId и appointmentId могуть быть null (если никто не makeAnAppointment на это окно).
  String get id;
  @override
  String? get userId;
  @override
  String? get startedAt;
  @override
  String? get finishedAt;
  @override
  String? get patientId;
  @override
  String? get appointmentId;
  @override
  @JsonKey(ignore: true)
  _$$_DailyReceptionScheduleEventModelCopyWith<
          _$_DailyReceptionScheduleEventModel>
      get copyWith => throw _privateConstructorUsedError;
}
