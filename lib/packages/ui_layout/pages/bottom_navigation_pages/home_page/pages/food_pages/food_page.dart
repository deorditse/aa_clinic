import 'dart:convert';

import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/sliver_sceleton_pages/sliver_sceleton_without_borders.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/my_shimmer_effect_container.dart';
import 'package:business_layout/business_layout.dart';
import 'package:model/model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'widgets/food_card.dart';
import 'package:http/http.dart' as http;

class FoodPage extends StatelessWidget {
  static const String id = '/foodPage';

  const FoodPage({Key? key, this.title, this.targetId}) : super(key: key);
  final String? title;
  final String? targetId;

  static openFoodPage({
    required context,
    required String title,
    required String targetId,
  }) =>
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: RouteSettings(name: FoodPage.id),
        screen: FoodPage(title: title, targetId: targetId),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );

  @override
  Widget build(BuildContext context) {
    final titleDate = abbreviatedTitleDateAppBar(
      mySelectedDay: HomePageCalendarControllerGetxState.instance.mySelectedDay,
      isShort: true,
    );

    return MySliverNewPageWithoutBorder(
      titleAppBar: '$titleDate, $title',
      widgetBody: _BodyFoodPage(targetId: targetId!),
      primary: true,
    );
  }
}

class _BodyFoodPage extends StatelessWidget {
  const _BodyFoodPage({Key? key, required this.targetId}) : super(key: key);
  final String targetId;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageCalendarControllerGetxState>(
      builder: (controllerHome) {
        NutriMealsModel? dataNutriMeal =
            controllerHome.mapTargetIdAndNutriMealsWithId[targetId];

        final bool isDataForPage = dataNutriMeal != null;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              shrinkWrap: true,
              //для динамического изменения высоты
              padding: EdgeInsets.zero,
              primary: false,
              itemCount: isDataForPage ? dataNutriMeal.dishes.length : 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: myTopPaddingForContent),
                  child: isDataForPage
                      ? FoodCard(indexDish: index, targetId: targetId)
                      : myShimmerEffectContainer(
                          context: context,
                          newHeight: 50,
                        ),
                );
              },
            ),
            mySizedHeightBetweenContainer,
            mySizedHeightBetweenContainer,
            Text(
              "Описание:",
              style: myTextStyleFontUbuntu(
                  context: context, newFontWeight: FontWeight.w500),
            ),
            SizedBox(height: myTopPaddingForContent / 2),
            if (isDataForPage)
              Text(
                "${dataNutriMeal.description ?? "Описание не добавлено"}",
                style: myTextStyleFontUbuntu(
                    context: context, newFontWeight: FontWeight.w300),
              )
            else
              Text(
                'Ошибка получения данных API',
                style: myTextStyleFontUbuntu(context: context),
              ),
            mySizedHeightBetweenContainer,
          ],
        );
      },
    );
  }
}
