import 'package:freezed_annotation/freezed_annotation.dart';

part 'static_file_model.freezed.dart';

part 'static_file_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class StaticFileModel with _$StaticFileModel {
  const factory StaticFileModel({
    //id статического файла
    required String id,
    //id владельца файла
    String? ownerId,
    int? fileCategory,
    String? path,
    int? size,
    String? mimetype,
    String? fieldname,
    String? filename,
    String? originalname,
    String? createdAt,
    String? updatedAt,
    String? creatorId,
  }) = _StaticFileModel;

  factory StaticFileModel.fromJson(Map<String, Object?> json) =>
      _$StaticFileModelFromJson(json);
}
