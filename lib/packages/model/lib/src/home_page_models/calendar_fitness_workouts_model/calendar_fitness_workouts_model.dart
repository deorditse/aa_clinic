import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_fitness_workouts_model.freezed.dart';

part 'calendar_fitness_workouts_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class FitnessWorkoutModel with _$FitnessWorkoutModel {
  const factory FitnessWorkoutModel({
    required String id,
    required String creatorId,
    required String userId,
    String? startedAt,
    String? finishedAt,
    String? description,
    String? title,
    @Default([]) List<WorkoutObject?> exercises,
    String? comment,
    @Default(0) int fulfillment,
    String? createdAt,
    String? updatedAt,
  }) = _FitnessWorkoutModel;

  factory FitnessWorkoutModel.fromJson(Map<String, Object?> json) =>
      _$FitnessWorkoutModelFromJson(json);
}

@freezed
class WorkoutObject with _$WorkoutObject {
  const factory WorkoutObject({
    FitnessGenericWorkoutExerciseObject? generic,
    @Default([]) List<ApproachObjectsConsisting?> sets,
    @Default(0) int fulfillment,
  }) = _WorkoutObject;

  factory WorkoutObject.fromJson(Map<String, Object?> json) =>
      _$WorkoutObjectFromJson(json);
}

@freezed
class FitnessGenericWorkoutExerciseObject
    with _$FitnessGenericWorkoutExerciseObject {
  const factory FitnessGenericWorkoutExerciseObject({
    required String id,
    required String creatorId,
    String? title,
    String? image,
    String? description,
    @Default([]) List<String?> tags,
    @Default([]) List<String?> instruction,
    @Default([]) List<String?> attention,
    String? type,
    String? createdAt,
    String? updatedAt,
  }) = _FitnessGenericWorkoutExerciseObject;

  factory FitnessGenericWorkoutExerciseObject.fromJson(
          Map<String, Object?> json) =>
      _$FitnessGenericWorkoutExerciseObjectFromJson(json);
}

@freezed
class ApproachObjectsConsisting with _$ApproachObjectsConsisting {
  const factory ApproachObjectsConsisting({
    ///первое поле динамически меняется
    required Map<String, TargetObjectsDescriptionApproachObjectsConsisting>
        target,

    ///первое поле динамически меняется
    required Map<String, TargetObjectsDescriptionApproachObjectsConsisting>
        real,
    String? startedAt,
    String? finishedAt,
    String? comment,
    int? restTime,
  }) = _ApproachObjectsConsisting;

  factory ApproachObjectsConsisting.fromJson(Map<String, Object?> json) =>
      _$ApproachObjectsConsistingFromJson(json);
}

@freezed
class TargetObjectsDescriptionApproachObjectsConsisting
    with _$TargetObjectsDescriptionApproachObjectsConsisting {
  const factory TargetObjectsDescriptionApproachObjectsConsisting({
    String? title,
    String? units,
    String? fieldType,
    int? value,
  }) = _TargetObjectsDescriptionApproachObjectsConsisting;

  factory TargetObjectsDescriptionApproachObjectsConsisting.fromJson(
          Map<String, Object?> json) =>
      _$TargetObjectsDescriptionApproachObjectsConsistingFromJson(json);
}
