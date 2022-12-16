import 'dart:io';

import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/add_new_dish_page/pages/adding_a_dish_page/adding_a_dish_page.dart';
import 'package:model/model.dart';
import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/main_login_page.dart';
import 'package:business_layout/business_layout.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';

import 'adding_a_dish_photo_food_bottom_sheet_widget.dart';
import '../../../list_with_dish_card.dart';

class PhotoFood extends StatelessWidget {
  const PhotoFood({Key? key, required this.indexDishCard}) : super(key: key);
  final int indexDishCard;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImplementAddNewDishController>(
      builder: (controllerAddNewDish) {
        File? photoFood = controllerAddNewDish
            .modelDishCardList[indexDishCard].nutriDish.file;

        return photoFood != null
            ? SizedBox(
                height: Get.height / 4,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: myTopPaddingForContent,
                    bottom: myTopPaddingForContent / 2,
                  ),
                  child: Stack(
                    children: [
                      Container(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        clipBehavior: Clip.hardEdge,
                        decoration: myStyleContainer(context: context).copyWith(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(15),
                            top: Radius.circular(5),
                          ),
                        ),
                        child: Image.file(
                          photoFood,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            controllerAddNewDish.changeListAddDishEnableCard(
                                index: indexDishCard, deletePhoto: true);

                            listIndexWherePhotosNotAdded.add(indexDishCard);
                          },
                          child: Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : _RowWithButtonAddPhoto(index: indexDishCard);
      },
    );
  }
}

class _RowWithButtonAddPhoto extends StatelessWidget {
  const _RowWithButtonAddPhoto({Key? key, required this.index})
      : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
      onPressed: () {
        FocusManager.instance.primaryFocus?.unfocus();

        addingADishPhotoFoodBottomSheetWidgetHomePage(
          context: context,
          indexDishCard: index,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            Get.isDarkMode
                ? 'assets/icons/camera.svg'
                : 'assets/icons/for_light_theme/camera_light.svg',
            semanticsLabel: 'camera',
            fit: BoxFit.cover,
          ),
          const SizedBox(width: myHorizontalPaddingForContainer),
          Text(
            'Добавить фото...',
            style: myTextStyleFontUbuntu(
                textColor: Theme.of(context).textTheme.headline3!.color,
                context: context),
          ),
          Expanded(child: Container()),
          Obx(
            () => Column(
              children: [
                if (listIndexWherePhotosNotAdded.contains(index))
                  Padding(
                    padding: const EdgeInsets.only(
                      left: myTopPaddingForContent,
                      right: myTopPaddingForContent,
                    ),
                    child: FittedBox(
                      child: Text(
                        'Добавьте фото блюда',
                        style: myTextStyleFontUbuntu(
                          fontSize: 12,
                          textColor: Colors.red,
                          context: context,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
