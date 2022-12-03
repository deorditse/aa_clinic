import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_calendar_events_model.freezed.dart';

part 'daily_calendar_events_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class DailyCalendarEventsModel with _$DailyCalendarEventsModel {
  const factory DailyCalendarEventsModel({
    required String title,
    required String targetId,
    String? type,
    String? actionType,
    String? startedAt,
    String? finishedAt,
    @Default(false) bool isCanceled,
    @Default(false) bool isDone,
    @Default(0) int fulfillment,
  }) = _DailyCalendarEventsModel;

  factory DailyCalendarEventsModel.fromJson(Map<String, Object?> json) =>
      _$DailyCalendarEventsModelFromJson(json);
}
