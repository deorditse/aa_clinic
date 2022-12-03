// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'real_time_call_socket_event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RealTimeCallSocketEvent _$RealTimeCallSocketEventFromJson(
    Map<String, dynamic> json) {
  return _RealTimeCallSocketEvent.fromJson(json);
}

/// @nodoc
mixin _$RealTimeCallSocketEvent {
  String get id => throw _privateConstructorUsedError;
  String get from => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RealTimeCallSocketEventCopyWith<RealTimeCallSocketEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RealTimeCallSocketEventCopyWith<$Res> {
  factory $RealTimeCallSocketEventCopyWith(RealTimeCallSocketEvent value,
          $Res Function(RealTimeCallSocketEvent) then) =
      _$RealTimeCallSocketEventCopyWithImpl<$Res, RealTimeCallSocketEvent>;
  @useResult
  $Res call({String id, String from});
}

/// @nodoc
class _$RealTimeCallSocketEventCopyWithImpl<$Res,
        $Val extends RealTimeCallSocketEvent>
    implements $RealTimeCallSocketEventCopyWith<$Res> {
  _$RealTimeCallSocketEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? from = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RealTimeCallSocketEventCopyWith<$Res>
    implements $RealTimeCallSocketEventCopyWith<$Res> {
  factory _$$_RealTimeCallSocketEventCopyWith(_$_RealTimeCallSocketEvent value,
          $Res Function(_$_RealTimeCallSocketEvent) then) =
      __$$_RealTimeCallSocketEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String from});
}

/// @nodoc
class __$$_RealTimeCallSocketEventCopyWithImpl<$Res>
    extends _$RealTimeCallSocketEventCopyWithImpl<$Res,
        _$_RealTimeCallSocketEvent>
    implements _$$_RealTimeCallSocketEventCopyWith<$Res> {
  __$$_RealTimeCallSocketEventCopyWithImpl(_$_RealTimeCallSocketEvent _value,
      $Res Function(_$_RealTimeCallSocketEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? from = null,
  }) {
    return _then(_$_RealTimeCallSocketEvent(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RealTimeCallSocketEvent implements _RealTimeCallSocketEvent {
  const _$_RealTimeCallSocketEvent({required this.id, required this.from});

  factory _$_RealTimeCallSocketEvent.fromJson(Map<String, dynamic> json) =>
      _$$_RealTimeCallSocketEventFromJson(json);

  @override
  final String id;
  @override
  final String from;

  @override
  String toString() {
    return 'RealTimeCallSocketEvent(id: $id, from: $from)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RealTimeCallSocketEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.from, from) || other.from == from));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, from);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RealTimeCallSocketEventCopyWith<_$_RealTimeCallSocketEvent>
      get copyWith =>
          __$$_RealTimeCallSocketEventCopyWithImpl<_$_RealTimeCallSocketEvent>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RealTimeCallSocketEventToJson(
      this,
    );
  }
}

abstract class _RealTimeCallSocketEvent implements RealTimeCallSocketEvent {
  const factory _RealTimeCallSocketEvent(
      {required final String id,
      required final String from}) = _$_RealTimeCallSocketEvent;

  factory _RealTimeCallSocketEvent.fromJson(Map<String, dynamic> json) =
      _$_RealTimeCallSocketEvent.fromJson;

  @override
  String get id;
  @override
  String get from;
  @override
  @JsonKey(ignore: true)
  _$$_RealTimeCallSocketEventCopyWith<_$_RealTimeCallSocketEvent>
      get copyWith => throw _privateConstructorUsedError;
}
