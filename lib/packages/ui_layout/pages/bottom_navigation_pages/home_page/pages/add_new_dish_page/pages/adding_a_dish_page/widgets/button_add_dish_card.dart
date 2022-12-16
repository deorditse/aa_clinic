import 'package:model/model.dart';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../list_with_dish_card.dart';
import 'dish_enable_card/dish_enable_card.dart';

addDishDisableCard({required BuildContext context, required int index}) {
  return Container(
    decoration: myStyleContainer(
        color: Theme.of(context).backgroundColor, context: context),
    child: TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      onPressed: () {
        ImplementAddNewDishController.instance.changeListAddDishEnableCard(
          modelDishCard: AddNewDishCardModel(
            indexDishCard: index,
            globalKeyFormState: GlobalKey<FormState>(),
            nutriDish: NutriDishModel(),
          ),
          index: index,
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
