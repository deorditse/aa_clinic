import 'dart:convert';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/container_for_photo.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/my_shimmer_effect_container.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/sceleton_show_bottomSheet.dart';
import 'package:business_layout/business_layout.dart';
import 'package:model/model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'about_achievements_page.dart';

class WidgetBodyAchievementsProfilePage extends StatelessWidget {
  static const String id = '/widgetBodyAchievementsProfilePage';

  const WidgetBodyAchievementsProfilePage({Key? key}) : super(key: key);

  static showBottomSheetWidgetBodyAchievementsProfilePage({required context}) =>
      showBottomSheetContainer(
        context: context,
        titleAppBar: 'Достижения',
        backLine: true,
        onlyBack: false,
        expand: true,
        widgetBody: WidgetBodyAchievementsProfilePage(),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: myTopPaddingForContent),
      child: GetBuilder<ProfileControllerGetxState>(
        builder: (controllerProfile) {
          List<String?> idUserAchievementsList = ImplementSettingGetXController
                  .instance.userAllData?.achievements ??
              [];
          return controllerProfile.achievementsModelData != null
              ? ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  padding: EdgeInsets.zero,
                  itemCount:
                      controllerProfile.achievementsModelData!.docs.length,
                  itemBuilder: (context, index) {
                    final doc =
                        controllerProfile.achievementsModelData!.docs[index];

                    bool isUserAchiv = idUserAchievementsList.contains(doc.id);

                    return _rowAchievement(
                      isUserAchiv: isUserAchiv,
                      context: context,
                      indexAchievement: index,
                    );
                  },
                )
              : ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(bottom: myTopPaddingForContent),
                      child: myShimmerEffectContainer(
                        context: context,
                        newHeight: 40,
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}

_rowAchievement({
  required int indexAchievement,
  required context,
  bool isUserAchiv = false,
}) {
  final doc = ProfileControllerGetxState
      .instance.achievementsModelData!.docs[indexAchievement];

  return Padding(
    padding: const EdgeInsets.only(bottom: myTopPaddingForContent),
    child: TextButton(
      onPressed: () {
        WidgetBodyAboutAchievementsProfilePage
            .showBottomSheetWidgetBodyAboutAchievementsProfilePage(
          context: context,
          isUserAchiv: isUserAchiv,
          indexAchievement: indexAchievement,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //если картинка будет лежать в инете пменять на ImageNetwork
          Flexible(
            child: CircleAvatar(
              radius: 23,
              backgroundColor: Theme.of(context).backgroundColor,
              child: (doc.image != null && doc.image != 'null')
                  ? containerForPhotoFuture(
                      coverFileId: doc.image!,
                      isCircular: true,
                    )
                  : CircleAvatar(
                radius: 23,
                      backgroundColor: isUserAchiv
                          ? Theme.of(context).backgroundColor
                          : Theme.of(context).cardColor.withOpacity(0.5),
                    ),
            ),
          ),
          const SizedBox(
            width: myHorizontalPaddingForContainer,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  doc.title,
                  style: myTextStyleFontUbuntu(
                    context: context,
                    newFontWeight: FontWeight.w400,
                    textColor: isUserAchiv
                        ? null
                        : Theme.of(context)
                            .textTheme
                            .headline2!
                            .color!
                            .withOpacity(0.2),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: myHorizontalPaddingForContainer,
                ),
                Text(
                  doc.description,
                  style: myTextStyleFontUbuntu(
                    context: context,
                    textColor: isUserAchiv
                        ? Theme.of(context).textTheme.headline2!.color
                        : Theme.of(context)
                            .textTheme
                            .headline2!
                            .color!
                            .withOpacity(0.3),
                    fontSize: 13,
                    newFontWeight: FontWeight.w200,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
