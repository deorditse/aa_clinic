import 'dart:io';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/user_profile_page/widgets/top_profile_container.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/sliver_sceleton_pages/sliver_sceleton_without_borders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:model/model.dart';
import 'calendar_in_profile_chat_page/calendar.dart';
import 'widgets/after_calendar_widget/after_calendar_widget.dart';

class UserProfilePage extends StatelessWidget {
  static const String id = '/userProfilePage';

  const UserProfilePage({
    Key? key,
    this.isSvgImage = false,
    this.userMinified,
  }) : super(key: key);
  final bool isSvgImage;
  final UserMinifiedDataIdModel? userMinified;

  static goToUserProfilePage({
    required UserMinifiedDataIdModel? userMinified,
    required BuildContext context,
    bool isSvgImage = false,
  }) =>
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: RouteSettings(name: UserProfilePage.id),
        screen: UserProfilePage(
          userMinified: userMinified,
          isSvgImage: isSvgImage,
        ),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );

  @override
  Widget build(BuildContext context) {
    Get.put(ImplementationCalendarEventsChatPage());
    return MySliverNewPageWithoutBorder(
      deleteAppBar: true,
      primary: true,
      titleAppBar: 'User Profile',
      widgetBody: _MainBodyUserProfilePage(
        isSvgImage: isSvgImage,
        userMinified: userMinified,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      imageBackgroundName: '',
    );
  }
}

class _MainBodyUserProfilePage extends StatelessWidget {
  const _MainBodyUserProfilePage({
    Key? key,
    required this.userMinified,
    this.isSvgImage = false,
  }) : super(key: key);
  final UserMinifiedDataIdModel? userMinified;
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
            isSvgImage: isSvgImage,
            userMinified: userMinified,
          ),
        ),
        mySizedHeightBetweenContainer,
        Container(
          decoration: myStyleContainer(context: context),
          child: userMinified != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CalendarChatPage(
                      specialistId: userMinified!.id,
                    ),
                    AfterCalendarWidget(
                      specialistId: userMinified!.id,
                    ),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
        mySizedHeightBetweenContainer,
      ],
    );
  }
}
