import 'package:freezed_annotation/freezed_annotation.dart';

part 'achievements_model.freezed.dart';

part 'achievements_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class AchievementsModel with _$AchievementsModel {
  const factory AchievementsModel({
    @Default([]) List<Achievement> docs,
    required int totalDocs,
    required int limit,
    required int page,
    required int totalPages,
    bool? hasPrevPage,
    bool? hasNextPage,
    int? prevPage,
    int? nextPage,
  }) = _AchievementsModel;

  factory AchievementsModel.fromJson(Map<String, Object?> json) =>
      _$AchievementsModelFromJson(json);
}

@freezed
class Achievement with _$Achievement {
  const factory Achievement({
    required String id,
    String? title,
    String? description,
    String? image,
    String? createdAt,
    String? updatedAt,
    double? achievementPercents,
  }) = _Achievement;

  factory Achievement.fromJson(Map<String, Object?> json) =>
      _$AchievementFromJson(json);
}
