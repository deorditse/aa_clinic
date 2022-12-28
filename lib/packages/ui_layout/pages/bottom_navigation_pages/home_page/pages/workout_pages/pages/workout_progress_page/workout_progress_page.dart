import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/workout_pages/pages/about_workout_progress_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/workout_pages/widgets/row_with_progress.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/container_for_photo.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/sliver_sceleton_pages/sliver_sceleton_without_borders.dart';
import 'package:business_layout/business_layout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'widgets/list_with_history.dart';

import 'widgets/worksheet_with_workouts.dart';

class WorkoutProgressPage extends StatelessWidget {
  static const String id = '/workoutProgressPage';

  const WorkoutProgressPage({
    Key? key,
    this.indexExercises,
    this.targetIdWorkout,
  }) : super(key: key);

  final int? indexExercises;
  final String? targetIdWorkout;

  static openWorkoutProgressPage({
    required context,
    required int indexExercises,
    required String targetIdWorkout,
  }) =>
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: const RouteSettings(name: WorkoutProgressPage.id),
        screen: WorkoutProgressPage(
          indexExercises: indexExercises,
          targetIdWorkout: targetIdWorkout,
        ),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );

  @override
  Widget build(BuildContext context) {
    final titleDate = abbreviatedTitleDateAppBar(
        mySelectedDay:
            HomePageCalendarControllerGetxState.instance.mySelectedDay,
        isShort: true);

    return MySliverNewPageWithoutBorder(
      titleAppBar:
          '$titleDate, ${ImplementWorkoutControllerHomePage.instance.mapTargetIdAndWorkoutsWithId[targetIdWorkout]!.exercises[indexExercises!]!.generic?.title?.toLowerCase() ?? 'Тренировка'}',
      widgetBody: _BodyWorkoutProgressPage(
        indexExercises: indexExercises!,
        targetIdWorkout: targetIdWorkout!,
      ),
    );
  }
}

class _BodyWorkoutProgressPage extends StatelessWidget {
  const _BodyWorkoutProgressPage({
    Key? key,
    required this.indexExercises,
    required this.targetIdWorkout,
  }) : super(key: key);
  final int indexExercises;
  final String targetIdWorkout;

  @override
  Widget build(BuildContext context) {
    FitnessGenericWorkoutExerciseObject? fitnessGenericWorkoutExerciseObject =
        ImplementWorkoutControllerHomePage
            .instance
            .mapTargetIdAndWorkoutsWithId[targetIdWorkout]!
            .exercises[indexExercises]!
            .generic;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _photoWorkout(
          coverId: fitnessGenericWorkoutExerciseObject?.image,
          context: context,
          description: fitnessGenericWorkoutExerciseObject?.description,
          title: fitnessGenericWorkoutExerciseObject?.title,
        ),
        mySizedHeightBetweenContainer,
        rowWithNameAndAboutIcon(
          fitnessGenericWorkoutExerciseObject:
              fitnessGenericWorkoutExerciseObject,
          context: context,
        ),
        mySizedHeightBetweenContainer,

        ///этот лист динамически меняется при выполнении
        WorksheetWithWorkouts(
          indexExercises: indexExercises,
          targetIdWorkout: targetIdWorkout,
        ),
        mySizedHeightBetweenContainer,
        mySizedHeightBetweenContainer,
        Text(
          'История выполнения',
          style: myTextStyleFontUbuntu(
            context: context,
            newFontWeight: FontWeight.w500,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              bottom: myTopPaddingForContent / 2,
              top: myTopPaddingForContent / 2),
          child: Text(
            "${DateFormat('d MMM y').format(HomePageCalendarControllerGetxState.instance.mySelectedDay)}",
            style: myTextStyleFontUbuntu(
                context: context, newFontWeight: FontWeight.w400),
          ),
        ),
        ListWithHistory(),
      ],
    );
  }

  _photoWorkout({
    required String? coverId,
    required BuildContext context,
    required String? description,
    required String? title,
  }) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.zero,
        ),
      ),
      onPressed: () {
        AboutWorkoutProgressPage.openAboutWorkoutProgressPage(
          context: context,
          nameWorkout: title,
          coverId: coverId,
          description: description,
        );
      },
      child: Center(
        child: ContainerForPhotoFuture(
          coverFileId: coverId,
          borderRadius: 15,
        ),
      ),
    );
  }

  rowWithNameAndAboutIcon({
    required FitnessGenericWorkoutExerciseObject?
        fitnessGenericWorkoutExerciseObject,
    required BuildContext context,
  }) {
    return Row(
      children: [
        Text(
          fitnessGenericWorkoutExerciseObject?.title ?? 'Тренирповка',
          style: myTextStyleFontUbuntu(
            context: context,
            newFontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          width: myHorizontalPaddingForContainer,
        ),
        GestureDetector(
          onTap: () {
            AboutWorkoutProgressPage.openAboutWorkoutProgressPage(
              context: context,
              nameWorkout: fitnessGenericWorkoutExerciseObject?.title,
              description: fitnessGenericWorkoutExerciseObject?.description,
              coverId: fitnessGenericWorkoutExerciseObject?.image,
            );
          },
          child: SvgPicture.asset(
            Get.isDarkMode
                ? 'assets/icons/about.svg'
                : 'assets/icons/for_light_theme/about_light.svg',
            semanticsLabel: 'about',
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
