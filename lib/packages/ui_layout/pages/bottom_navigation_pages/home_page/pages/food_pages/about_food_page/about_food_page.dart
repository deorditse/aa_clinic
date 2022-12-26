import 'dart:io';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/container_for_photo.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/material_sceleton_without_borders.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:business_layout/business_layout.dart';
import 'package:model/model.dart';
import 'widgets/widget_add_photo_eat.dart';

class AboutFoodPage extends StatelessWidget {
  static const String id = '/aboutFoodPage';

  const AboutFoodPage(
      {Key? key, this.indexDish, this.targetId, required this.title})
      : super(key: key);
  final int? indexDish;
  final String? targetId;
  final String? title;

  static openAboutFoodPage({
    required BuildContext context,
    required int indexDish,
    required String? title,
    required String targetId,
  }) =>
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: RouteSettings(name: AboutFoodPage.id),
        screen: AboutFoodPage(
          indexDish: indexDish,
          targetId: targetId,
          title: title,
        ),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );

  @override
  Widget build(BuildContext context) {
    return MyMaterialNewPageWithoutBorder(
      titleAppBar: title ?? 'Прием пищи',
      primary: true,
      widgetBody:
          _BodyAboutFoodPage(indexDish: indexDish!, targetId: targetId!),
    );
  }
}

class _BodyAboutFoodPage extends StatelessWidget {
  const _BodyAboutFoodPage({
    Key? key,
    required this.indexDish,
    required this.targetId,
  }) : super(key: key);
  final int indexDish;
  final String targetId;

  @override
  Widget build(BuildContext context) {
    NutriDishModel dish = HomePageCalendarControllerGetxState
        .instance.mapTargetIdAndNutriMealsWithId[targetId]!.dishes[indexDish]!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                if (dish.image != null && dish.image!.isNotEmpty)
                  ContainerForPhotoFuture(
                    borderRadius: 15,
                    coverFileId: dish.image!,
                    openView: true,
                  ),
                mySizedHeightBetweenContainer,
                Text(
                  'Описание блюда:',
                  style: myTextStyleFontUbuntu(
                    context: context,
                    newFontWeight: FontWeight.w500,
                  ),
                ),
                mySizedHeightBetweenContainer,
                Text(
                  dish.description ?? 'Описание блюда не добавлено',
                  style: myTextStyleFontUbuntu(
                    textColor: Theme.of(context).textTheme.headline3!.color,
                    newFontWeight: FontWeight.w300,
                    context: context,
                  ),
                ),
                mySizedHeightBetweenContainer,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${dish.kcal ?? '...'} Ккал',
                      style: myTextStyleFontUbuntu(
                        textColor: myColorIsActive,
                        context: context,
                        newFontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      '${dish.mass ?? '...'} Грамм',
                      style: myTextStyleFontUbuntu(
                        textColor: Theme.of(context).textTheme.headline3!.color,
                        newFontWeight: FontWeight.w300,
                        context: context,
                      ),
                    ),
                  ],
                ),
                mySizedHeightBetweenContainer,
              ],
            ),
          ),
        ),
        AddPhotoEat(
          indexDish: indexDish,
          targetId: targetId,
        ),
        mySizedHeightBetweenContainer,
      ],
    );
  }
}
