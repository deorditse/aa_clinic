import 'dart:convert';

import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/profile_page/pages/achievements_pages/achievements_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/profile_page/pages/edit_profile_page/edit_profile_page.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/container_for_photo.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/my_shimmer_effect_container.dart';
import 'package:intl/intl.dart';
import 'package:model/model.dart';
import 'package:business_layout/business_layout.dart';
import 'package:flutter/material.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;

import 'main_Info_top_profile.dart';
import 'row_with_photo_and_progress.dart';

class TopProfileWidget extends StatelessWidget {
  const TopProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImplementSettingGetXController>(
      builder: (controllerSetting) {
        final bool isUserData = controllerSetting.userAllData != null;

        return isUserData
            ? Padding(
                padding: const EdgeInsets.all(myTopPaddingForContent),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            child: RowWithPhotoAndProgress(),
                          ),
                          Flexible(
                            flex: 2,
                            child: MainInfoTopProfile(),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          BodyEditProfilePage
                              .showBottomSheetWidgetBodyEditProfilePage(
                                  context: context);
                        },
                        child: SvgPicture.asset(
                          'assets/icons/edit.svg',
                          color: Get.isDarkMode
                              ? null
                              : Theme.of(context).textTheme.headline1!.color,
                          semanticsLabel: 'edit',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              )
            : myShimmerEffectContainer(context: context);
      },
    );
  }
}
