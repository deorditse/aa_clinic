import 'package:aa_clinic/packages/model/lib/model.dart';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

Column progressIndicator({required context}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(
          top: myTopPaddingForContent / 2,
          bottom: myHorizontalPaddingForContainer,
        ),
        child: Text(
          "Прогресс",
          style: myTextStyleFontUbuntu(
            context: context,
            newFontWeight: FontWeight.w500,
          ),
        ),
      ),
      Expanded(
        child: GetBuilder<HomePageCalendarControllerGetxState>(
          builder: (controllerHome) {
            return FittedBox(
              child: Padding(
                padding:
                    const EdgeInsets.only(bottom: myTopPaddingForContent / 2),
                child: CircularPercentIndicator(
                  radius: 36.0,
                  lineWidth: 9.0,
                  percent: controllerHome.progressValue,
                  center: Text(
                    "${(controllerHome.progressValue * 100).toInt()}%",
                    //количество выполнеенных за месяц задач на количество всех задач за месяц
                    style: myTextStyleFontUbuntu(
                      context: context,
                      newFontWeight: FontWeight.w500,
                    ),
                  ),
                  progressColor: myColorIsActive,
                  backgroundColor: myColorIsActive.withOpacity(0.5),
                  animation: true,
                  animationDuration: 900,
                  circularStrokeCap: CircularStrokeCap.butt,
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
