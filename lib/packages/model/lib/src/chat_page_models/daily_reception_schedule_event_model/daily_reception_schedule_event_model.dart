import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_reception_schedule_event_model.freezed.dart';

part 'daily_reception_schedule_event_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class DailyReceptionScheduleEventModel with _$DailyReceptionScheduleEventModel {
  const factory DailyReceptionScheduleEventModel({
    //Окна на этот день. PatientId и appointmentId могуть быть null (если никто не makeAnAppointment на это окно).

    required String id,
    String? userId,
    String? startedAt,
    String? finishedAt,
    String? patientId,
    String? appointmentId,
  }) = _DailyReceptionScheduleEventModel;

  factory DailyReceptionScheduleEventModel.fromJson(
          Map<String, Object?> json) =>
      _$DailyReceptionScheduleEventModelFromJson(json);
}
