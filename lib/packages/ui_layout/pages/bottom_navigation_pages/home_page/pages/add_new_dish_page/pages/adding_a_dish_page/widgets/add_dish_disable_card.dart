import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/add_new_dish_page/pages/adding_a_dish_page/widgets/add_dish_enable_card.dart';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../list_with_dish_card.dart';

addDishDisableCard({required BuildContext context, required int index}) {
  return Container(
    decoration: myStyleContainer(
        color: Theme.of(context).backgroundColor, context: context),
    child: TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      onPressed: () {
        changeListAddDishEnableCard(
          addDishEnableCard: AddDishEnableCard(index: index),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(myTopPaddingForContent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Добавить блюдо",
              style: myTextStyleFontUbuntu(
                  textColor: Theme.of(context).textTheme.headline3!.color,
                  context: context),
            ),
            SvgPicture.asset(
              Get.isDarkMode
                  ? 'assets/icons/menu_icons_otherPage/add-circle.svg'
                  : 'assets/icons/for_light_theme/add-circle_light.svg',
              semanticsLabel: 'addNewEvent',
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    ),
  );
}
