import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_categories_model.freezed.dart';

part 'article_categories_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class ArticleCategoriesModel with _$ArticleCategoriesModel {
  const factory ArticleCategoriesModel({
    @Default([]) List<ArticleCategory> docs,
    required int totalDocs,
    int? limit,
    required int page,
    int? totalPages,
    required bool hasPrevPage,
    required bool hasNextPage,
    int? prevPage,
    int? nextPage,
  }) = _ArticleCategoriesModel;

  factory ArticleCategoriesModel.fromJson(Map<String, Object?> json) =>
      _$ArticleCategoriesModelFromJson(json);
}

@freezed
class ArticleCategory with _$ArticleCategory {
  const factory ArticleCategory({
    required String id,
    required String title,
    String? createdAt,
    String? updatedAt,
  }) = _ArticleCategory;

  factory ArticleCategory.fromJson(Map<String, Object?> json) =>
      _$ArticleCategoryFromJson(json);
}
