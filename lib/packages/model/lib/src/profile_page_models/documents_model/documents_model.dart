import 'package:freezed_annotation/freezed_annotation.dart';

part 'documents_model.freezed.dart';

part 'documents_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class DocumentForIdModel with _$DocumentForIdModel {
  const factory DocumentForIdModel({
    required String id,
    required String userId,
    String? creatorId,
    String? category,
    String? title,
    String? description,
    @Default([]) List<String?> attachmentsIds,
    @Default([]) List<Attachment?> attachments,
    String? createdAt,
    String? updatedAt,
  }) = _DocumentForIdModel;

  factory DocumentForIdModel.fromJson(Map<String, Object?> json) =>
      _$DocumentForIdModelFromJson(json);
}

@freezed
class Attachment with _$Attachment {
  const factory Attachment({
    String? id,
    String? userId,
    String? type,
    String? thumbnailFileId,
    String? fileId,
  }) = _Attachment;

  factory Attachment.fromJson(Map<String, Object?> json) =>
      _$AttachmentFromJson(json);
}
