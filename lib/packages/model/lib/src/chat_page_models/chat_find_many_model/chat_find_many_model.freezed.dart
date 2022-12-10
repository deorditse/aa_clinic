// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_find_many_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatFindManyModel _$ChatFindManyModelFromJson(Map<String, dynamic> json) {
  return _ChatFindManyModel.fromJson(json);
}

/// @nodoc
mixin _$ChatFindManyModel {
  String get id => throw _privateConstructorUsedError;
  String? get specialistId => throw _privateConstructorUsedError;
  String? get patientId => throw _privateConstructorUsedError;
  bool get isHidden => throw _privateConstructorUsedError;
  String? get lastMessageDate => throw _privateConstructorUsedError;
  int? get unreadedMessages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatFindManyModelCopyWith<ChatFindManyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatFindManyModelCopyWith<$Res> {
  factory $ChatFindManyModelCopyWith(
          ChatFindManyModel value, $Res Function(ChatFindManyModel) then) =
      _$ChatFindManyModelCopyWithImpl<$Res, ChatFindManyModel>;
  @useResult
  $Res call(
      {String id,
      String? specialistId,
      String? patientId,
      bool isHidden,
      String? lastMessageDate,
      int? unreadedMessages});
}

/// @nodoc
class _$ChatFindManyModelCopyWithImpl<$Res, $Val extends ChatFindManyModel>
    implements $ChatFindManyModelCopyWith<$Res> {
  _$ChatFindManyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? specialistId = freezed,
    Object? patientId = freezed,
    Object? isHidden = null,
    Object? lastMessageDate = freezed,
    Object? unreadedMessages = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      specialistId: freezed == specialistId
          ? _value.specialistId
          : specialistId // ignore: cast_nullable_to_non_nullable
              as String?,
      patientId: freezed == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String?,
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      lastMessageDate: freezed == lastMessageDate
          ? _value.lastMessageDate
          : lastMessageDate // ignore: cast_nullable_to_non_nullable
              as String?,
      unreadedMessages: freezed == unreadedMessages
          ? _value.unreadedMessages
          : unreadedMessages // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatFindManyModelCopyWith<$Res>
    implements $ChatFindManyModelCopyWith<$Res> {
  factory _$$_ChatFindManyModelCopyWith(_$_ChatFindManyModel value,
          $Res Function(_$_ChatFindManyModel) then) =
      __$$_ChatFindManyModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? specialistId,
      String? patientId,
      bool isHidden,
      String? lastMessageDate,
      int? unreadedMessages});
}

/// @nodoc
class __$$_ChatFindManyModelCopyWithImpl<$Res>
    extends _$ChatFindManyModelCopyWithImpl<$Res, _$_ChatFindManyModel>
    implements _$$_ChatFindManyModelCopyWith<$Res> {
  __$$_ChatFindManyModelCopyWithImpl(
      _$_ChatFindManyModel _value, $Res Function(_$_ChatFindManyModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? specialistId = freezed,
    Object? patientId = freezed,
    Object? isHidden = null,
    Object? lastMessageDate = freezed,
    Object? unreadedMessages = freezed,
  }) {
    return _then(_$_ChatFindManyModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      specialistId: freezed == specialistId
          ? _value.specialistId
          : specialistId // ignore: cast_nullable_to_non_nullable
              as String?,
      patientId: freezed == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String?,
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      lastMessageDate: freezed == lastMessageDate
          ? _value.lastMessageDate
          : lastMessageDate // ignore: cast_nullable_to_non_nullable
              as String?,
      unreadedMessages: freezed == unreadedMessages
          ? _value.unreadedMessages
          : unreadedMessages // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatFindManyModel implements _ChatFindManyModel {
  const _$_ChatFindManyModel(
      {required this.id,
      this.specialistId,
      this.patientId,
      this.isHidden = false,
      this.lastMessageDate,
      this.unreadedMessages});

  factory _$_ChatFindManyModel.fromJson(Map<String, dynamic> json) =>
      _$$_ChatFindManyModelFromJson(json);

  @override
  final String id;
  @override
  final String? specialistId;
  @override
  final String? patientId;
  @override
  @JsonKey()
  final bool isHidden;
  @override
  final String? lastMessageDate;
  @override
  final int? unreadedMessages;

  @override
  String toString() {
    return 'ChatFindManyModel(id: $id, specialistId: $specialistId, patientId: $patientId, isHidden: $isHidden, lastMessageDate: $lastMessageDate, unreadedMessages: $unreadedMessages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatFindManyModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.specialistId, specialistId) ||
                other.specialistId == specialistId) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.isHidden, isHidden) ||
                other.isHidden == isHidden) &&
            (identical(other.lastMessageDate, lastMessageDate) ||
                other.lastMessageDate == lastMessageDate) &&
            (identical(other.unreadedMessages, unreadedMessages) ||
                other.unreadedMessages == unreadedMessages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, specialistId, patientId,
      isHidden, lastMessageDate, unreadedMessages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatFindManyModelCopyWith<_$_ChatFindManyModel> get copyWith =>
      __$$_ChatFindManyModelCopyWithImpl<_$_ChatFindManyModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatFindManyModelToJson(
      this,
    );
  }
}

abstract class _ChatFindManyModel implements ChatFindManyModel {
  const factory _ChatFindManyModel(
      {required final String id,
      final String? specialistId,
      final String? patientId,
      final bool isHidden,
      final String? lastMessageDate,
      final int? unreadedMessages}) = _$_ChatFindManyModel;

  factory _ChatFindManyModel.fromJson(Map<String, dynamic> json) =
      _$_ChatFindManyModel.fromJson;

  @override
  String get id;
  @override
  String? get specialistId;
  @override
  String? get patientId;
  @override
  bool get isHidden;
  @override
  String? get lastMessageDate;
  @override
  int? get unreadedMessages;
  @override
  @JsonKey(ignore: true)
  _$$_ChatFindManyModelCopyWith<_$_ChatFindManyModel> get copyWith =>
      throw _privateConstructorUsedError;
}
