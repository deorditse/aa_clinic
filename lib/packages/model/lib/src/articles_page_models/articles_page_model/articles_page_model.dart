import 'package:freezed_annotation/freezed_annotation.dart';

part 'articles_page_model.freezed.dart';

part 'articles_page_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class ArticlesPageModel with _$ArticlesPageModel {
  const factory ArticlesPageModel({
    @Default([]) List<ArticleModel?> docs,
    required int totalDocs,
    int? limit,
    required int page,
    required int totalPages,
    @Default(false) bool hasPrevPage,
    @Default(false) bool hasNextPage,
    int? prevPage,
    int? nextPage,
  }) = _ArticlesPageModel;

  factory ArticlesPageModel.fromJson(Map<String, Object?> json) =>
      _$ArticlesPageModelFromJson(json);
}

@unfreezed
class ArticleModel with _$ArticleModel {
  factory ArticleModel({
    required String id,
    required String userId,
    required String title,
    required String body,
    String? coverFileId,
    String? category,
    @Default([]) List<String?> tags, //Массив с тэгs
    required int status,
    // //0 - draft, 1 - pending, 2 - published, -1 - rejected
    double? rate,
    String? rejectedReason, //Причина отклонения
    required String publisherId,
    // //id публикатора статьи
    required String publishedAt,
    String? createdAt,
    String? updatedAt,
  }) = _ArticleModel;

  factory ArticleModel.fromJson(Map<String, Object?> json) =>
      _$ArticleModelFromJson(json);
}
