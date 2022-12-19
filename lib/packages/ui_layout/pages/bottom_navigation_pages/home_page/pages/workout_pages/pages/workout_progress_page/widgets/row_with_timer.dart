import 'dart:async';

import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RowWithTimer extends StatelessWidget {
  const RowWithTimer({
    Key? key,
    required this.title,
    this.newColor,
    this.timerSecondsValue,
    this.isStartTimer = false,
  }) : super(key: key);
  final String title;
  final Color? newColor;
  final int? timerSecondsValue;
  final bool isStartTimer;

  @override
  Widget build(BuildContext context) {
    final Rx<int> _timerData = (timerSecondsValue ?? 40).obs;
    _timerPeriodicForCode() {
      Timer.periodic(const Duration(seconds: 1), (timer) {
        _timerData.value -= 1;
        if (_timerData.value <= 0) {
          timer.cancel();
          _timerData.value = timerSecondsValue ?? 40;
        }
      });
    }

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (isStartTimer) {
              _timerPeriodicForCode();
            }
          },
          child: Row(
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
                  '${Duration(seconds: _timerData.value).inSeconds}',
                  style: myTextStyleFontUbuntu(
                    fontSize: 14,
                    context: context,
                    newFontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 6,
        ),
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: LinearProgressIndicator(
            value: (((timerSecondsValue ?? 0) / 100).toDouble()),
            color: newColor ?? myColorIsActive,
            backgroundColor: (newColor ?? myColorIsActive).withOpacity(0.5),
            minHeight: 13,
          ),
        ),
      ],
    );
  }
}
