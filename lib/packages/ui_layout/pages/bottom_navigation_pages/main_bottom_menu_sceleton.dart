import 'package:style_app/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/chat_with_user_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/doctors_appointment_pages/incoming_video_chat_page/incoming_video_chat_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/workout_pages/pages/about_workout_progress_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:business_layout/business_layout.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'articles_page/articles_page.dart';
import 'chat_page/chat_page.dart';
import 'chat_page/pages/user_profile_page/user_profile_page.dart';
import 'home_page/home_page.dart';
import 'home_page/pages/default_page_if_not_find_page/default_task_for_day_page.dart';
import 'home_page/pages/workout_pages/pages/workout_progress_page/workout_progress_page.dart';
import 'home_page/pages/workout_pages/workout_page.dart';
import 'other_page/other_page.dart';
import 'other_page/pages/orders_page/about_order_page/about_order_page.dart';
import 'profile_page/pages/achievements_pages/about_achievements_page.dart';
import 'profile_page/pages/achievements_pages/achievements_page.dart';
import 'profile_page/pages/add_new_document_page/add_new_document_page.dart';
import 'profile_page/pages/documents_page/documents_page.dart';
import 'profile_page/pages/edit_profile_page/edit_profile_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/articles_page/pages/about_article_page/about_article_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/add_new_dish_page/add_new_dish_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/add_new_dish_page/pages/adding_a_dish_page/adding_a_dish_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/doctors_appointment_pages/doctors_appointment_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/doctors_appointment_pages/video_chat_with_a_psychologist_page/video_agora_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/food_pages/food_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/other_page/pages/change_password_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/other_page/pages/orders_page/orders_history_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/other_page/pages/subscriptions_page/subscriptions_page.dart';

List<Widget> screensBottomNavigation = [
  ProfilePage(),
  ChatPage(),
  HomePage(),
  ArticlesPage(),
  OtherPage(),
];
PersistentTabController _controllerTabIndex = PersistentTabController(
  initialIndex: ImplementSettingGetXController.instance.controllerTabIndex,
);

class MyBottomMenuSceleton extends StatelessWidget {
  static const String id = '/main';

  MyBottomMenuSceleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImplementSettingGetXController>(
      builder: (controllerSetting) {
        _controllerTabIndex.index = controllerSetting.controllerTabIndex;
        return Scaffold(
          resizeToAvoidBottomInset:
              controllerSetting.controllerTabIndex == 1 ? true : false,
          body: PersistentTabView.custom(
            context,
            controller: _controllerTabIndex,
            itemCount: _myTabBar(context: context).length,
            onWillPop: (context) async => true,
            screens: screensBottomNavigation,
            confineInSafeArea: true,
            backgroundColor: Theme.of(context).cardColor,
            // Default is Colors.white.
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset:
                controllerSetting.controllerTabIndex == 1 ? true : false,
            // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            stateManagement: true,
            // Default is true.
            hideNavigationBarWhenKeyboardShows: true,
            // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
            screenTransitionAnimation: const ScreenTransitionAnimation(
              // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 100),
            ),

            customWidget: _CustomNavBarWidget(
              // Your custom widget goes here
              items: _myTabBar(
                context: context,
                selectedIndex: controllerSetting.controllerTabIndex,
              ),
              selectedIndex: controllerSetting.controllerTabIndex,

              onItemSelected: (index) {
                //снять фокус с тектовых полей при переходе
                FocusScope.of(context).unfocus();
                //инициирую контроллеры
                controllerSetting.initializedControllersForPage(
                    indexPage: index);
                controllerSetting.changeBodyPageForIndex(indexPage: index);
                print("onItemSelected $index");

              },
            ),
          ),
        );
      },
    );
  }
}

