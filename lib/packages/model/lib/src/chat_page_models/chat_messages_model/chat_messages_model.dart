import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_messages_model.freezed.dart';

part 'chat_messages_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@unfreezed
class ChatMessagesModel with _$ChatMessagesModel {
  factory ChatMessagesModel({
    @Default([]) List<MessageModel> docs,
    int? totalDocs,
    int? limit,
    @Default(1) int page,
    int? totalPages,
    int? offset,
    bool? hasPrevPage,
    bool? hasNextPage,
    int? prevPage,
    int? nextPage,
  }) = _OfficialChatMessagesModel;

  factory ChatMessagesModel.fromJson(Map<String, Object?> json) =>
      _$ChatMessagesModelFromJson(json);
}

@unfreezed
class MessageModel with _$MessageModel {
  factory MessageModel({
    required String id,
    String? chatId,
    String? senderId,
    String? recipientId,
    String? text,
    int? status,
    @Default(false) bool isReaded,
    @Default([]) List<String?> attachmentsIds,
    @Default([]) List<AttachmentModel?> attachments,
    String? readedAt,
    String? createdAt,
    String? updatedAt,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, Object?> json) =>
      _$MessageModelFromJson(json);
}

@freezed
class AttachmentModel with _$AttachmentModel {
  const factory AttachmentModel({
    required String id,
    String? userId,
    String? type, //example: img/png
    String? fileId,
    String? thumbnailFileId,
  }) = _AttachmentModel;

  factory AttachmentModel.fromJson(Map<String, Object?> json) =>
      _$AttachmentModelFromJson(json);
}
