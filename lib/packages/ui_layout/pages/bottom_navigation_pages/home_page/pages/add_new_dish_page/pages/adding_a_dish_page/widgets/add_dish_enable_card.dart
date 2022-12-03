import 'dart:io';

import 'package:model/model.dart';
import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/main_login_page.dart';
import 'package:business_layout/business_layout.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';

import 'adding_a_dish_photo_food_bottom_sheet_widget.dart';
import '../list_with_dish_card.dart';

class AddDishEnableCard extends StatelessWidget {
  const AddDishEnableCard({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    NutriDishModel? dish = newListDishes[index];
    return Container(
      decoration: myStyleContainer(
          color: Theme.of(context).backgroundColor, context: context),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: myHorizontalPaddingForContainer),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Form(
              key: listFormKey[index],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  mySizedHeightBetweenContainer,
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          cursorColor: myColorIsActive,
                          // controller: _nameController,
                          key: Key('addName'),
                          validator: (value) {
                            if (value == '') {
                              return 'Введите название блюда';
                            }
                            return null;
                          },
                          onChanged: (name) {
                            dish.title = name;
                          },
                          keyboardType: TextInputType.text,

                          decoration: myStyleTextField(
                            context,
                            labelText: 'Введите название блюда...',
                          ).copyWith(
                            fillColor: Theme.of(context)
                                .backgroundColor
                                .withOpacity(1),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      GestureDetector(
                        onTap: () {
                          changeListAddDishEnableCard(index: index);
                          //очистить фото
                          HomePageCalendarControllerGetxState.instance
                              .changeListPhotoAddDishEnableCard(
                            isRemoveForIndex: true,
                            indexDishCard: index,
                          );
                        },
                        child: Obx(
                          () => Icon(
                            listAddDishEnableCard.length <= 1
                                ? Icons.delete
                                : Icons.close,
                            color: Theme.of(context).textTheme.headline3!.color,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: myTopPaddingForContent),
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: Get.width / 5,
                            child: TextFormField(
                              cursorColor: myColorIsActive,
                              // controller: _nameController,
                              key: Key('kkal'),
                              validator: (value) {
                                if (value == '') {
                                  return 'Ккал';
                                }
                                return null;
                              },
                              onChanged: (kcal) {
                                dish.kcal = int.parse(kcal);
                              },

                              //если нет контроллера, можно делать через initialValue

                              keyboardType: TextInputType.number,
                              decoration: myStyleTextField(
                                context,
                                labelText: 'Ккал...',
                              ).copyWith(
                                fillColor: Theme.of(context)
                                    .backgroundColor
                                    .withOpacity(1),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text(
                          'Ккал',
                          style: myTextStyleFontUbuntu(
                              newFontWeight: FontWeight.w300, context: context),
                        ),
                      ),
                      const SizedBox(width: myTopPaddingForContent),
                      Container(
                        width: Get.width / 4,
                        child: TextFormField(
                          cursorColor: myColorIsActive,
                          // controller: _nameController,
                          key: Key('gramm'),
                          validator: (value) {
                            if (value == '') {
                              return 'Грамм';
                            }
                            return null;
                          },
                          //если нет контроллера, можно делать через initialValue
                          // initialValue: dataUser?.surname,

                          onChanged: (mass) {
                            dish.mass = int.parse(mass);
                          },
                          keyboardType: TextInputType.number,
                          decoration: myStyleTextField(
                            context,
                            labelText: 'Грамм...',
                          ).copyWith(
                            fillColor: Theme.of(context)
                                .backgroundColor
                                .withOpacity(1),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text(
                          'Грамм',
                          style: myTextStyleFontUbuntu(
                              newFontWeight: FontWeight.w300, context: context),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: myTopPaddingForContent),
                  TextFormField(
                    maxLines: 5,
                    cursorColor: myColorIsActive,
                    //for testing
                    key: Key('fieldDeccript'),

                    keyboardType: TextInputType.text,
                    decoration: myStyleTextField(
                      context,
                      labelText: 'Введите описание блюда...',
                    ).copyWith(
                      alignLabelWithHint: true,
                      fillColor:
                          Theme.of(context).backgroundColor.withOpacity(1),
                    ),
                    onChanged: (description) {
                      dish.description = description;
                    },

                    // validator: (value) {
                    //   if (value == '') return 'Введите описание';
                    //   return null;
                    // },
                  ),
                ],
              ),
            ),
            _RowWithPhotoButton(index: index),
          ],
        ),
      ),
    );
  }
}

class _RowWithPhotoButton extends StatelessWidget {
  const _RowWithPhotoButton({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _PhotoFood(
          indexDishCard: index,
        ),
        Obx(
          () {
            return newListDishes[index].file == null
                ? TextButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero)),
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();

                      addingADishPhotoFoodBottomSheetWidgetHomePage(
                          context: context, indexDishCard: index);
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
                              textColor:
                                  Theme.of(context).textTheme.headline3!.color,
                              context: context),
                        ),
                        Expanded(child: Container()),
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
                  )
                : Padding(
                    padding:
                        const EdgeInsets.only(bottom: myTopPaddingForContent),
                    child: Container(),
                  );
          },
        ),
      ],
    );
  }
}

class _PhotoFood extends StatelessWidget {
  const _PhotoFood({Key? key, required this.indexDishCard}) : super(key: key);
  final int indexDishCard;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageCalendarControllerGetxState>(
      builder: (controllerHome) {
        File? photoFood = controllerHome
            .mapIndexDishCardAndPhotoAddDishEnableCard[indexDishCard];
        return photoFood != null
            ? SizedBox(
                height: Get.height / 4,
                child: Padding(
                  padding: const EdgeInsets.only(top: myTopPaddingForContent),
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
                            HomePageCalendarControllerGetxState.instance
                                .changeListPhotoAddDishEnableCard(
                              isRemoveForIndex: true,
                              indexDishCard: indexDishCard,
                            );
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
            : Container();
      },
    );
  }
}
