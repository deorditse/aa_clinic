import 'dart:convert';

import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/main_login_page.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/my_shimmer_effect_container.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/sliver_sceleton_pages/sliver_sceleton_without_borders.dart';
import 'package:business_layout/business_layout.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'package:data_layout/data_layout.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'widgets/row_with_progress.dart';
import 'widgets/workout_tile.dart';

class WorkoutPageFromHomePage extends StatelessWidget {
  static const String id = '/workoutPageFromHomePage';

  const WorkoutPageFromHomePage({Key? key, this.title, this.targetId})
      : super(key: key);
  final String? title;
  final String? targetId;

  static openWorkoutPageFromHomePage({
    required context,
    required String title,
    required String targetId,
  }) =>
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: RouteSettings(name: WorkoutPageFromHomePage.id),
        screen: WorkoutPageFromHomePage(title: title, targetId: targetId),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );

  @override
  Widget build(BuildContext context) {
    final titleDate = abbreviatedTitleDateAppBar(
        mySelectedDay:
            HomePageCalendarControllerGetxState.instance.mySelectedDay);
    return MySliverNewPageWithoutBorder(
      titleAppBar: '$titleDate, $title',
      widgetBody: _BodyWorkoutPageFromHomePage(
        targetId: targetId!,
      ),
    );
  }
}

class _BodyWorkoutPageFromHomePage extends StatelessWidget {
  const _BodyWorkoutPageFromHomePage({Key? key, required this.targetId})
      : super(key: key);
  final String targetId;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImplementWorkoutControllerHomePage>(
      builder: (controllerWorkout) {
        FitnessWorkoutModel? dataFitnessWorkout =
            controllerWorkout.mapTargetIdAndWorkoutsWithId[targetId];
        final bool isDataForPage = dataFitnessWorkout != null;

        return Column(
          children: [
            mySizedHeightBetweenContainer,
            RowWithProgress(
              title: 'Прогресс',
              progress: isDataForPage ? dataFitnessWorkout.fulfillment : 0,
            ),
            mySizedHeightBetweenContainer,
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              primary: false,
              itemCount:
                  isDataForPage ? dataFitnessWorkout.exercises.length : 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      top: myHorizontalPaddingForContainer),
                  child: isDataForPage
                      ? WorkoutCard(
                          indexExercises: index,
                          targetIdWorkout: targetId,
                        )
                      : myShimmerEffectContainer(
                          context: context,
                          newHeight: 70,
                        ),
                );
              },
            ),
            mySizedHeightBetweenContainer,
          ],
        );
      },
    );
  }

// _buttonRow({required BuildContext context}) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       ElevatedButton(
//         style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all(
//             Color.fromRGBO(224, 121, 114, 1),
//           ),
//         ),
//         onPressed: () {
//           Navigator.of(context).pop();
//         },
//         child: Text('ЗАВЕРШИТЬ'),
//       ),
//     ],
//   );
// }
}
