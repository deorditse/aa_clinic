import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/app_bars/material_app_bar.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/button_alert_message.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/my_shimmer_effect_container.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/container_for_photo.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/material_sceleton_without_borders.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/sliver_sceleton_pages/sliver_sceleton_without_borders.dart';
import 'package:business_layout/business_layout.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';

import 'widgets/buttons_row_events.dart';

class DefaultTaskForDayPage extends StatelessWidget {
  static const String id = '/addNewEventHomePage';

  const DefaultTaskForDayPage({Key? key, this.title, this.targetId})
      : super(key: key);
  final String? title;
  final String? targetId;

  static openDefaultTaskForDayPage({
    required context,
    required String title,
    required String targetId,
  }) =>
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: RouteSettings(name: DefaultTaskForDayPage.id),
        screen: DefaultTaskForDayPage(title: title, targetId: targetId),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );

  @override
  Widget build(BuildContext context) {
    return MyMaterialNewPageWithoutBorder(
      titleAppBar: '${title ?? "Действие"}',
      widgetBody: _BodyAddNewEventHomePage(
        targetId: targetId!,
        title: title,
      ),
    );
  }
}

class _BodyAddNewEventHomePage extends StatelessWidget {
  const _BodyAddNewEventHomePage(
      {Key? key, required this.targetId, required this.title})
      : super(key: key);
  final String targetId;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageCalendarControllerGetxState>(
      builder: (controllerHome) {
        CalendarActionsWithIdModel? dataCalendarActions =
            controllerHome.mapTargetIdAndCalendarActionsWithId[targetId];
        final bool isDataForPage = dataCalendarActions != null;
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: myTopPaddingForContent / 2),
              child: Container(
                decoration: myStyleContainer(
                  context: context,
                  color: Theme.of(context).backgroundColor,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.all(myHorizontalPaddingForContainer),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      mySizedHeightBetweenContainer,
                      Stack(
                        children: [
                          Container(
                            constraints:
                                BoxConstraints(maxWidth: Get.width / 3),
                            child: Text(
                              '${title ?? 'Задача на день'}',
                              style: myTextStyleFontUbuntu(
                                context: context,
                                newFontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              '${isDataForPage ? DateTime.parse(dataCalendarActions.startedAt!) != DateTime.now() ? DateFormat.yMd().format(DateTime.parse(dataCalendarActions.startedAt!)) : "Сегодня" : '...'} в ${dataCalendarActions?.startedAt != null ? DateFormat.Hm().format(DateTime.parse(dataCalendarActions!.startedAt!)) : '...'}',
                              style: myTextStyleFontUbuntu(
                                context: context,
                                newFontWeight: FontWeight.w400,
                                textColor: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .color,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: SvgPicture.asset(
                              (isDataForPage && dataCalendarActions.isDone)
                                  ? 'assets/icons/is_done.svg'
                                  : 'assets/icons/no_complete.svg',
                              semanticsLabel: 'status',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                      mySizedHeightBetweenContainer,
                      Text(
                        'Описание:',
                        style: myTextStyleFontUbuntu(
                          context: context,
                          newFontWeight: FontWeight.w500,
                        ),
                      ),
                      mySizedHeightBetweenContainer,
                      Column(
                        children: [
                          Text(
                            isDataForPage
                                ? dataCalendarActions.description ?? ''
                                : '',
                            style: myTextStyleFontUbuntu(
                              context: context,
                              newFontWeight: FontWeight.w400,
                              textColor:
                                  Theme.of(context).textTheme.headline3!.color,
                            ),
                          ),
                        ],
                      ),
                      mySizedHeightBetweenContainer,
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            isDataForPage
                ? dataCalendarActions.isDone
                    ? buttonAlertMessage(
                        context: context,
                        message: 'Задача завершена',
                        isDone: true,
                      )
                    : dataCalendarActions.isCanceled
                        ? buttonAlertMessage(
                            context: context,
                            message: 'Задача отменена',
                          )
                        : buttonsRowEvents(context: context, targetId: targetId)
                : Container(),
            mySizedHeightBetweenContainer,
          ],
        );
      },
    );
  }
}
