import 'dart:convert';
import 'dart:io';

import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/sliver_sceleton_pages/sliver_sceleton_without_borders.dart';
import 'package:model/model.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/widgets/health_assessment.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/widgets/progress.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/my_shimmer_effect_container.dart';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/calendar_home_page/calendar.dart';
import 'widgets/task_for_the_day/task_for_the_day.dart';

class HomePage extends StatelessWidget {
  static const String id = '/homePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MySliverNewPageWithoutBorder(
      deleteAppBar: true,
      titleAppBar: 'Главная',
      // onlyBack: false,
      widgetBody: _MainBodyHomePage(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      imageBackgroundName: '',
    );
  }
}

class _MainBodyHomePage extends StatelessWidget {
  const _MainBodyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.put(HomePageCalendarControllerGetxState());
    return GetBuilder<HomePageCalendarControllerGetxState>(
        builder: (controllerCalendar) {
      ///При изменении даты в календаре, инициализируется отправка данных здоровья

      bool? isDataActions =
          ImplementAuthController.instance.userAuthorizedData?.accessToken !=
              null;

      ///ToDo controllerCalendar.marksCountForMonth != null;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Platform.isAndroid) mySizedHeightBetweenContainer,
          SizedBox(
            height: Get.size.height / 7, // 120,
            child: Row(
              children: [
                Expanded(
                  child: isDataActions
                      ? Container(
                          decoration: myStyleContainer(context: context),
                          child: progressIndicator(context: context),
                        )
                      : myShimmerEffectContainer(context: context),
                ),
                SizedBox(
                  width: mySizedHeightBetweenContainer.height,
                ),
                Expanded(
                  flex: 2,
                  child: isDataActions
                      ? Container(
                          decoration: myStyleContainer(context: context),
                          child: const HealthAssessment(),
                        )
                      : myShimmerEffectContainer(context: context),
                ),
              ],
            ),
          ),
          mySizedHeightBetweenContainer,
          isDataActions
              ? Container(
                  decoration: myStyleContainer(context: context),
                  child: CalendarHomePage(),
                )
              : myShimmerEffectContainer(
                  context: context,
                  newHeight: Get.height / 3,
                ),
          mySizedHeightBetweenContainer,
          isDataActions
              ? TaskForTheDay()
              : myShimmerEffectContainer(
                  context: context,
                  newHeight: Get.height / 3,
                ),
          mySizedHeightBetweenContainer,
        ],
      );
    });
  }
}
