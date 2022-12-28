import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/other_page/widgets/menu_list_tile.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/app_bars/sliver_app_bar.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/material_sceleton_without_borders.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/sliver_sceleton_pages/sliver_sceleton_without_borders.dart';
import 'package:flutter/material.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:business_layout/business_layout.dart';
import 'package:get/get.dart';

class OtherPage extends StatelessWidget {
  static const String id = '/otherPage';

  const OtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const MyMaterialNewPageWithoutBorder(
      titleAppBar: 'Прочее',
      onlyBack: false,
      widgetBody: _MainBodyOtherPage(),
      // bodyScreensToGo: BodyScreens.BodyHomePage,
    );
  }
}

class _MainBodyOtherPage extends StatelessWidget {
  const _MainBodyOtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: MenuListTileOtherPage()),
        _columnWithInfoText(context: context),
        mySizedHeightBetweenContainer,
      ],
    );
  }

  _columnWithInfoText({required BuildContext context}) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {},
            style: const ButtonStyle().copyWith(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
            ),
            child: Text(
              "Удалить аккаунт",
              style: myTextStyleFontUbuntu(
                fontSize: 14,
                newFontWeight: FontWeight.w300,
                context: context,
              ).copyWith(
                decorationThickness: 1,
                decorationColor: Theme.of(context).textTheme.headline1!.color,
                // decorationStyle: TextDecorationStyle.wavy,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          Text(
            "Beta 1.0.1. No updates 05.08.2022 ",
            style: myTextStyleFontUbuntu(
                fontSize: 15, newFontWeight: FontWeight.w300, context: context),
          ),
        ],
      ),
    );
  }
}
