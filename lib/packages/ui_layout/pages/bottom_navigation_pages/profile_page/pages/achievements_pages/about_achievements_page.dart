import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/sceleton_show_bottomSheet.dart';
import 'package:model/model.dart';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/container_for_photo.dart';
import 'package:get/get.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WidgetBodyAboutAchievementsProfilePage extends StatelessWidget {
  static const String id = '/widgetBodyAboutAchievementsProfilePage';

  const WidgetBodyAboutAchievementsProfilePage(
      {Key? key, this.indexAchievement, this.isUserAchiv = false})
      : super(key: key);
  final int? indexAchievement;
  final bool isUserAchiv;

  static showBottomSheetWidgetBodyAboutAchievementsProfilePage({
    required context,
    required int indexAchievement,
    required bool isUserAchiv,
  }) =>
      showBottomSheetContainer(
        context: context,
        titleAppBar: ProfileControllerGetxState
                .instance.achievementsModelData?.docs[indexAchievement].title ??
            'Достижения',
        backLine: true,
        onlyBack: false,
        widgetBody: WidgetBodyAboutAchievementsProfilePage(
          indexAchievement: indexAchievement,
          isUserAchiv: isUserAchiv,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final doc = ProfileControllerGetxState
        .instance.achievementsModelData?.docs[indexAchievement!];
    return SizedBox(
      height: Get.height * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          mySizedHeightBetweenContainer,
          Expanded(
            child: SingleChildScrollView(
              child: _rowAchievement(
                context: context,
                imageAchievement: doc?.image,
                subtitle: "${doc?.description}",
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FutureBuilder<Achievement?>(
                  future: ProfileControllerGetxState.instance
                      .getAchievementsWithId(idAchievement: doc!.id),
                  builder: (BuildContext context,
                      AsyncSnapshot<Achievement?> snapshot) {
                    return Text(
                      'Есть у ${snapshot.hasData ? snapshot.data?.achievementPercents?.toStringAsFixed(2) ?? 0 : '...'}% пользователей',
                      style: myTextStyleFontUbuntu(
                        context: context,
                        fontSize: 14,
                        textColor: Theme.of(context).textTheme.headline2!.color,
                        newFontWeight: FontWeight.w300,
                      ),
                    );
                  }),
              Text(
                isUserAchiv ? 'Получено' : 'Не получено',
                style: myTextStyleFontUbuntu(
                  context: context,
                  fontSize: 14,
                  textColor: Theme.of(context).textTheme.headline2!.color,
                  newFontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

_rowAchievement(
    {required String? imageAchievement,
    required String subtitle,
    required context}) {
  return Padding(
    padding: EdgeInsets.only(bottom: mySizedHeightBetweenContainer.height!),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //если картинка будет лежать в инете пменять на ImageNetwork

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Описание:',
                style: myTextStyleFontUbuntu(
                  context: context,
                  // fontSize: 14,
                  newFontWeight: FontWeight.w500,
                ),
              ),
              mySizedHeightBetweenContainer,
              Text(
                '$subtitle',
                style: myTextStyleFontUbuntu(
                  context: context,
                  fontSize: 13,
                  newFontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: myHorizontalPaddingForContainer,
        ),
        FittedBox(
          child: CircleAvatar(
            backgroundColor: Theme.of(context).backgroundColor,
            child: (imageAchievement != null && imageAchievement != 'null')
                ? containerForPhotoFuture(coverFileId: imageAchievement)
                : CircleAvatar(
                    backgroundColor: Theme.of(context).backgroundColor),
          ),
        ),
      ],
    ),
  );
}
