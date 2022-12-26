import 'dart:async';
import 'package:business_layout/business_layout.dart';
import 'package:model/model.dart';
import 'package:data_layout/data_layout.dart';
import 'package:get/get.dart';

class ImplementWorkoutControllerHomePage extends GetxController {
  static ImplementWorkoutControllerHomePage instance =
      Get.find<ImplementWorkoutControllerHomePage>();

  ///СТРАНИЦА FITNESS WORKOUT для получения данных на странице задачи на день +
  //  чтобы сохранять в текущей сессии и не тянyть из базы если есть в мапе Map<String, FitnessWorkoutModel> == targetId :  FitnessWorkoutModel

  Map<String, FitnessWorkoutModel?> mapTargetIdAndWorkoutsWithId = {};
  final HomePageData _services = HomePageData();

  Future<FitnessWorkoutModel?> getFitnessWorkoutsWithId(
      {required String targetId, bool isUpdate = false}) async {
    if (mapTargetIdAndWorkoutsWithId[targetId] == null || isUpdate) {
      final result = await _services.getFitnessWorkoutsWithIdData(
        accessToken:
            ImplementAuthController.instance.userAuthorizedData!.accessToken,
        targetId: targetId,
      );
      mapTargetIdAndWorkoutsWithId[targetId] = result;
      update();
      return result;
    } else {
      return mapTargetIdAndWorkoutsWithId[targetId];
    }
  }

  ///для тренировок
  //список непройденных тренировок
  List<ApproachObjectsConsisting?> listOfMissedWorkouts = [];

  //список пройденных тренировок
  List<ApproachObjectsConsisting?> listOfCompletedWorkouts = [];

  Future<void> getListWorkouts(
      {required List<ApproachObjectsConsisting?> newSetsExercise}) async {
    listOfMissedWorkouts = [];
    listOfCompletedWorkouts = [];
    update();
    newSetsExercise.forEach(
      (ApproachObjectsConsisting? setExercise) {
        if (setExercise?.real.values.first.value != null) {
          //список пройденных тренировок
          listOfCompletedWorkouts.add(setExercise!);
          update();
        } else {
          //список непройденных тренировок
          listOfMissedWorkouts.add(setExercise!);
          update();
          timerData.value = setExercise.restTime ?? 42;
        }
      },
    );
  }

  final Rx<int> timerData = 30.obs;

  startTimer({required int timerSecondsValue, bool isStopTimer = false}) {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (isStopTimer) {
          timer.cancel();
          timerData.value = timerSecondsValue;
          return;
        } else {
          timerData.value -= 1;
          if (timerData.value <= 0) {
            timer.cancel();
            timerData.value = timerSecondsValue;
          }
        }
      },
    );
  }

  ///изменение данных тренировки
  Future<void> changeMapTargetIdAndWorkoutsWithId({
    required String targetIdWorkout,
    required int indexExercises,
    required List<String> listValueWorkout,
    required String? comment,
  }) async {
    if (mapTargetIdAndWorkoutsWithId[targetIdWorkout] == null) {
      print("mapTargetIdAndWorkoutsWithId[targetIdForChange]  == null");
      return;
    }

    FitnessWorkoutModel _fitnessWorkout =
        mapTargetIdAndWorkoutsWithId[targetIdWorkout]!;
    //беру первый обект с невыполннеными заданиями
    ApproachObjectsConsisting approachObjectsConsisting =
        listOfMissedWorkouts.first!;
    startTimer(
      timerSecondsValue: approachObjectsConsisting.restTime ?? 30,
      isStopTimer: true,
    );
    //Увеличить fitnessWorkout.fulfillment на (1/...exercises.$.sets.COUNT/fitnessWorkout.exercises.COUNT*100).

    _fitnessWorkout.fulfillment += ((1 /
                (_fitnessWorkout.exercises[indexExercises]!.sets.length *
                    _fitnessWorkout.exercises.length)) *
            100)
        .toInt();

    //увеличить локальный fitnessWorkout.exercises.$.fulfillment на (1/...exercises.$.sets.COUNT*100)
    _fitnessWorkout.exercises[indexExercises]!.fulfillment +=
        ((1 / _fitnessWorkout.exercises[indexExercises]!.sets.length) * 100)
            .toInt();

    approachObjectsConsisting.finishedAt = DateTime.now().toIso8601String();
    approachObjectsConsisting.startedAt = _fitnessWorkout.startedAt;

    approachObjectsConsisting.real.forEach((key, value) {
      int index = approachObjectsConsisting.real.values.toList().indexOf(value);
      approachObjectsConsisting.real[key]!.value =
          int.parse(listValueWorkout[index]);
    });

    if (comment != null && comment != "") {
      approachObjectsConsisting.comment = comment;
    }

    mapTargetIdAndWorkoutsWithId[targetIdWorkout] = _fitnessWorkout;
    mapTargetIdAndWorkoutsWithId[targetIdWorkout]!
        .exercises[indexExercises]!
        .sets
        .first = approachObjectsConsisting;
    update();
    listOfMissedWorkouts.removeAt(0);
    listOfCompletedWorkouts.add(approachObjectsConsisting);
    update();
    startTimer(timerSecondsValue: approachObjectsConsisting.restTime ?? 40);
    print(mapTargetIdAndWorkoutsWithId[targetIdWorkout]!.exercises);

    await _services
        .putFitnessWorkoutWithIdData(
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
      fitnessWorkout: mapTargetIdAndWorkoutsWithId[targetIdWorkout]!,
    )
        .whenComplete(
      () async {
        await HomePageCalendarControllerGetxState.instance
            .getDailyCalendarEvents(
          dateDaily: HomePageCalendarControllerGetxState.instance.mySelectedDay,
          isUpdate: true,
        );
      },
    );
  }
}
