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
import 'widgets/add_photo_food_bottom_sheet_widget.dart';

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
    return GetBuilder<HomePageCalendarControllerGetxState>(
      builder: (controllerHome) {
        NutriDishModel dish = controllerHome
            .mapTargetIdAndNutriMealsWithId[targetId]!.dishes[indexDish]!;
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
                      Container(
                        decoration: myStyleContainer(
                          context: context,
                          color: Theme.of(context).backgroundColor,
                        ),
                        clipBehavior: Clip.hardEdge,
                        height: Get.height / 3.6,
                        width: double.maxFinite,
                        child: ContainerForPhotoFuture(
                          coverFileId: dish.image!,
                          openView: true,
                        ),
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
                            textColor:
                                Theme.of(context).textTheme.headline3!.color,
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
            _AddPhotoEat(indexDish: indexDish, targetId: targetId),
            mySizedHeightBetweenContainer,
          ],
        );
      },
    );
  }
}

class _AddPhotoEat extends StatelessWidget {
  _AddPhotoEat({Key? key, required this.indexDish, required this.targetId})
      : super(key: key);
  final int indexDish;
  final String targetId;

  @override
  Widget build(BuildContext context) {
    NutriDishModel dish = HomePageCalendarControllerGetxState
        .instance.mapTargetIdAndNutriMealsWithId[targetId]!.dishes[indexDish]!;
    final bool isPhotoAdd = dish.lifeImage != null;
    return Column(
      children: [
        Container(
          height: Get.height / 6,
          decoration: myStyleContainer(
              color: Theme.of(context).backgroundColor, context: context),
          child: Padding(
            padding: const EdgeInsets.all(myTopPaddingForContent),
            child: isPhotoAdd
                ? _rowIfEatPhotoAdd(
                    context: context, dish: dish, targetId: targetId)
                : _rowIfEatPhotoNoAdd(context: context, indexDish: indexDish),
          ),
        ),
        if (isPhotoAdd)
          Padding(
            padding:
                const EdgeInsets.only(top: myHorizontalPaddingForContainer),
            child: Text(
              'Карточка заполнена успешно!',
              style: myTextStyleFontUbuntu(
                textColor: myColorIsActive,
                context: context,
                newFontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }

  _rowIfEatPhotoNoAdd({required BuildContext context, required int indexDish}) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () async {
              FocusManager.instance.primaryFocus?.unfocus();

              showAddPhotoFoodBottomSheetWidgetHomePage(
                context: context,
                indexDish: indexDish,
                targetId: targetId,
              );
            },
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero)),
            child: DottedBorder(
              color: myColorIsActive,
              borderType: BorderType.RRect,
              radius: Radius.circular(10),
              dashPattern: [5, 2],
              child: Container(
                height: double.infinity,
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/eat.svg',
                    semanticsLabel: 'eat',
                    color: Theme.of(context).primaryColor,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: myHorizontalPaddingForContainer,
        ),
        Flexible(
          flex: 3,
          child: FittedBox(
            child: Text(
              'Для завершения приема пищи - добавьте фото',
              style: myTextStyleFontUbuntu(
                  textColor: Theme.of(context).textTheme.headline3!.color,
                  newFontWeight: FontWeight.w300,
                  context: context),
            ),
          ),
        ),
      ],
    );
  }

  _rowIfEatPhotoAdd(
      {required BuildContext context,
      required NutriDishModel dish,
      required String targetId}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: GetBuilder<HomePageCalendarControllerGetxState>(
              builder: (controllerHome) => Container(
                height: double.infinity,
                child: controllerHome.photoFood != null
                    ? Image.file(
                        controllerHome.photoFood!,
                        fit: BoxFit.cover,
                      )
                    : ContainerForPhotoFuture(
                        coverFileId: dish.lifeImage!,
                        openView: true,
                      ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: myHorizontalPaddingForContainer,
        ),
        Flexible(
          flex: 3,
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Фото добавлено',
                    style: myTextStyleFontUbuntu(
                      // textColor: myColorIsActive,
                      newFontWeight: FontWeight.w300,
                      fontSize: 14,
                      context: context,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      HomePageCalendarControllerGetxState.instance
                          .changePhotoFood(
                        targetId: targetId,
                        indexDish: indexDish,
                        isDeletePhoto: true,
                      );
                    },
                    child: Icon(
                      Icons.close,
                      color: Theme.of(context).textTheme.headline3!.color,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: FittedBox(
                  child: FutureBuilder<StaticFileModel?>(
                    future: ImplementSettingGetXController.instance
                        .getStaticFile(coverFileId: dish.lifeImage!),
                    builder:
                        (context, AsyncSnapshot<StaticFileModel?> snapshot) {
                      return Text(
                        // DateFormat().format(DateTime.parse(dish.!)),
                        snapshot.data?.createdAt != null
                            ? '${DateFormat('d MMMM y').format(DateTime.parse(snapshot.data!.createdAt!))}, ${DateFormat('EEEE').format(DateTime.parse(snapshot.data!.createdAt!)).capitalize?.toLowerCase()}, ${DateFormat.Hm().format(DateTime.parse(snapshot.data!.createdAt!))}'
                            : "Загрузка даты добавления...",
                        style: myTextStyleFontUbuntu(
                          textColor:
                              Theme.of(context).textTheme.headline3!.color,
                          newFontWeight: FontWeight.w300,
                          context: context,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
