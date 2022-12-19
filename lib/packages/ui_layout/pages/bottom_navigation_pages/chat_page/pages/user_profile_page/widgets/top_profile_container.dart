import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/container_for_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

class TopProfileContainer extends StatelessWidget {
  const TopProfileContainer({
    Key? key,
    required this.userMinified,
    this.isSvgImage = false,
  }) : super(key: key);
  final UserMinifiedDataIdModel? userMinified;
  final bool isSvgImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(myTopPaddingForContent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _rowWithBackAndFio(context: context),
          mySizedHeightBetweenContainer,
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _professionColumn(context: context),
                ),
                _photoUser(
                  context: context,
                  imagePath: userMinified?.avatar,
                  isSvgImage: isSvgImage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _rowWithBackAndFio({required BuildContext context}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "Назад",
            style: myTextStyleFontUbuntu(
              context: context,
              textColor: myColorIsActive.withOpacity(0.8),
            ).copyWith(
              decorationThickness: 1,
              decorationColor: myColorIsActive,
              // decorationStyle: TextDecorationStyle.wavy,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        Text(
          "${userMinified?.lastName?.capitalizeFirst ?? " "} ${userMinified?.middleName?.capitalizeFirst ?? " "} ${userMinified?.firstName?.capitalizeFirst ?? ""}",
          style: myTextStyleFontUbuntu(context: context),
        ),
      ],
    );
  }

  _professionColumn({required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${userMinified?.specialist ?? "Специалист"}",
          style: myTextStyleFontUbuntu(context: context),
        ),
        Text(
          "05.08.1998 (24 года)",
          style: myTextStyleFontUbuntu(
              newFontWeight: FontWeight.w300,
              textColor: Theme.of(context).textTheme.headline3!.color!,
              context: context),
        ),
        Text(
          "Описание:",
          style: myTextStyleFontUbuntu(context: context),
        ),
        Text(
          "Тут должно быть краткое био",
          style: myTextStyleFontUbuntu(
              newFontWeight: FontWeight.w300,
              textColor: Theme.of(context).textTheme.headline3!.color!,
              context: context),
        ),
      ],
    );
  }

  _photoUser({
    required BuildContext context,
    required imagePath,
    bool isSvgImage = false,
  }) {
    return Container(
      width: Get.width / 4.5,
      height: Get.width / 4.5,
      child: !isSvgImage && (imagePath != null) && imagePath != ''
          ? ContainerForPhotoFuture(
              borderRadius: 15, coverFileId: imagePath, openView: true)
          : CircleAvatar(
              backgroundColor: Colors.transparent,
              child: SvgPicture.asset(
                "$imagePath",
                semanticsLabel: 'addNewEvent',
                fit: BoxFit.contain,
              ),
            ),
    );
  }
}
