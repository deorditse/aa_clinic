import 'dart:math';
import 'package:business_layout/src/getx_controllers/home_page_controller/home_page_controller.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:intl/intl.dart';
import 'package:model/model.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart';

class RowWithTask extends StatelessWidget {
  RowWithTask({Key? key, required this.index, required this.dailySheet})
      : super(key: key);
  final int index;
  final DailyCalendarEventsModel? dailySheet;
  Rx<Color> colorIndicator =
      Get.textTheme.headline3!.color!.withOpacity(0.3).obs;

  void initColorIndicator() async {
    // _newConfigureLocalTimeZone();
    if (dailySheet != null) {
      if (dailySheet!.isCanceled) {
        colorIndicator.value = Colors.redAccent;
      } else if (dailySheet!.isDone ||
          DateTime.parse(dailySheet!.startedAt!)
              .isBefore(DateTime.now().toUtc())) {
        colorIndicator.value = Get.textTheme.headline3!.color!.withOpacity(0.3);
        print(DateTime.parse(dailySheet!.startedAt!));
        print(HomePageCalendarControllerGetxState.instance.convertTime(
            hour: DateTime.now().hour, minutes: DateTime.now().minute));
      } else {
        colorIndicator.value = myColorIsActive;

        ///Инициализация уведомлений происходит только в том случае, если индикатор даты является активным, т.е еще не началось/закончилось
        final DateTime _notifTime = DateTime.parse(dailySheet?.startedAt ?? '');
        var myTime = DateFormat.Hm().format(_notifTime);
        //Выбрал данный вариант проблемы решения с дубликатами, при каждой новой инициализации времени(смена таймера уведомлений или
        //при многократном повторе выбора даты с тасками) прошлые уведомления удаляются из памяти и перезаписываются с новыми значениями.
        FlutterLocalNotificationsPlugin().cancelAll();
        //Инициализирую метод для отправки уведомления из контроллера
        await HomePageCalendarControllerGetxState.instance.scheduleNotification(
          hour: int.parse(myTime.toString().split(':')[0]),
          minutes: int.parse(myTime.toString().split(':')[1]),
        );
        print("from initColorIndicator ${myTime}");
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
