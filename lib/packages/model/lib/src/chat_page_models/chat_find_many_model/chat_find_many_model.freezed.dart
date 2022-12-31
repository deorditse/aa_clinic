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
  set id(String value) => throw _privateConstructorUsedError;
  UserMinifiedDataIdModel? get userMinifiedData =>
      throw _privateConstructorUsedError;
  set userMinifiedData(UserMinifiedDataIdModel? value) =>
      throw _privateConstructorUsedError;
  String? get specialistId => throw _privateConstructorUsedError;
  set specialistId(String? value) => throw _privateConstructorUsedError;
  String? get patientId => throw _privateConstructorUsedError;
  set patientId(String? value) => throw _privateConstructorUsedError;
  bool get isHidden => throw _privateConstructorUsedError;
  set isHidden(bool value) => throw _privateConstructorUsedError;
  String? get lastMessageDate => throw _privateConstructorUsedError;
  set lastMessageDate(String? value) => throw _privateConstructorUsedError;
  String? get lastMessage => throw _privateConstructorUsedError;
  set lastMessage(String? value) => throw _privateConstructorUsedError;
  int? get unreadedMessages => throw _privateConstructorUsedError;
  set unreadedMessages(int? value) => throw _privateConstructorUsedError;
  bool get isSpecialistOnline => throw _privateConstructorUsedError;
  set isSpecialistOnline(bool value) => throw _privateConstructorUsedError;

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
      UserMinifiedDataIdModel? userMinifiedData,
      String? specialistId,
      String? patientId,
      bool isHidden,
      String? lastMessageDate,
      String? lastMessage,
      int? unreadedMessages,
      bool isSpecialistOnline});

  $UserMinifiedDataIdModelCopyWith<$Res>? get userMinifiedData;
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
    Object? userMinifiedData = freezed,
    Object? specialistId = freezed,
    Object? patientId = freezed,
    Object? isHidden = null,
    Object? lastMessageDate = freezed,
    Object? lastMessage = freezed,
    Object? unreadedMessages = freezed,
    Object? isSpecialistOnline = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userMinifiedData: freezed == userMinifiedData
          ? _value.userMinifiedData
          : userMinifiedData // ignore: cast_nullable_to_non_nullable
              as UserMinifiedDataIdModel?,
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
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      unreadedMessages: freezed == unreadedMessages
          ? _value.unreadedMessages
          : unreadedMessages // ignore: cast_nullable_to_non_nullable
              as int?,
      isSpecialistOnline: null == isSpecialistOnline
          ? _value.isSpecialistOnline
          : isSpecialistOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserMinifiedDataIdModelCopyWith<$Res>? get userMinifiedData {
    if (_value.userMinifiedData == null) {
      return null;
    }

    return $UserMinifiedDataIdModelCopyWith<$Res>(_value.userMinifiedData!,
        (value) {
      return _then(_value.copyWith(userMinifiedData: value) as $Val);
    });
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
      UserMinifiedDataIdModel? userMinifiedData,
      String? specialistId,
      String? patientId,
      bool isHidden,
      String? lastMessageDate,
      String? lastMessage,
      int? unreadedMessages,
      bool isSpecialistOnline});

  @override
  $UserMinifiedDataIdModelCopyWith<$Res>? get userMinifiedData;
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
    Object? userMinifiedData = freezed,
    Object? specialistId = freezed,
    Object? patientId = freezed,
    Object? isHidden = null,
    Object? lastMessageDate = freezed,
    Object? lastMessage = freezed,
    Object? unreadedMessages = freezed,
    Object? isSpecialistOnline = null,
  }) {
    return _then(_$_ChatFindManyModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userMinifiedData: freezed == userMinifiedData
          ? _value.userMinifiedData
          : userMinifiedData // ignore: cast_nullable_to_non_nullable
              as UserMinifiedDataIdModel?,
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
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      unreadedMessages: freezed == unreadedMessages
          ? _value.unreadedMessages
          : unreadedMessages // ignore: cast_nullable_to_non_nullable
              as int?,
      isSpecialistOnline: null == isSpecialistOnline
          ? _value.isSpecialistOnline
          : isSpecialistOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatFindManyModel implements _ChatFindManyModel {
  _$_ChatFindManyModel(
      {required this.id,
      this.userMinifiedData,
      this.specialistId,
      this.patientId,
      this.isHidden = false,
      this.lastMessageDate,
      this.lastMessage,
      this.unreadedMessages,
      required this.isSpecialistOnline});

  factory _$_ChatFindManyModel.fromJson(Map<String, dynamic> json) =>
      _$$_ChatFindManyModelFromJson(json);

  @override
  String id;
  @override
  UserMinifiedDataIdModel? userMinifiedData;
  @override
  String? specialistId;
  @override
  String? patientId;
  @override
  @JsonKey()
  bool isHidden;
  @override
  String? lastMessageDate;
  @override
  String? lastMessage;
  @override
  int? unreadedMessages;
  @override
  bool isSpecialistOnline;

  @override
  String toString() {
    return 'ChatFindManyModel(id: $id, userMinifiedData: $userMinifiedData, specialistId: $specialistId, patientId: $patientId, isHidden: $isHidden, lastMessageDate: $lastMessageDate, lastMessage: $lastMessage, unreadedMessages: $unreadedMessages, isSpecialistOnline: $isSpecialistOnline)';
  }

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
  factory _ChatFindManyModel(
      {required String id,
      UserMinifiedDataIdModel? userMinifiedData,
      String? specialistId,
      String? patientId,
      bool isHidden,
      String? lastMessageDate,
      String? lastMessage,
      int? unreadedMessages,
      required bool isSpecialistOnline}) = _$_ChatFindManyModel;

  factory _ChatFindManyModel.fromJson(Map<String, dynamic> json) =
      _$_ChatFindManyModel.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  UserMinifiedDataIdModel? get userMinifiedData;
  set userMinifiedData(UserMinifiedDataIdModel? value);
  @override
  String? get specialistId;
  set specialistId(String? value);
  @override
  String? get patientId;
  set patientId(String? value);
  @override
  bool get isHidden;
  set isHidden(bool value);
  @override
  String? get lastMessageDate;
  set lastMessageDate(String? value);
  @override
  String? get lastMessage;
  set lastMessage(String? value);
  @override
  int? get unreadedMessages;
  set unreadedMessages(int? value);
  @override
  bool get isSpecialistOnline;
  set isSpecialistOnline(bool value);
  @override
  @JsonKey(ignore: true)
  _$$_ChatFindManyModelCopyWith<_$_ChatFindManyModel> get copyWith =>
      throw _privateConstructorUsedError;
}
