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
                            child: rowWithPhotoAndProgress(context: context),
                          ),
                          Flexible(
                            flex: 2,
                            child: _mainInfoProfile(context: context),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: _buttonEdit(context: context),
                    )
                  ],
                ),
              )
            : myShimmerEffectContainer(context: context);
      },
    );
  }

  _mainInfoProfile({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.only(top: myTopPaddingForContent),
      child: GetBuilder<ImplementSettingGetXController>(
        builder: (controllerSetting) {
          UserDataModel userDataProfile = controllerSetting.userAllData!;

          DateTime? yBdate = _getYbDate(bDate: userDataProfile.bdate);
          String? _getInitialValuebBdate() {
            if (userDataProfile.bdate != null) {
              final _res = DateTime.parse(userDataProfile.bdate!);
              return '${_res.day}.${_res.month}.${_res.year}';
            }
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "${userDataProfile.lastName?.capitalizeFirst ?? ''} ${userDataProfile.firstName.capitalizeFirst ?? ''} ${userDataProfile.middleName?.capitalizeFirst ?? ''}",
                  style: myTextStyleFontUbuntu(
                    context: context,
                    fontSize: 21,
                    newFontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  userDataProfile.gender == 0
                      ? 'Пол не задан'
                      : userDataProfile.gender == 1
                          ? 'Женщина'
                          : 'Мужчина',
                  style: myTextStyleFontUbuntu(
                    context: context,
                    newFontWeight: FontWeight.w300,
                    textColor: Theme.of(context)
                        .textTheme
                        .headline2!
                        .color!
                        .withOpacity(0.75),
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  "${_getInitialValuebBdate() ?? 'Дата рождения не задана'} ${yBdate != null ? '(${DateTime.now().year - int.parse(DateFormat('y').format(yBdate))} лет)' : ''}",
                  style: myTextStyleFontUbuntu(
                    context: context,
                    newFontWeight: FontWeight.w300,
                    textColor: Theme.of(context)
                        .textTheme
                        .headline2!
                        .color!
                        .withOpacity(0.75),
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  userDataProfile.email ?? 'Почта не задана',
                  style: myTextStyleFontUbuntu(
                    context: context,
                    newFontWeight: FontWeight.w300,
                    textColor: Theme.of(context)
                        .textTheme
                        .headline2!
                        .color!
                        .withOpacity(0.75),
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  userDataProfile.phoneNumber ?? 'Моб. номер не задан',
                  style: myTextStyleFontUbuntu(
                    context: context,
                    newFontWeight: FontWeight.w300,
                    textColor: Theme.of(context)
                        .textTheme
                        .headline2!
                        .color!
                        .withOpacity(0.75),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  _buttonEdit({required BuildContext context}) {
    return GestureDetector(onTap: () {
      BodyEditProfilePage.showBottomSheetWidgetBodyEditProfilePage(
          context: context);
    }, child: GetBuilder<ImplementSettingGetXController>(
      builder: (controllerSetting) {
        return controllerSetting.userAllData != null
            ? SvgPicture.asset(
                'assets/icons/edit.svg',
                color: Get.isDarkMode
                    ? null
                    : Theme.of(context).textTheme.headline1!.color,
                semanticsLabel: 'edit',
                fit: BoxFit.cover,
              )
            : Container();
      },
    ));
  }

  DateTime? _getYbDate({required String? bDate}) {
    return bDate != null ? DateTime.parse('$bDate') : null;
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

Row rowWithPhotoAndProgress(
    {required BuildContext context,
    bool deleteOnTap = false,
    VoidCallback? voidCallbackOnPhotoUser}) {
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
                            : coverId != null
                                ? containerForPhotoFuture(
                                    coverFileId: coverId,
                                    openView: voidCallbackOnPhotoUser == null
                                        ? true
                                        : false,
                                  )
                                : null,
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
                            textColor:
                                Theme.of(context).textTheme.headline1!.color!),
                      ),
                      if (!deleteOnTap)
                        TextSpan(
                          text: 'подробнее...',
                          style: myTextStyleFontUbuntu(
                              context: context,
                              fontSize: 17,
                              newFontWeight: FontWeight.w300,
                              textColor:
                                  Theme.of(context).textTheme.headline3!.color),
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
