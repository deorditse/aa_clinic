import 'dart:io';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/style_app/lib/src/consts_app.dart';
import 'package:aa_clinic/packages/style_app/lib/src/card_style.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/profile_page/widgets/active_values.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/profile_page/top_proile_widget/top_proile_widget.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/sliver_sceleton_pages/sliver_sceleton_without_borders.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/documents_container/documents.dart';

class ProfilePage extends StatelessWidget {
  static const String id = '/profilePage';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileControllerGetxState());

    return MySliverNewPageWithoutBorder(
      deleteAppBar: true,
      primary: true,
      titleAppBar: 'Профиль',
      widgetBody: _MainBodyProfilePage(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      imageBackgroundName: '',
    );
  }
}

class _MainBodyProfilePage extends StatelessWidget {
  const _MainBodyProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (Platform.isAndroid) mySizedHeightBetweenContainer,
        Container(
          decoration: myStyleContainer(context: context),
          height: Get.height / 3.4,
          child: TopProfileWidget(),
        ),
        mySizedHeightBetweenContainer,
        Container(
          decoration: myStyleContainer(context: context),
          height: Get.height / 4.6,
          child: ActiveValues(),
        ),
        mySizedHeightBetweenContainer,
        Documents(),
        mySizedHeightBetweenContainer,
      ],
    );
  }
}
