// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_fitness_workouts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FitnessWorkoutModel _$$_FitnessWorkoutModelFromJson(
        Map<String, dynamic> json) =>
    _$_FitnessWorkoutModel(
      id: json['id'] as String,
      creatorId: json['creatorId'] as String,
      userId: json['userId'] as String,
      startedAt: json['startedAt'] as String?,
      finishedAt: json['finishedAt'] as String?,
      description: json['description'] as String?,
      title: json['title'] as String?,
      exercises: (json['exercises'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : WorkoutObject.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      comment: json['comment'] as String?,
      fulfillment: json['fulfillment'] as int? ?? 0,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$_FitnessWorkoutModelToJson(
        _$_FitnessWorkoutModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creatorId': instance.creatorId,
      'userId': instance.userId,
      'startedAt': instance.startedAt,
      'finishedAt': instance.finishedAt,
      'description': instance.description,
      'title': instance.title,
      'exercises': instance.exercises,
      'comment': instance.comment,
      'fulfillment': instance.fulfillment,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$_WorkoutObject _$$_WorkoutObjectFromJson(Map<String, dynamic> json) =>
    _$_WorkoutObject(
      generic: json['generic'] == null
          ? null
          : FitnessGenericWorkoutExerciseObject.fromJson(
              json['generic'] as Map<String, dynamic>),
      sets: (json['sets'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : ApproachObjectsConsisting.fromJson(
                      e as Map<String, dynamic>))
              .toList() ??
          const [],
      fulfillment: json['fulfillment'] as int? ?? 0,
    );

Map<String, dynamic> _$$_WorkoutObjectToJson(_$_WorkoutObject instance) =>
    <String, dynamic>{
      'generic': instance.generic,
      'sets': instance.sets,
      'fulfillment': instance.fulfillment,
    };

_$_FitnessGenericWorkoutExerciseObject
    _$$_FitnessGenericWorkoutExerciseObjectFromJson(
            Map<String, dynamic> json) =>
        _$_FitnessGenericWorkoutExerciseObject(
          id: json['id'] as String,
          creatorId: json['creatorId'] as String,
          title: json['title'] as String?,
          image: json['image'] as String?,
          description: json['description'] as String?,
          tags: (json['tags'] as List<dynamic>?)
                  ?.map((e) => e as String?)
                  .toList() ??
              const [],
          instruction: (json['instruction'] as List<dynamic>?)
                  ?.map((e) => e as String?)
                  .toList() ??
              const [],
          attention: (json['attention'] as List<dynamic>?)
                  ?.map((e) => e as String?)
                  .toList() ??
              const [],
          type: json['type'] as String?,
          createdAt: json['createdAt'] as String?,
          updatedAt: json['updatedAt'] as String?,
        );

Map<String, dynamic> _$$_FitnessGenericWorkoutExerciseObjectToJson(
        _$_FitnessGenericWorkoutExerciseObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creatorId': instance.creatorId,
      'title': instance.title,
      'image': instance.image,
      'description': instance.description,
      'tags': instance.tags,
      'instruction': instance.instruction,
      'attention': instance.attention,
      'type': instance.type,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$_ApproachObjectsConsisting _$$_ApproachObjectsConsistingFromJson(
        Map<String, dynamic> json) =>
    _$_ApproachObjectsConsisting(
      target: (json['target'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            TargetObjectsDescriptionApproachObjectsConsisting.fromJson(
                e as Map<String, dynamic>)),
      ),
      real: (json['real'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            TargetObjectsDescriptionApproachObjectsConsisting.fromJson(
                e as Map<String, dynamic>)),
      ),
      startedAt: json['startedAt'] as String?,
      finishedAt: json['finishedAt'] as String?,
      comment: json['comment'] as String?,
      restTime: json['restTime'] as int?,
    );

Map<String, dynamic> _$$_ApproachObjectsConsistingToJson(
        _$_ApproachObjectsConsisting instance) =>
    <String, dynamic>{
      'target': instance.target,
      'real': instance.real,
      'startedAt': instance.startedAt,
      'finishedAt': instance.finishedAt,
      'comment': instance.comment,
      'restTime': instance.restTime,
    };

_$_TargetObjectsDescriptionApproachObjectsConsisting
    _$$_TargetObjectsDescriptionApproachObjectsConsistingFromJson(
            Map<String, dynamic> json) =>
        _$_TargetObjectsDescriptionApproachObjectsConsisting(
          title: json['title'] as String?,
          units: json['units'] as String?,
          fieldType: json['fieldType'] as String?,
          value: json['value'] as int?,
        );

Map<String, dynamic>
    _$$_TargetObjectsDescriptionApproachObjectsConsistingToJson(
            _$_TargetObjectsDescriptionApproachObjectsConsisting instance) =>
        <String, dynamic>{
          'title': instance.title,
          'units': instance.units,
          'fieldType': instance.fieldType,
          'value': instance.value,
        };
