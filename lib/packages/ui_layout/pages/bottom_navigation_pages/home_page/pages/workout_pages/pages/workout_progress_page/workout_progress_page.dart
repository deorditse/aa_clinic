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
import 'widgets/row_with_timer.dart';
import 'widgets/text_field_comment.dart';

class WorkoutProgressPage extends StatelessWidget {
  static const String id = '/workoutProgressPage';

  const WorkoutProgressPage({
    Key? key,
    this.workoutObject,
  }) : super(key: key);

  final WorkoutObject? workoutObject;

  static openWorkoutProgressPage(
          {required context, required WorkoutObject workoutObject}) =>
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: const RouteSettings(name: WorkoutProgressPage.id),
        screen: WorkoutProgressPage(workoutObject: workoutObject),
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
          '$titleDate, ${workoutObject!.generic?.title?.toLowerCase() ?? 'Тренировка'}',
      widgetBody: _BodyWorkoutProgressPage(workoutObject: workoutObject!),
    );
  }
}

class _BodyWorkoutProgressPage extends StatelessWidget {
  const _BodyWorkoutProgressPage({Key? key, required this.workoutObject})
      : super(key: key);
  final WorkoutObject workoutObject;

  @override
  Widget build(BuildContext context) {
    FitnessGenericWorkoutExerciseObject? fitnessGenericWorkoutExerciseObject =
        workoutObject.generic;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _photoWorkout(
          coverId: workoutObject.generic?.image,
          context: context,
          description: fitnessGenericWorkoutExerciseObject?.description,
          title: fitnessGenericWorkoutExerciseObject?.title,
        ),
        mySizedHeightBetweenContainer,
        rowWithNameAndAboutIcon(
          fitnessGenericWorkoutExerciseObject: workoutObject.generic,
          context: context,
        ),
        mySizedHeightBetweenContainer,
        RowWithProgress(
          title: 'Прогресс упражнения',
          progress: workoutObject.fulfillment,
        ),
        mySizedHeightBetweenContainer,
        RowWithTimer(
          title: 'Таймер отдыха',
          newColor: Color.fromRGBO(14, 214, 166, 1),
          timerSecondsValue: 40,
          isStartTimer: true,
        ),
        mySizedHeightBetweenContainer,
        Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  primary: true,
                  padding: EdgeInsets.zero,
                  itemCount: workoutObject.sets.length,
                  itemBuilder: (context, index) {
                    final Map<String,
                            TargetObjectsDescriptionApproachObjectsConsisting>
                        _target = workoutObject.sets[index]!.target;
                    return Padding(
                      padding:
                          const EdgeInsets.only(right: myTopPaddingForContent),
                      child: _rowWithRecCount(
                        containerText:
                            _target.values.first.title!.capitalizeFirst!,
                        title:
                            'Рек: ${_target.values.first.value} ${_target.values.first.units}',
                        context: context,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: myTopPaddingForContent),
                child: SvgPicture.asset(
                  Get.isDarkMode
                      ? 'assets/icons/menu_icons_otherPage/add-circle.svg'
                      : 'assets/icons/for_light_theme/add-circle_light.svg',
                  semanticsLabel: 'addNewEvent',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
        TextFieldComment(),
        mySizedHeightBetweenContainer,
        Text(
          'История выполнения',
          style: myTextStyleFontUbuntu(
              context: context, newFontWeight: FontWeight.w500),
        ),
        SizedBox(height: myHorizontalPaddingForContainer),
        Text(
          "${DateFormat('d MMM y').format(HomePageCalendarControllerGetxState.instance.mySelectedDay)}",
          style: myTextStyleFontUbuntu(
              context: context, newFontWeight: FontWeight.w400),
        ),
        SizedBox(height: myHorizontalPaddingForContainer),
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
        child: Container(
          decoration: myStyleContainer(
              context: context, color: Theme.of(context).backgroundColor),
          clipBehavior: Clip.hardEdge,
          height: Get.height / 3.6,
          width: double.maxFinite,
          child: coverId != '' || coverId != null
              ? ContainerForPhotoFuture(coverFileId: coverId!)
              : FittedBox(child: Icon(Icons.sports_gymnastics_rounded)),
        ),
      ),
    );
  }

  _rowWithRecCount(
      {required String containerText,
      required String title,
      required BuildContext context}) {
    return Row(
      children: [
        IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                style: myTextStyleFontUbuntu(
                    textColor: Theme.of(context).textTheme.headline3!.color,
                    context: context),
              ),
              const SizedBox(
                height: 4,
              ),
              Container(
                decoration: myStyleContainer(
                    color: Theme.of(context).backgroundColor, context: context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: myHorizontalPaddingForContainer * 0.6),
                  child: Center(
                    child: Text(
                      containerText,
                      style: myTextStyleFontUbuntu(
                          textColor:
                              Theme.of(context).textTheme.headline3!.color,
                          context: context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
          fitnessGenericWorkoutExerciseObject?.title ?? '',
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
