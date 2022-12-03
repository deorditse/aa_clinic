import 'package:aa_clinic/packages/data_layout/lib/data_layout.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:business_layout/business_layout.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'articles_page/articles_page.dart';
import 'chat_page/chat_page.dart';
import 'home_page/home_page.dart';
import 'other_page/other_page.dart';

List<Widget> screensBottomNavigation = [
  ProfilePage(),
  ChatPage(),
  HomePage(),
  ArticlesPage(),
  OtherPage(),
];

class MyBottomMenuSceleton extends StatefulWidget {
  static const String id = '/main';

  MyBottomMenuSceleton({Key? key}) : super(key: key);

  @override
  State<MyBottomMenuSceleton> createState() => _MyBottomMenuSceletonState();
}

class _MyBottomMenuSceletonState extends State<MyBottomMenuSceleton> {
  late PersistentTabController controllerTabIndex;

  @override
  void initState() {
    super.initState();
    // остановка показа экрана заставки
    FlutterNativeSplash.remove();
    controllerTabIndex = PersistentTabController(
      initialIndex: ImplementSettingGetXController.instance.controllerTabIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImplementSettingGetXController>(
      builder: (controllerSetting) {
        controllerTabIndex.index = controllerSetting.controllerTabIndex;
        return Scaffold(
          body: PersistentTabView.custom(
            context,
            controller: controllerTabIndex,
            itemCount: _myTabBar(context: context).length,
            onWillPop: (context) async => true,
            screens: screensBottomNavigation,
            confineInSafeArea: true,
            backgroundColor: Theme.of(context).cardColor,
            // Default is Colors.white.
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            stateManagement: true,
            // Default is true.
            hideNavigationBarWhenKeyboardShows: true,
            // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
            screenTransitionAnimation: const ScreenTransitionAnimation(
              // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 150),
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
  });

  Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected,
      {required BuildContext context}) {
    return Container(
      alignment: Alignment.center,
      height: 55.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
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
      ),
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
        icon: SvgPicture.asset(
          'assets/icons/menu_icons/other.svg',
          semanticsLabel: 'Прочее',
          color: selectedIndex == 4
              ? myColorIsActive
              : Theme.of(context).textTheme.headline1!.color,
        ),
      ),
    ];
