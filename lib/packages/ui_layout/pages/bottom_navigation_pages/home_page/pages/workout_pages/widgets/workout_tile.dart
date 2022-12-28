import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/container_for_photo.dart';
import 'package:model/model.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/workout_pages/pages/workout_progress_page/workout_progress_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:business_layout/business_layout.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard(
      {Key? key, required this.indexExercises, required this.targetIdWorkout})
      : super(key: key);

  final int indexExercises;
  final String targetIdWorkout;

  @override
  Widget build(BuildContext context) {
    WorkoutObject? fitnessWorkoutObject = ImplementWorkoutControllerHomePage
        .instance
        .mapTargetIdAndWorkoutsWithId[targetIdWorkout]!
        .exercises[indexExercises]!;
    return TextButton(
      onPressed: () async {
        ImplementWorkoutControllerHomePage.instance.startTimer(
          timerSecondsValue: ImplementWorkoutControllerHomePage
                  .instance
                  .mapTargetIdAndWorkoutsWithId[targetIdWorkout]
                  ?.exercises[indexExercises]
                  ?.sets
                  .first
                  ?.restTime ??
              30,
          isStopTimer: true,
        );

        WorkoutProgressPage.openWorkoutProgressPage(
          context: context,
          indexExercises: indexExercises,
          targetIdWorkout: targetIdWorkout,
        );

        if (fitnessWorkoutObject.sets.isNotEmpty) {
          await ImplementWorkoutControllerHomePage.instance.getListWorkouts(
            newSetsExercise: fitnessWorkoutObject.sets,
          );
        }
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.zero,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SizedBox(
              height: Get.height / 10,
              child: ContainerForPhotoFuture(
                coverFileId: fitnessWorkoutObject.generic?.image,
                borderRadius: 15,
              ),
            ),
          ),
          SizedBox(
            width: myHorizontalPaddingForContainer,
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fitnessWorkoutObject.generic?.title ?? 'Упражнение',
                  style: myTextStyleFontUbuntu(context: context),
                ),
                mySizedHeightBetweenContainer,
                Text(
                  'Подходов: ${fitnessWorkoutObject.sets.length} ',
                  style: myTextStyleFontUbuntu(
                      textColor: Theme.of(context).textTheme.headline3!.color,
                      context: context),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "${fitnessWorkoutObject.fulfillment}%",
                  style: myTextStyleFontUbuntu(
                    textColor: fitnessWorkoutObject.fulfillment == 100
                        ? myColorIsActive
                        : Theme.of(context).textTheme.headline3!.color,
                    context: context,
                  ),
                ),
                myIconForward(context: context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
