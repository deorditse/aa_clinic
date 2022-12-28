import 'dart:developer';
import 'package:aa_clinic/packages/data_layout/lib/data_layout.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/workout_pages/pages/about_workout_progress_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/workout_pages/widgets/row_with_progress.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/container_for_photo.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/sliver_sceleton_pages/sliver_sceleton_without_borders.dart';
import 'package:business_layout/business_layout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:http/http.dart' as http;
import 'card_with_workout_data.dart';
import 'row_with_timer.dart';

class WorksheetWithWorkouts extends StatelessWidget {
  WorksheetWithWorkouts({
    Key? key,
    required this.indexExercises,
    required this.targetIdWorkout,
  }) : super(key: key);
  final int indexExercises;
  final String targetIdWorkout;

  // @override
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImplementWorkoutControllerHomePage>(
      builder: (controllerWorkout) {
        FitnessWorkoutModel fitnessWorkout =
            controllerWorkout.mapTargetIdAndWorkoutsWithId[targetIdWorkout]!;
        //лист для проверки заполенности всех значений

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            RowWithProgress(
              title: 'Прогресс упражнения',
              progress:
                  fitnessWorkout.exercises[indexExercises]?.fulfillment ?? 0,
            ),
            CardWithWorkoutData(
              indexExercises: indexExercises,
              targetIdWorkout: targetIdWorkout,
            ),
          ],
        );
      },
    );
  }
}
