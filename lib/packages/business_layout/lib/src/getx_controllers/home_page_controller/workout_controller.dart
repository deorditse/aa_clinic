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

  void startTimer({required int timerSecondsValue, bool isStopTimer = false}) {
    Timer? timer;
    timer?.cancel();
    if (!isStopTimer) {
      timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          timerData.value -= 1;
          if (timerData.value <= 0) {
            timer.cancel();
            timerData.value = timerSecondsValue;
          }
        },
      );
    }

    if (isStopTimer) {
      timer?.cancel();
      timerData.value = timerSecondsValue;
      return;
    }
  }

  ///изменение данных тренировки
  Future<void> changeMapTargetIdAndWorkoutsWithId({
    required String targetIdWorkout,
    required int indexExercises,
    required List<String> listValueWorkout,
    required String? comment,
  }) async {
    if (mapTargetIdAndWorkoutsWithId[targetIdWorkout] == null) {
      print("mapTargetIdAndWorkoutsWithId[targetIdForChange] == null");
      return;
    }

    FitnessWorkoutModel _fitnessWorkout =
        mapTargetIdAndWorkoutsWithId[targetIdWorkout]!;
    //беру первый обект с невыполннеными заданиями
    ApproachObjectsConsisting _approachObjectsConsisting =
        listOfMissedWorkouts.first!;

    startTimer(timerSecondsValue: _approachObjectsConsisting.restTime ?? 30);

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

    _approachObjectsConsisting.finishedAt =
        DateTime.now().toUtc().toIso8601String();
    _approachObjectsConsisting.startedAt = _fitnessWorkout.startedAt;
    _approachObjectsConsisting.real.forEach((key, value) {
      int index =
          _approachObjectsConsisting.real.values.toList().indexOf(value);
      _approachObjectsConsisting.real[key]!.value =
          int.parse(listValueWorkout[index]);
    });

    if (comment != null && comment != "") {
      _approachObjectsConsisting.comment = comment;
    }

    mapTargetIdAndWorkoutsWithId[targetIdWorkout] = _fitnessWorkout;
    mapTargetIdAndWorkoutsWithId[targetIdWorkout]!
        .exercises[indexExercises]!
        .sets
        .first = _approachObjectsConsisting;
    update();
    listOfMissedWorkouts.removeAt(0);
    listOfCompletedWorkouts.add(_approachObjectsConsisting);
    update();

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