class _CustomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;

  _CustomNavBarWidget({
    Key? key,
    required this.selectedIndex,
    required this.items,
    required this.onItemSelected,
  }) : super(key: key);

  Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected,
      {required BuildContext context}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Flexible(
          child: item.icon,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Material(
            type: MaterialType.transparency,
            child: FittedBox(
              child: Text(
                item.title.toString(),
                style: myTextStyleFontUbuntu(
                  fontSize: 12,
                  context: context,
                  textColor: isSelected
                      ? myColorIsActive
                      : Theme.of(context).textTheme.headline1!.color,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
              color: Theme.of(context)
                  .textTheme
                  .headline1!
                  .color!
                  .withOpacity(0.5),
              width: 0.3),
        ),
      ),
      width: double.infinity,
      padding: const EdgeInsets.only(top: 6, left: 6, right: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map(
          (item) {
            int index = items.indexOf(item);
            return Flexible(
              child: GestureDetector(
                onTap: () {
                  onItemSelected(index);
                },
                child:
                    _buildItem(item, selectedIndex == index, context: context),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

List<PersistentBottomNavBarItem> _myTabBar(
        {int? selectedIndex, required BuildContext context}) =>
    [
      PersistentBottomNavBarItem(
        title: ('Профиль'),
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: MyBottomMenuSceleton.id,
          routes: {
            ProfilePage.id: (final context) => const ProfilePage(),
            DocumentsProfilePage.id: (final context) => DocumentsProfilePage(),
            AddNewDocumentProfilePage.id: (final context) =>
                AddNewDocumentProfilePage(),
            WidgetBodyAchievementsProfilePage.id: (final context) =>
                WidgetBodyAchievementsProfilePage(),
            WidgetBodyAboutAchievementsProfilePage.id: (final context) =>
                WidgetBodyAboutAchievementsProfilePage(),
            BodyEditProfilePage.id: (final context) => BodyEditProfilePage(),
          },
        ),
        icon: SvgPicture.asset(
          'assets/icons/menu_icons/profile.svg',
          semanticsLabel: 'Профиль',
          color: selectedIndex == 0
              ? myColorIsActive
              : Theme.of(context).textTheme.headline1!.color,
        ),
      ),
      PersistentBottomNavBarItem(
        title: ('Чат'),
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: MyBottomMenuSceleton.id,
          routes: {
            ChatPage.id: (final context) => const ChatPage(),
            UserProfilePage.id: (final context) => UserProfilePage(),
            ChatWithUserPage.id: (final context) => ChatWithUserPage(),
          },
        ),
        icon: SvgPicture.asset(
          'assets/icons/menu_icons/chat.svg',
          semanticsLabel: 'Чат',
          color: selectedIndex == 1
              ? myColorIsActive
              : Theme.of(context).textTheme.headline1!.color,
        ),
      ),
      PersistentBottomNavBarItem(
        title: ('Главная'),
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: MyBottomMenuSceleton.id,
          routes: {
            HomePage.id: (final context) => const HomePage(),
            AddNewEventHomePage.id: (final context) => AddNewEventHomePage(),
            AddNewDishHomePage.id: (final context) => AddNewDishHomePage(),
            FoodPage.id: (final context) => FoodPage(),
            WorkoutPageFromHomePage.id: (final context) =>
                WorkoutPageFromHomePage(),
            WorkoutProgressPage.id: (final context) => WorkoutProgressPage(),
            AboutWorkoutProgressPage.id: (final context) =>
                AboutWorkoutProgressPage(),
            DoctorsAppointmentPage.id: (final context) =>
                DoctorsAppointmentPage(),
            DefaultTaskForDayPage.id: (final context) =>
                DefaultTaskForDayPage(),
            AgoraWithVideo.id: (final context) => AgoraWithVideo(),
            IncomingVideoChatPage.id: (final context) =>
                IncomingVideoChatPage(),
          },
        ),
        icon: SvgPicture.asset(
          'assets/icons/menu_icons/main.svg',
          semanticsLabel: 'Главная',
          color: selectedIndex == 2
              ? myColorIsActive
              : Theme.of(context).textTheme.headline1!.color,
        ),
      ),
      PersistentBottomNavBarItem(
        title: ('Статьи'),
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: MyBottomMenuSceleton.id,
          routes: {
            ArticlesPage.id: (final context) => const ArticlesPage(),
            AboutArticlePage.id: (final context) => AboutArticlePage(),
          },
        ),
        icon: SvgPicture.asset(
          'assets/icons/menu_icons/articles.svg',
          semanticsLabel: 'Статьи',
          color: selectedIndex == 3
              ? myColorIsActive
              : Theme.of(context).textTheme.headline1!.color,
        ),
      ),
      PersistentBottomNavBarItem(
        title: ('Прочее'),
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: MyBottomMenuSceleton.id,
          routes: {
            OtherPage.id: (final context) => const OtherPage(),
            ChangePasswordOtherPage.id: (final context) =>
                ChangePasswordOtherPage(),
            SubscriptionsOtherPage.id: (final context) =>
                SubscriptionsOtherPage(),
            BodyOrdersHistoryOtherPage.id: (final context) =>
                BodyOrdersHistoryOtherPage(),
            AboutOrderPage.id: (final context) => AboutOrderPage(),
          },
        ),
        icon: SvgPicture.asset(
          'assets/icons/menu_icons/other.svg',
          semanticsLabel: 'Прочее',
          color: selectedIndex == 4
              ? myColorIsActive
              : Theme.of(context).textTheme.headline1!.color,
        ),
      ),
    ];
