import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_actions_model.freezed.dart';

part 'calendar_actions_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class CalendarActionsWithIdModel with _$CalendarActionsWithIdModel {
  const factory CalendarActionsWithIdModel({
    required String id,
    required String userId,
    required String creatorId,
    required String title,
    required String type,
    //
    // ///ToDo: what type data???
    @Default({}) Map data,
    String? startedAt,
    String? finishedAt,
    String? description,
    @Default(false) bool isCanceled,
    //Причина отмены
    String? cancelReason,
    String? canceledAt,
    @Default(false) bool isDone,
    String? createdAt,
    String? updatedAt,
  }) = _CalendarActionsWithIdModel;

  factory CalendarActionsWithIdModel.fromJson(Map<String, Object?> json) =>
      _$CalendarActionsWithIdModelFromJson(json);
}
