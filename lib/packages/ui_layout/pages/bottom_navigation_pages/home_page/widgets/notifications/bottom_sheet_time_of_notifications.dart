import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/sceleton_show_bottomSheet.dart';
import 'package:get/get.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:business_layout/business_layout.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BottomSheetTimeOfNotificationsHomePage extends StatelessWidget {
  const BottomSheetTimeOfNotificationsHomePage({Key? key}) : super(key: key);

  static showBottomSheetTimeOfNotificationsHomePage({required context}) =>
      showBottomSheetContainer(
        context: context,
        titleAppBar: '',
        deleteAppBar: true,
        backLine: true,
        widgetBody: BottomSheetTimeOfNotificationsHomePage(),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        myBackLineInAppBar(context: context),
        Text(
          'Таймер уведомлений',
          style: myTextStyleFontUbuntu(
              fontSize: 17, context: context, newFontWeight: FontWeight.w500),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _rowTimeNotifications(time: 5, context: context),
            _rowTimeNotifications(time: 10, context: context),
            _rowTimeNotifications(time: 15, context: context),
            _rowTimeNotifications(time: 30, context: context),
          ],
        ),
      ],
    );
  }

  _rowTimeNotifications({required int time, required BuildContext context}) {
    return Card(
      child: TextButton(
        onPressed: () {
          HomePageCalendarControllerGetxState.instance
              .changeRemindTimeNotifications(
            newIsRemindTimeNotification: time,
          );
          Navigator.of(context).pop();
        },
        child: Text(
          '$time минут',
          style: myTextStyleFontUbuntu(
            newFontWeight: FontWeight.w300,
            context: context,
          ),
        ),
      ),
    );
  }
}
