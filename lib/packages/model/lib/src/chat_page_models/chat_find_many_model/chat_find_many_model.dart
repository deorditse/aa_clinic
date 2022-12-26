import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_find_many_model.freezed.dart';

part 'chat_find_many_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class ChatFindManyModel with _$ChatFindManyModel {
  const factory ChatFindManyModel({
    required String id,
    String? specialistId,
    String? patientId,
    @Default(false) bool isHidden,
    String? lastMessageDate,
    String? lastMessage,
    int? unreadedMessages,
  }) = _ChatFindManyModel;

  factory ChatFindManyModel.fromJson(Map<String, Object?> json) =>
      _$ChatFindManyModelFromJson(json);
}
