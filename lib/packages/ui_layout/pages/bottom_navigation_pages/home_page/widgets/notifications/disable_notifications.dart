import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'bottom_sheet_time_of_notifications.dart';
import 'bottom_sheet_сategories_of_notifications.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  ///для уведомлений после календаря
  Box? boxNotifications;

  @override
  void initState() {
    super.initState();
    initisl();
  }

  Future<void> initisl() async {
    await Hive.initFlutter();
    boxNotifications = await Hive.openBox('Notifications');
  }

  bool changeDisableNotifications({bool? isDisableNotifications}) {
    if (boxNotifications != null) {
      if (isDisableNotifications != null) {
        boxNotifications!.put('isDisableNotifications', isDisableNotifications);

        return isDisableNotifications;
      }

      return boxNotifications!.get('isDisableNotifications') ?? false;
    } else {
      return false;
    }
  }

  FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageCalendarControllerGetxState>(
      builder: (controllerHome) {
        return Column(
          children: [
            TextButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero)),
              onPressed: () {
                BottomSheetTimeOfNotificationsHomePage
                    .showBottomSheetTimeOfNotificationsHomePage(
                  context: context,
                );
              },
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Таймер уведомлений',
                      style: myTextStyleFontUbuntu(context: context),
                    ),
                  ),
                  Text(
                    'За ${controllerHome.isRemindTimeNotifications} минут',
                    style: myTextStyleFontUbuntu(
                        textColor: Theme.of(context).textTheme.headline3!.color,
                        context: context),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Отключить уведомления',
                    style: myTextStyleFontUbuntu(context: context),
                  ),
                ),
                Switch(
                  value: controllerHome.isDisableNotifications,
                  onChanged: (val) {
                    controllerHome.changeDisableNotifications(
                        newIsDisableNotifications: val);
                  },
                  activeColor: myColorIsActive,
                ),
              ],
            ),
            TextButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero)),
              onPressed: () {
                BottomSheetCategoriesOfNotificationsProfilePage
                    .showBottomSheetCategoriesOfNotificationsProfilePage(
                  context: context,
                );
              },
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Категории уведомлений',
                      style: myTextStyleFontUbuntu(context: context),
                    ),
                  ),
                  myIconForward(context: context),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
