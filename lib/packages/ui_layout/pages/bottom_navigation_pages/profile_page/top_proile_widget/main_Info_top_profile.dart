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


class MainInfoTopProfile extends StatelessWidget {
  const MainInfoTopProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  DateTime? _getYbDate({required String? bDate}) {
    return bDate != null ? DateTime.parse('$bDate') : null;
  }
}

