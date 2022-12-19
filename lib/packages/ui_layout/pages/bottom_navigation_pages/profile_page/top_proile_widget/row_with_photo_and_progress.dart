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

class RowWithPhotoAndProgress extends StatelessWidget {
  const RowWithPhotoAndProgress(
      {Key? key, this.voidCallbackOnPhotoUser, this.deleteOnTap = false})
      : super(key: key);
  final bool deleteOnTap;
  final VoidCallback? voidCallbackOnPhotoUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: voidCallbackOnPhotoUser,
            child: FittedBox(
              child: CircleAvatar(
                backgroundColor: Theme.of(context).backgroundColor,
                child: GetBuilder<ProfileControllerGetxState>(
                  builder: (controllerProfile) {
                    String? coverId = ImplementSettingGetXController
                        .instance.userAllData!.avatar;
                    return Stack(
                      children: [
                        Container(
                          decoration: myStyleContainer(
                            context: context,
                            isCircular: true,
                            color: Theme.of(context).backgroundColor,
                          ),
                          clipBehavior: Clip.hardEdge,
                          width: double.maxFinite,
                          height: double.maxFinite,
                          child: controllerProfile.photoProfile != null
                              ? Image.file(
                                  controllerProfile.photoProfile!,
                                  fit: BoxFit.cover,
                                )
                              : ContainerForPhotoFuture(
                                  coverFileId: coverId,
                                  openView: voidCallbackOnPhotoUser == null
                                      ? true
                                      : false,
                                ),
                        ),
                        if (voidCallbackOnPhotoUser != null)
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Ред.',
                              style: myTextStyleFontUbuntu(
                                context: context,
                                fontSize: 10,
                                newFontWeight: FontWeight.w500,
                                textColor: Colors.white,
                                // Theme.of(context).textTheme.headline1!.color,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: myHorizontalPaddingForContainer),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  if (!deleteOnTap) {
                    WidgetBodyAchievementsProfilePage
                        .showBottomSheetWidgetBodyAchievementsProfilePage(
                            context: context);
                  }
                },
                child: GetBuilder<ProfileControllerGetxState>(
                  builder: (controllerProfile) => Text.rich(
                    TextSpan(
                      style: TextStyle(fontSize: 16),
                      children: [
                        TextSpan(
                          text:
                              '${controllerProfile.percentAchievementsValue ?? '...'}% достижений открыто ',
                          style: myTextStyleFontUbuntu(
                              context: context,
                              fontSize: 17,
                              newFontWeight: FontWeight.w300,
                              textColor: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .color!),
                        ),
                        if (!deleteOnTap)
                          TextSpan(
                            text: 'подробнее...',
                            style: myTextStyleFontUbuntu(
                                context: context,
                                fontSize: 17,
                                newFontWeight: FontWeight.w300,
                                textColor: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .color),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: FittedBox(
            child: progressIndicator(
              context: context,
            ),
          ),
        ),
      ],
    );
  }
}

Widget progressIndicator({required context}) {
  return GetBuilder<ProfileControllerGetxState>(
    builder: (controllerProfile) => CircularPercentIndicator(
      radius: 36.0,
      lineWidth: 9.0,
      percent: controllerProfile.percentAchievementsValue != null
          ? (controllerProfile.percentAchievementsValue! / 100)
          : 0.1,
      center: Text(
        "${controllerProfile.percentAchievementsValue ?? '...'}%",
        style: myTextStyleFontUbuntu(
          context: context,
        ),
      ),
      progressColor: myColorIsActive,
      backgroundColor: myColorIsActive.withOpacity(0.5),
      animation: true,
      animationDuration: 900,
      circularStrokeCap: CircularStrokeCap.butt,
    ),
  );
}
