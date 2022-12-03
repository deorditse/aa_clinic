import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_appointments_model.freezed.dart';

part 'calendar_appointments_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class AppointmentsModel with _$AppointmentsModel {
  const factory AppointmentsModel({
    required String id,
    required String patientId,
    required String specialistId,
    SpecialistModel? specialist,
    String? healthComplaint,
    String? videoFileId,
    String? videoFileLink,
    String? startedAt,
    String? finishedAt,
    required int status,
    //id кем был отменен прием
    String? cancelBy,
    //причина отмены
    String? cancelReason,
    // оценка приема от специалиста
    RateBy? rateBySpecialist,
    //оценка приема от пациента
    RateBy? rateByPatient,
    String? conclusion,
    @Default([]) List<String?> recommendations,
    String? createdAt,
    String? updatedAt,
  }) = _AppointmentsModel;

  factory AppointmentsModel.fromJson(Map<String, Object?> json) =>
      _$AppointmentsModelFromJson(json);
}

@freezed
class SpecialistModel with _$SpecialistModel {
  const factory SpecialistModel({
    String? firstName,
    String? lastName,
    String? middleName,
    String? bdate,
    String? avatar,
  }) = _SpecialistModel;

  factory SpecialistModel.fromJson(Map<String, Object?> json) =>
      _$SpecialistModelFromJson(json);
}

@freezed
class RateBy with _$RateBy {
  const factory RateBy({
    int? value,
    //массив с позивными отзывами
    @Default([]) List<String?> positive,
    @Default([]) List<String?> negative,
  }) = _RateBy;

  factory RateBy.fromJson(Map<String, Object?> json) => _$RateByFromJson(json);
}
