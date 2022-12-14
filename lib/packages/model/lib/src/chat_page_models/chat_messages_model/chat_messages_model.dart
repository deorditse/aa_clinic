import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_messages_model.freezed.dart';

part 'chat_messages_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class ChatMessagesModel with _$ChatMessagesModel{
  const factory ChatMessagesModel({
    @Default([]) List<MessageModel> docs,
    int? totalDocs,
    int? limit,
    @Default(1) int page,
    int? totalPages,
    int? offset,
    bool? hasPrevPage,
    bool? hasNextPage,
    String? prevPage,
    String? nextPage,
  }) = _OfficialChatMessagesModel;

  factory ChatMessagesModel.fromJson(Map<String, Object?> json) =>
      _$ChatMessagesModelFromJson(json);
}

@freezed
class MessageModel with _$MessageModel {
  const factory MessageModel({
    required String id,
    String? chatId,
    String? senderId,
    String? recipientId,
    String? text,
    int? status,
    @Default(false) bool isReaded,
    @Default([]) List<String?> attachmentsIds,
    @Default([]) List<AttachmentsModel?> attachments,
    String? readedAt,
    String? createdAt,
    String? updatedAt,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, Object?> json) =>
      _$MessageModelFromJson(json);
}

@freezed
class AttachmentsModel with _$AttachmentsModel {
  const factory AttachmentsModel({
    required String id,
    String? userId,
    String? type, //example: img/png
    String? fileId,
    String? thumbnailFileId,
  }) = _AttachmentsModel;

  factory AttachmentsModel.fromJson(Map<String, Object?> json) =>
      _$AttachmentsModelFromJson(json);
}
