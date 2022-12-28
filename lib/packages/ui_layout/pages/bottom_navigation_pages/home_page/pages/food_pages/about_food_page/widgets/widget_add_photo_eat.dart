import 'dart:io';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/container_for_photo.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:business_layout/business_layout.dart';
import 'package:model/model.dart';
import 'add_photo_food_bottom_sheet_widget.dart';

class AddPhotoEat extends StatelessWidget {
  AddPhotoEat({Key? key, required this.indexDish, required this.targetId})
      : super(key: key);
  final int indexDish;
  final String targetId;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageCalendarControllerGetxState>(
      builder: (controllerHome) {
        NutriDishModel dish = controllerHome
            .mapTargetIdAndNutriMealsWithId[targetId]!.dishes[indexDish]!;
        final bool isPhotoAdd =
            (dish.lifeImage != null) || (controllerHome.photoFood != null);
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
                        photoFood: controllerHome.photoFood,
                        context: context,
                        dish: dish,
                        targetId: targetId,
                      )
                    : _rowIfEatPhotoNoAdd(
                        context: context,
                        indexDish: indexDish,
                      ),
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
      },
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

  _rowIfEatPhotoAdd({
    required BuildContext context,
    required NutriDishModel dish,
    required String targetId,
    File? photoFood,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              height: double.infinity,
              child: photoFood != null
                  ? Image.file(
                      photoFood,
                      fit: BoxFit.cover,
                    )
                  : ContainerForPhotoFuture(
                      coverFileId: dish.lifeImage!,
                      openView: true,
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
              if (photoFood == null)
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
                )
              else
                Align(
                  alignment: Alignment.centerLeft,
                  child: FittedBox(
                    child: Text(
                      '${DateFormat('d MMMM y').format(DateTime.now())}, ${DateFormat('EEEE').format(DateTime.now()).capitalize?.toLowerCase()}, ${DateFormat.Hm().format(DateTime.now())}',
                      style: myTextStyleFontUbuntu(
                        textColor: Theme.of(context).textTheme.headline3!.color,
                        newFontWeight: FontWeight.w300,
                        context: context,
                      ),
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
