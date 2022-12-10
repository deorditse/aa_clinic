import 'package:intl/intl.dart';
import 'package:model/model.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RowWithTask extends StatelessWidget {
  RowWithTask({Key? key, required this.index, required this.dailySheet})
      : super(key: key);
  final int index;
  final DailyCalendarEventsModel? dailySheet;

  Rx<Color> colorIndicator =
      Get.textTheme.headline3!.color!.withOpacity(0.3).obs;

  void initColorIndicator() {
    if (dailySheet != null) {
      if (dailySheet!.isCanceled) {
        colorIndicator.value = Colors.redAccent;
      } else if (dailySheet!.isDone) {
        colorIndicator.value = myColorIsActive;
      } else {
        colorIndicator.value = Get.textTheme.headline3!.color!.withOpacity(0.3);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    initColorIndicator();
    final DateTime _time = DateTime.parse(dailySheet?.startedAt ?? '');
    return Container(
      height: Get.height / 23,
      child: Row(
        children: [
          Obx(
            () => Container(
              width: 4.73,
              height: double.infinity,
              color: colorIndicator.value,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: myHorizontalPaddingForContainer),
              child: Text(
                "${dailySheet?.title}",
                style: myTextStyleFontUbuntu(context: context),
              ),
            ),
          ),
          Text(
            DateFormat.Hm().format(_time),
            style: myTextStyleFontUbuntu(
                textColor: Theme.of(context).textTheme.headline3!.color,
                context: context),
          ),
        ],
      ),
    );
  }
}
