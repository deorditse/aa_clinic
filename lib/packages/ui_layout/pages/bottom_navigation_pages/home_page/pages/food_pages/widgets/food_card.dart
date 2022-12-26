import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/food_pages/about_food_page/about_food_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:business_layout/business_layout.dart';
import 'package:model/model.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({Key? key, required this.indexDish, required this.targetId})
      : super(key: key);
  final int indexDish;
  final String targetId;

  @override
  Widget build(BuildContext context) {
    NutriDishModel dish = HomePageCalendarControllerGetxState
        .instance.mapTargetIdAndNutriMealsWithId[targetId]!.dishes[indexDish]!;
    return TextButton(
      onPressed: () {
        HomePageCalendarControllerGetxState.instance.changePhotoFood(
          isDeletePhotoFoodFile: true,
          indexDish: 0,
          targetId: '0',
        );
        AboutFoodPage.openAboutFoodPage(
          title: dish.title,
          context: context,
          indexDish: indexDish,
          targetId: targetId,
        );
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      child: Container(
        decoration: myStyleContainer(
            color: Theme.of(context).backgroundColor, context: context),
        child: Padding(
          padding: const EdgeInsets.all(myTopPaddingForContent),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  dish.title ?? 'Еда',
                  style: myTextStyleFontUbuntu(
                      context: context, newFontWeight: FontWeight.w300),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: myTopPaddingForContent),
                child: Text(
                  "${dish.kcal ?? 0} Ккал",
                  style: myTextStyleFontUbuntu(
                    textColor: Theme.of(context).textTheme.headline3!.color,
                    context: context,
                    newFontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/foodIsComplete.svg',
                    semanticsLabel: 'foodIsComplete',
                    color: dish.lifeImage != null
                        ? myColorIsActive
                        : Theme.of(context).textTheme.headline3!.color,
                  ),
                  myIconForward(
                    color: dish.lifeImage != null
                        ? myColorIsActive
                        : Theme.of(context).textTheme.headline3!.color,
                    context: context,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
