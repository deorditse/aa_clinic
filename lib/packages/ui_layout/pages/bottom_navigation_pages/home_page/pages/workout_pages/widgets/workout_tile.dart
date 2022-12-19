import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/container_for_photo.dart';
import 'package:model/model.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/workout_pages/pages/workout_progress_page/workout_progress_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({Key? key, required this.workoutObject}) : super(key: key);

  final WorkoutObject workoutObject;

  @override
  Widget build(BuildContext context) {
    FitnessGenericWorkoutExerciseObject? fitnessGenericWorkoutExerciseObject =
        workoutObject.generic;
    return TextButton(
      onPressed: () {
        WorkoutProgressPage.openWorkoutProgressPage(
          context: context,
          workoutObject: workoutObject,
        );
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
                coverFileId: fitnessGenericWorkoutExerciseObject?.image,
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
                  fitnessGenericWorkoutExerciseObject?.title ?? 'Упражнение',
                  style: myTextStyleFontUbuntu(context: context),
                ),
                mySizedHeightBetweenContainer,
                Text(
                  'Подходов: ${workoutObject.sets.length} ',
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
                  "${workoutObject.fulfillment}%",
                  style: myTextStyleFontUbuntu(
                    textColor: workoutObject.fulfillment == 100
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
