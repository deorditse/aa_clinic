import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:model/src/profile_page_models/documents_model/documents_model.dart';

part 'documents_list_model.freezed.dart';

part 'documents_list_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@unfreezed
class DocumentsListModel with _$DocumentsListModel {
  factory DocumentsListModel({
    @Default([]) List<DocumentForIdModel> docs,
    required int totalDocs,
    @Default(0) int limit,
    @Default(1) int page,
    int? totalPages,
    bool? hasPrevPage,
    bool? hasNextPage,
    int? prevPage,
    int? nextPage,
  }) = _DocumentsListModel;

  factory DocumentsListModel.fromJson(Map<String, Object?> json) =>
      _$DocumentsListModelFromJson(json);
}
