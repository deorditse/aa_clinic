import 'dart:io';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/user_profile_page/widgets/top_profile_container.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/sliver_sceleton_pages/sliver_sceleton_without_borders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'calendar_in_profile_chat_page/calendar.dart';
import 'widgets/after_calendar_widget.dart';

class UserProfilePage extends StatelessWidget {
  static const String id = '/userProfilePage';

  const UserProfilePage({
    Key? key,
    this.imagePath,
    this.isSvgImage = false,
  }) : super(key: key);
  final String? imagePath;
  final bool isSvgImage;

  static goToUserProfilePage({
    required BuildContext context,
    required String? imagePath,
    bool isSvgImage = false,
  }) =>
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: RouteSettings(name: UserProfilePage.id),
        screen: UserProfilePage(
          imagePath: imagePath,
          isSvgImage: isSvgImage,
        ),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );

  @override
  Widget build(BuildContext context) {
    return MySliverNewPageWithoutBorder(
      deleteAppBar: true,
      titleAppBar: 'User Profile',
      widgetBody: _MainBodyUserProfilePage(
        imagePath: imagePath,
        isSvgImage: isSvgImage,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      imageBackgroundName: '',
    );
  }
}

class _MainBodyUserProfilePage extends StatelessWidget {
  const _MainBodyUserProfilePage({
    Key? key,
    this.imagePath,
    this.isSvgImage = false,
  }) : super(key: key);
  final String? imagePath;
  final bool isSvgImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (Platform.isAndroid) mySizedHeightBetweenContainer,
        Container(
          decoration: myStyleContainer(context: context),
          height: Get.height / 5,
          width: double.infinity,
          child: TopProfileContainer(
            imagePath: imagePath,
            isSvgImage: isSvgImage,
          ),
        ),
        mySizedHeightBetweenContainer,
        Container(
          decoration: myStyleContainer(context: context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CalendarChatPage(),
              AfterCalendarWidget(),
            ],
          ),
        ),
        mySizedHeightBetweenContainer,
      ],
    );
  }
}
