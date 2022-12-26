import 'dart:async';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:business_layout/business_layout.dart';

class RowWithTimer extends StatelessWidget {
  const RowWithTimer({
    Key? key,
    required this.title,
    this.newColor,
    required this.timerSecondsValue,
  }) : super(key: key);
  final String title;
  final Color? newColor;
  final int timerSecondsValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: myTextStyleFontUbuntu(
                fontSize: 15,
                context: context,
              ),
            ),
            Obx(
              () => Text(
                '${Duration(seconds: ImplementWorkoutControllerHomePage.instance.timerData.value).inSeconds}',
                style: myTextStyleFontUbuntu(
                  fontSize: 14,
                  context: context,
                  newFontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 6,
        ),
        Obx(
          () => ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            child: LinearProgressIndicator(
              value:
                  (ImplementWorkoutControllerHomePage.instance.timerData.value /
                      timerSecondsValue),
              color: newColor ?? myColorIsActive,
              backgroundColor: (newColor ?? myColorIsActive).withOpacity(0.5),
              minHeight: 13,
            ),
          ),
        ),
      ],
    );
  }
}
