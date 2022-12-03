import 'dart:async';

import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/other_page/pages/orders_page/orders_history_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/main_login_page.dart';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../pages/change_password_page.dart';
import '../pages/subscriptions_page/subscriptions_page.dart';

class MenuListTileOtherPage extends StatelessWidget {
  MenuListTileOtherPage({Key? key}) : super(key: key);

  final Rx<bool> switchChangeTheme =
      (SchedulerBinding.instance.window.platformBrightness == Brightness.dark)
          .obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // mySizedHeightBetweenContainer,
        _menuListTileOtherPage(
          iconPath: Get.isDarkMode
              ? 'assets/icons/menu_icons_otherPage/history_order.svg'
              : 'assets/icons/menu_icons_otherPage/for_light_theme/history_order_light.svg',
          title: 'История заказов',
          action: myIconForward(context: context),
          context: context,
          onTap: () {
            BodyOrdersHistoryOtherPage.openBodyOrdersHistoryOtherPage(
                context: context);
          },
        ),

        _menuListTileOtherPage(
          iconPath: Get.isDarkMode
              ? 'assets/icons/menu_icons_otherPage/heart-circle.svg'
              : 'assets/icons/menu_icons_otherPage/for_light_theme/heart-circle_light.svg',
          title: 'Оценить приложение',
          action: myIconForward(context: context),
        ),

        _menuListTileOtherPage(
          iconPath: Get.isDarkMode
              ? 'assets/icons/menu_icons_otherPage/medal-star.svg'
              : 'assets/icons/menu_icons_otherPage/for_light_theme/medal-star_light.svg',
          title: 'Подписки',
          action: myIconForward(context: context),
          onTap: () {
            SubscriptionsOtherPage.openSubscriptionsOtherPage(context: context);
          },
        ),

        _menuListTileOtherPage(
          iconPath: Get.isDarkMode
              ? 'assets/icons/menu_icons_otherPage/box-remove.svg'
              : 'assets/icons/menu_icons_otherPage/for_light_theme/box-remove_light.svg',
          title: 'Очистить кэш',
        ),

        SizedBox(
          child: _menuListTileOtherPage(
            iconPath: Get.isDarkMode
                ? 'assets/icons/menu_icons_otherPage/lock-circle.svg'
                : 'assets/icons/menu_icons_otherPage/for_light_theme/heart-circle_light.svg',
            title: 'Изменить пароль',
            action: myIconForward(
              context: context,
            ),
            onTap: () {
              ChangePasswordOtherPage.openChangePasswordOtherPage(
                  context: context);
            },
          ),
        ),

        Obx(
          () {
            return _menuListTileOtherPage(
              iconPath: 'assets/icons/menu_icons_otherPage/moon.svg',
              title: switchChangeTheme.value ? 'Темная тема' : 'Светлая тема',
              action: FittedBox(
                child: Switch(
                  value: switchChangeTheme.value,
                  onChanged: (bolVal) {
                    switchChangeTheme.value = bolVal;

                    Get.changeThemeMode(
                      bolVal ? ThemeMode.dark : ThemeMode.light,
                    );
                  },
                  activeColor: myColorIsActive,
                ),
              ),
            );
          },
        ),
        mySizedHeightBetweenContainer,
        _menuListTileOtherPage(
          iconPath: 'assets/icons/menu_icons_otherPage/logout.svg',
          title: 'Выход',
          onTap: () async {
            await ImplementAuthController.instance.signOut();
            // await Get.deleteAll(force: true);
            // await Get.delete<ImplementAuthController>(force: true);
            // await Get.delete<ImplementSettingGetXController>(force: true);
            // await Get.delete<RTCControllerGetxState>(force: true);
            Get.offAllNamed('/loginView');
            // Get.offNamedUntil('/loginView', (route) => false);
            // Get.offUntil(GetPageRoute(page: () => LoginView()),
            //     ModalRoute.withName('/loginView'));
            //
            Timer(Duration(milliseconds: 300), () {
              Get.delete<ImplementSettingGetXController>(force: true);
              Get.delete<RTCControllerGetxState>(force: true);
            });
            // Phoenix.rebirth(context);
            // Get.reset();
          },
        ),
      ],
    );
  }
}

Widget _menuListTileOtherPage({
  required String iconPath,
  required title,
  Widget? action,
  VoidCallback? onTap,
  BuildContext? context,
}) {
  return TextButton(
    onPressed: onTap ?? () {},
    style: const ButtonStyle().copyWith(
      padding: MaterialStateProperty.all(EdgeInsets.zero),
    ),
    child: Row(
      children: [
        SvgPicture.asset(
          '$iconPath',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            title,
            style: myTextStyleFontUbuntu(context: context),
          ),
        ),
        Expanded(child: Container()),
        action ?? Container(),
      ],
    ),
  );
}
