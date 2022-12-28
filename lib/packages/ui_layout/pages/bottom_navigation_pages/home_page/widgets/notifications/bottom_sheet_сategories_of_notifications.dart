import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/sceleton_show_bottomSheet.dart';
import 'package:get/get.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:business_layout/business_layout.dart';

class BottomSheetCategoriesOfNotificationsProfilePage extends StatelessWidget {
  static const String id = '/bottomSheetCategoriesOfNotificationsProfilePage';

  const BottomSheetCategoriesOfNotificationsProfilePage({Key? key})
      : super(key: key);

  static showBottomSheetCategoriesOfNotificationsProfilePage(
          {required context}) =>
      showBottomSheetContainer(
        backLine: true,
        context: context,
        titleAppBar: '',
        deleteAppBar: true,
        widgetBody: BottomSheetCategoriesOfNotificationsProfilePage(),
      );

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageCalendarControllerGetxState>(
      builder: (controllerHome) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            myBackLineInAppBar(context: context),
            Text(
              'Категории уведомлений',
              style: myTextStyleFontUbuntu(
                  fontSize: 17,
                  context: context,
                  newFontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Тренировки',
                    style: myTextStyleFontUbuntu(
                        newFontWeight: FontWeight.w300, context: context),
                  ),
                ),
                Switch(
                  value: controllerHome.isWorkoutNotifications,
                  onChanged: (val) {
                    controllerHome.changeWorkoutNotifications(
                        newIsWorkoutNotifications: val);
                  },
                  activeColor: myColorIsActive,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Консультации',
                    style: myTextStyleFontUbuntu(
                        newFontWeight: FontWeight.w300, context: context),
                  ),
                ),
                Switch(
                  value: controllerHome.isConsultationsNotifications,
                  onChanged: (val) {
                    controllerHome.changeConsultationsNotifications(
                        newIsConsultationsNotifications: val);
                  },
                  activeColor: myColorIsActive,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Пища',
                    style: myTextStyleFontUbuntu(
                        newFontWeight: FontWeight.w300, context: context),
                  ),
                ),
                Switch(
                  value: controllerHome.isFoodNotifications,
                  onChanged: (val) {
                    controllerHome.changeFoodNotifications(
                        newIsFoodNotifications: val);
                  },
                  activeColor: myColorIsActive,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Простые действия',
                    style: myTextStyleFontUbuntu(
                        newFontWeight: FontWeight.w300, context: context),
                  ),
                ),
                Switch(
                  value: controllerHome.isDeliveryNotifications,
                  onChanged: (val) {
                    controllerHome.changeDeliveryNotifications(
                        newIsDeliveryNotifications: val);
                  },
                  activeColor: myColorIsActive,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
