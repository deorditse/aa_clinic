// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'calendar_appointments_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppointmentsModel _$AppointmentsModelFromJson(Map<String, dynamic> json) {
  return _AppointmentsModel.fromJson(json);
}

/// @nodoc
mixin _$AppointmentsModel {
  String get id => throw _privateConstructorUsedError;
  String get patientId => throw _privateConstructorUsedError;
  String get specialistId => throw _privateConstructorUsedError;
  SpecialistModel? get specialist => throw _privateConstructorUsedError;
  String? get healthComplaint => throw _privateConstructorUsedError;
  String? get videoFileId => throw _privateConstructorUsedError;
  String? get videoFileLink => throw _privateConstructorUsedError;
  String? get startedAt => throw _privateConstructorUsedError;
  String? get finishedAt => throw _privateConstructorUsedError;
  int get status =>
      throw _privateConstructorUsedError; //id кем был отменен прием
  String? get cancelBy => throw _privateConstructorUsedError; //причина отмены
  String? get cancelReason =>
      throw _privateConstructorUsedError; // оценка приема от специалиста
  RateBy? get rateBySpecialist =>
      throw _privateConstructorUsedError; //оценка приема от пациента
  RateBy? get rateByPatient => throw _privateConstructorUsedError;
  String? get conclusion => throw _privateConstructorUsedError;
  List<String?> get recommendations => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppointmentsModelCopyWith<AppointmentsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentsModelCopyWith<$Res> {
  factory $AppointmentsModelCopyWith(
          AppointmentsModel value, $Res Function(AppointmentsModel) then) =
      _$AppointmentsModelCopyWithImpl<$Res, AppointmentsModel>;
  @useResult
  $Res call(
      {String id,
      String patientId,
      String specialistId,
      SpecialistModel? specialist,
      String? healthComplaint,
      String? videoFileId,
      String? videoFileLink,
      String? startedAt,
      String? finishedAt,
      int status,
      String? cancelBy,
      String? cancelReason,
      RateBy? rateBySpecialist,
      RateBy? rateByPatient,
      String? conclusion,
      List<String?> recommendations,
      String? createdAt,
      String? updatedAt});

  $SpecialistModelCopyWith<$Res>? get specialist;
  $RateByCopyWith<$Res>? get rateBySpecialist;
  $RateByCopyWith<$Res>? get rateByPatient;
}

/// @nodoc
class _$AppointmentsModelCopyWithImpl<$Res, $Val extends AppointmentsModel>
    implements $AppointmentsModelCopyWith<$Res> {
  _$AppointmentsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? patientId = null,
    Object? specialistId = null,
    Object? specialist = freezed,
    Object? healthComplaint = freezed,
    Object? videoFileId = freezed,
    Object? videoFileLink = freezed,
    Object? startedAt = freezed,
    Object? finishedAt = freezed,
    Object? status = null,
    Object? cancelBy = freezed,
    Object? cancelReason = freezed,
    Object? rateBySpecialist = freezed,
    Object? rateByPatient = freezed,
    Object? conclusion = freezed,
    Object? recommendations = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
      specialistId: null == specialistId
          ? _value.specialistId
          : specialistId // ignore: cast_nullable_to_non_nullable
              as String,
      specialist: freezed == specialist
          ? _value.specialist
          : specialist // ignore: cast_nullable_to_non_nullable
              as SpecialistModel?,
      healthComplaint: freezed == healthComplaint
          ? _value.healthComplaint
          : healthComplaint // ignore: cast_nullable_to_non_nullable
              as String?,
      videoFileId: freezed == videoFileId
          ? _value.videoFileId
          : videoFileId // ignore: cast_nullable_to_non_nullable
              as String?,
      videoFileLink: freezed == videoFileLink
          ? _value.videoFileLink
          : videoFileLink // ignore: cast_nullable_to_non_nullable
              as String?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      finishedAt: freezed == finishedAt
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      cancelBy: freezed == cancelBy
          ? _value.cancelBy
          : cancelBy // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelReason: freezed == cancelReason
          ? _value.cancelReason
          : cancelReason // ignore: cast_nullable_to_non_nullable
              as String?,
      rateBySpecialist: freezed == rateBySpecialist
          ? _value.rateBySpecialist
          : rateBySpecialist // ignore: cast_nullable_to_non_nullable
              as RateBy?,
      rateByPatient: freezed == rateByPatient
          ? _value.rateByPatient
          : rateByPatient // ignore: cast_nullable_to_non_nullable
              as RateBy?,
      conclusion: freezed == conclusion
          ? _value.conclusion
          : conclusion // ignore: cast_nullable_to_non_nullable
              as String?,
      recommendations: null == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as List<String?>,
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

  @override
  @pragma('vm:prefer-inline')
  $SpecialistModelCopyWith<$Res>? get specialist {
    if (_value.specialist == null) {
      return null;
    }

    return $SpecialistModelCopyWith<$Res>(_value.specialist!, (value) {
      return _then(_value.copyWith(specialist: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RateByCopyWith<$Res>? get rateBySpecialist {
    if (_value.rateBySpecialist == null) {
      return null;
    }

    return $RateByCopyWith<$Res>(_value.rateBySpecialist!, (value) {
      return _then(_value.copyWith(rateBySpecialist: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RateByCopyWith<$Res>? get rateByPatient {
    if (_value.rateByPatient == null) {
      return null;
    }

    return $RateByCopyWith<$Res>(_value.rateByPatient!, (value) {
      return _then(_value.copyWith(rateByPatient: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AppointmentsModelCopyWith<$Res>
    implements $AppointmentsModelCopyWith<$Res> {
  factory _$$_AppointmentsModelCopyWith(_$_AppointmentsModel value,
          $Res Function(_$_AppointmentsModel) then) =
      __$$_AppointmentsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String patientId,
      String specialistId,
      SpecialistModel? specialist,
      String? healthComplaint,
      String? videoFileId,
      String? videoFileLink,
      String? startedAt,
      String? finishedAt,
      int status,
      String? cancelBy,
      String? cancelReason,
      RateBy? rateBySpecialist,
      RateBy? rateByPatient,
      String? conclusion,
      List<String?> recommendations,
      String? createdAt,
      String? updatedAt});

  @override
  $SpecialistModelCopyWith<$Res>? get specialist;
  @override
  $RateByCopyWith<$Res>? get rateBySpecialist;
  @override
  $RateByCopyWith<$Res>? get rateByPatient;
}

/// @nodoc
class __$$_AppointmentsModelCopyWithImpl<$Res>
    extends _$AppointmentsModelCopyWithImpl<$Res, _$_AppointmentsModel>
    implements _$$_AppointmentsModelCopyWith<$Res> {
  __$$_AppointmentsModelCopyWithImpl(
      _$_AppointmentsModel _value, $Res Function(_$_AppointmentsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? patientId = null,
    Object? specialistId = null,
    Object? specialist = freezed,
    Object? healthComplaint = freezed,
    Object? videoFileId = freezed,
    Object? videoFileLink = freezed,
    Object? startedAt = freezed,
    Object? finishedAt = freezed,
    Object? status = null,
    Object? cancelBy = freezed,
    Object? cancelReason = freezed,
    Object? rateBySpecialist = freezed,
    Object? rateByPatient = freezed,
    Object? conclusion = freezed,
    Object? recommendations = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_AppointmentsModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
      specialistId: null == specialistId
          ? _value.specialistId
          : specialistId // ignore: cast_nullable_to_non_nullable
              as String,
      specialist: freezed == specialist
          ? _value.specialist
          : specialist // ignore: cast_nullable_to_non_nullable
              as SpecialistModel?,
      healthComplaint: freezed == healthComplaint
          ? _value.healthComplaint
          : healthComplaint // ignore: cast_nullable_to_non_nullable
              as String?,
      videoFileId: freezed == videoFileId
          ? _value.videoFileId
          : videoFileId // ignore: cast_nullable_to_non_nullable
              as String?,
      videoFileLink: freezed == videoFileLink
          ? _value.videoFileLink
          : videoFileLink // ignore: cast_nullable_to_non_nullable
              as String?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      finishedAt: freezed == finishedAt
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      cancelBy: freezed == cancelBy
          ? _value.cancelBy
          : cancelBy // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelReason: freezed == cancelReason
          ? _value.cancelReason
          : cancelReason // ignore: cast_nullable_to_non_nullable
              as String?,
      rateBySpecialist: freezed == rateBySpecialist
          ? _value.rateBySpecialist
          : rateBySpecialist // ignore: cast_nullable_to_non_nullable
              as RateBy?,
      rateByPatient: freezed == rateByPatient
          ? _value.rateByPatient
          : rateByPatient // ignore: cast_nullable_to_non_nullable
              as RateBy?,
      conclusion: freezed == conclusion
          ? _value.conclusion
          : conclusion // ignore: cast_nullable_to_non_nullable
              as String?,
      recommendations: null == recommendations
          ? _value._recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as List<String?>,
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
class _$_AppointmentsModel implements _AppointmentsModel {
  const _$_AppointmentsModel(
      {required this.id,
      required this.patientId,
      required this.specialistId,
      this.specialist,
      this.healthComplaint,
      this.videoFileId,
      this.videoFileLink,
      this.startedAt,
      this.finishedAt,
      required this.status,
      this.cancelBy,
      this.cancelReason,
      this.rateBySpecialist,
      this.rateByPatient,
      this.conclusion,
      final List<String?> recommendations = const [],
      this.createdAt,
      this.updatedAt})
      : _recommendations = recommendations;

  factory _$_AppointmentsModel.fromJson(Map<String, dynamic> json) =>
      _$$_AppointmentsModelFromJson(json);

  @override
  final String id;
  @override
  final String patientId;
  @override
  final String specialistId;
  @override
  final SpecialistModel? specialist;
  @override
  final String? healthComplaint;
  @override
  final String? videoFileId;
  @override
  final String? videoFileLink;
  @override
  final String? startedAt;
  @override
  final String? finishedAt;
  @override
  final int status;
//id кем был отменен прием
  @override
  final String? cancelBy;
//причина отмены
  @override
  final String? cancelReason;
// оценка приема от специалиста
  @override
  final RateBy? rateBySpecialist;
//оценка приема от пациента
  @override
  final RateBy? rateByPatient;
  @override
  final String? conclusion;
  final List<String?> _recommendations;
  @override
  @JsonKey()
  List<String?> get recommendations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'AppointmentsModel(id: $id, patientId: $patientId, specialistId: $specialistId, specialist: $specialist, healthComplaint: $healthComplaint, videoFileId: $videoFileId, videoFileLink: $videoFileLink, startedAt: $startedAt, finishedAt: $finishedAt, status: $status, cancelBy: $cancelBy, cancelReason: $cancelReason, rateBySpecialist: $rateBySpecialist, rateByPatient: $rateByPatient, conclusion: $conclusion, recommendations: $recommendations, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppointmentsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.specialistId, specialistId) ||
                other.specialistId == specialistId) &&
            (identical(other.specialist, specialist) ||
                other.specialist == specialist) &&
            (identical(other.healthComplaint, healthComplaint) ||
                other.healthComplaint == healthComplaint) &&
            (identical(other.videoFileId, videoFileId) ||
                other.videoFileId == videoFileId) &&
            (identical(other.videoFileLink, videoFileLink) ||
                other.videoFileLink == videoFileLink) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.finishedAt, finishedAt) ||
                other.finishedAt == finishedAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.cancelBy, cancelBy) ||
                other.cancelBy == cancelBy) &&
            (identical(other.cancelReason, cancelReason) ||
                other.cancelReason == cancelReason) &&
            (identical(other.rateBySpecialist, rateBySpecialist) ||
                other.rateBySpecialist == rateBySpecialist) &&
            (identical(other.rateByPatient, rateByPatient) ||
                other.rateByPatient == rateByPatient) &&
            (identical(other.conclusion, conclusion) ||
                other.conclusion == conclusion) &&
            const DeepCollectionEquality()
                .equals(other._recommendations, _recommendations) &&
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
      patientId,
      specialistId,
      specialist,
      healthComplaint,
      videoFileId,
      videoFileLink,
      startedAt,
      finishedAt,
      status,
      cancelBy,
      cancelReason,
      rateBySpecialist,
      rateByPatient,
      conclusion,
      const DeepCollectionEquality().hash(_recommendations),
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppointmentsModelCopyWith<_$_AppointmentsModel> get copyWith =>
      __$$_AppointmentsModelCopyWithImpl<_$_AppointmentsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppointmentsModelToJson(
      this,
    );
  }
}

abstract class _AppointmentsModel implements AppointmentsModel {
  const factory _AppointmentsModel(
      {required final String id,
      required final String patientId,
      required final String specialistId,
      final SpecialistModel? specialist,
      final String? healthComplaint,
      final String? videoFileId,
      final String? videoFileLink,
      final String? startedAt,
      final String? finishedAt,
      required final int status,
      final String? cancelBy,
      final String? cancelReason,
      final RateBy? rateBySpecialist,
      final RateBy? rateByPatient,
      final String? conclusion,
      final List<String?> recommendations,
      final String? createdAt,
      final String? updatedAt}) = _$_AppointmentsModel;

  factory _AppointmentsModel.fromJson(Map<String, dynamic> json) =
      _$_AppointmentsModel.fromJson;

  @override
  String get id;
  @override
  String get patientId;
  @override
  String get specialistId;
  @override
  SpecialistModel? get specialist;
  @override
  String? get healthComplaint;
  @override
  String? get videoFileId;
  @override
  String? get videoFileLink;
  @override
  String? get startedAt;
  @override
  String? get finishedAt;
  @override
  int get status;
  @override //id кем был отменен прием
  String? get cancelBy;
  @override //причина отмены
  String? get cancelReason;
  @override // оценка приема от специалиста
  RateBy? get rateBySpecialist;
  @override //оценка приема от пациента
  RateBy? get rateByPatient;
  @override
  String? get conclusion;
  @override
  List<String?> get recommendations;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_AppointmentsModelCopyWith<_$_AppointmentsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

SpecialistModel _$SpecialistModelFromJson(Map<String, dynamic> json) {
  return _SpecialistModel.fromJson(json);
}

/// @nodoc
mixin _$SpecialistModel {
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get middleName => throw _privateConstructorUsedError;
  String? get bdate => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpecialistModelCopyWith<SpecialistModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialistModelCopyWith<$Res> {
  factory $SpecialistModelCopyWith(
          SpecialistModel value, $Res Function(SpecialistModel) then) =
      _$SpecialistModelCopyWithImpl<$Res, SpecialistModel>;
  @useResult
  $Res call(
      {String? firstName,
      String? lastName,
      String? middleName,
      String? bdate,
      String? avatar});
}

/// @nodoc
class _$SpecialistModelCopyWithImpl<$Res, $Val extends SpecialistModel>
    implements $SpecialistModelCopyWith<$Res> {
  _$SpecialistModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? middleName = freezed,
    Object? bdate = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      bdate: freezed == bdate
          ? _value.bdate
          : bdate // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SpecialistModelCopyWith<$Res>
    implements $SpecialistModelCopyWith<$Res> {
  factory _$$_SpecialistModelCopyWith(
          _$_SpecialistModel value, $Res Function(_$_SpecialistModel) then) =
      __$$_SpecialistModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? firstName,
      String? lastName,
      String? middleName,
      String? bdate,
      String? avatar});
}

/// @nodoc
class __$$_SpecialistModelCopyWithImpl<$Res>
    extends _$SpecialistModelCopyWithImpl<$Res, _$_SpecialistModel>
    implements _$$_SpecialistModelCopyWith<$Res> {
  __$$_SpecialistModelCopyWithImpl(
      _$_SpecialistModel _value, $Res Function(_$_SpecialistModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? middleName = freezed,
    Object? bdate = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_$_SpecialistModel(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      bdate: freezed == bdate
          ? _value.bdate
          : bdate // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SpecialistModel implements _SpecialistModel {
  const _$_SpecialistModel(
      {this.firstName,
      this.lastName,
      this.middleName,
      this.bdate,
      this.avatar});

  factory _$_SpecialistModel.fromJson(Map<String, dynamic> json) =>
      _$$_SpecialistModelFromJson(json);

  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? middleName;
  @override
  final String? bdate;
  @override
  final String? avatar;

  @override
  String toString() {
    return 'SpecialistModel(firstName: $firstName, lastName: $lastName, middleName: $middleName, bdate: $bdate, avatar: $avatar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SpecialistModel &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.bdate, bdate) || other.bdate == bdate) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, firstName, lastName, middleName, bdate, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SpecialistModelCopyWith<_$_SpecialistModel> get copyWith =>
      __$$_SpecialistModelCopyWithImpl<_$_SpecialistModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SpecialistModelToJson(
      this,
    );
  }
}

abstract class _SpecialistModel implements SpecialistModel {
  const factory _SpecialistModel(
      {final String? firstName,
      final String? lastName,
      final String? middleName,
      final String? bdate,
      final String? avatar}) = _$_SpecialistModel;

  factory _SpecialistModel.fromJson(Map<String, dynamic> json) =
      _$_SpecialistModel.fromJson;

  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get middleName;
  @override
  String? get bdate;
  @override
  String? get avatar;
  @override
  @JsonKey(ignore: true)
  _$$_SpecialistModelCopyWith<_$_SpecialistModel> get copyWith =>
      throw _privateConstructorUsedError;
}

RateBy _$RateByFromJson(Map<String, dynamic> json) {
  return _RateBy.fromJson(json);
}

/// @nodoc
mixin _$RateBy {
  int? get value =>
      throw _privateConstructorUsedError; //массив с позивными отзывами
  List<String?> get positive => throw _privateConstructorUsedError;
  List<String?> get negative => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RateByCopyWith<RateBy> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RateByCopyWith<$Res> {
  factory $RateByCopyWith(RateBy value, $Res Function(RateBy) then) =
      _$RateByCopyWithImpl<$Res, RateBy>;
  @useResult
  $Res call({int? value, List<String?> positive, List<String?> negative});
}

/// @nodoc
class _$RateByCopyWithImpl<$Res, $Val extends RateBy>
    implements $RateByCopyWith<$Res> {
  _$RateByCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? positive = null,
    Object? negative = null,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
      positive: null == positive
          ? _value.positive
          : positive // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      negative: null == negative
          ? _value.negative
          : negative // ignore: cast_nullable_to_non_nullable
              as List<String?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RateByCopyWith<$Res> implements $RateByCopyWith<$Res> {
  factory _$$_RateByCopyWith(_$_RateBy value, $Res Function(_$_RateBy) then) =
      __$$_RateByCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? value, List<String?> positive, List<String?> negative});
}

/// @nodoc
class __$$_RateByCopyWithImpl<$Res>
    extends _$RateByCopyWithImpl<$Res, _$_RateBy>
    implements _$$_RateByCopyWith<$Res> {
  __$$_RateByCopyWithImpl(_$_RateBy _value, $Res Function(_$_RateBy) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? positive = null,
    Object? negative = null,
  }) {
    return _then(_$_RateBy(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
      positive: null == positive
          ? _value._positive
          : positive // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      negative: null == negative
          ? _value._negative
          : negative // ignore: cast_nullable_to_non_nullable
              as List<String?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RateBy implements _RateBy {
  const _$_RateBy(
      {this.value,
      final List<String?> positive = const [],
      final List<String?> negative = const []})
      : _positive = positive,
        _negative = negative;

  factory _$_RateBy.fromJson(Map<String, dynamic> json) =>
      _$$_RateByFromJson(json);

  @override
  final int? value;
//массив с позивными отзывами
  final List<String?> _positive;
//массив с позивными отзывами
  @override
  @JsonKey()
  List<String?> get positive {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_positive);
  }

  final List<String?> _negative;
  @override
  @JsonKey()
  List<String?> get negative {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_negative);
  }

  @override
  String toString() {
    return 'RateBy(value: $value, positive: $positive, negative: $negative)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RateBy &&
            (identical(other.value, value) || other.value == value) &&
            const DeepCollectionEquality().equals(other._positive, _positive) &&
            const DeepCollectionEquality().equals(other._negative, _negative));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      value,
      const DeepCollectionEquality().hash(_positive),
      const DeepCollectionEquality().hash(_negative));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RateByCopyWith<_$_RateBy> get copyWith =>
      __$$_RateByCopyWithImpl<_$_RateBy>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RateByToJson(
      this,
    );
  }
}

abstract class _RateBy implements RateBy {
  const factory _RateBy(
      {final int? value,
      final List<String?> positive,
      final List<String?> negative}) = _$_RateBy;

  factory _RateBy.fromJson(Map<String, dynamic> json) = _$_RateBy.fromJson;

  @override
  int? get value;
  @override //массив с позивными отзывами
  List<String?> get positive;
  @override
  List<String?> get negative;
  @override
  @JsonKey(ignore: true)
  _$$_RateByCopyWith<_$_RateBy> get copyWith =>
      throw _privateConstructorUsedError;
}
