import 'dart:io';

import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/add_new_dish_page/pages/adding_a_dish_page/adding_a_dish_page.dart';
import 'package:model/model.dart';
import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/main_login_page.dart';
import 'package:business_layout/business_layout.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';

import 'app_photo_food/adding_a_dish_photo_food_bottom_sheet_widget.dart';
import 'app_photo_food/app_photo_food.dart';

class AddDishEnableCard extends StatelessWidget {
  const AddDishEnableCard({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: myStyleContainer(
          color: Theme.of(context).backgroundColor, context: context),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: myHorizontalPaddingForContainer),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GetBuilder<ImplementAddNewDishController>(
              builder: (controllerAddDish) {
                AddNewDishCardModel modelDishCard =
                    controllerAddDish.modelDishCardList[index];
                NutriDishModel dish = modelDishCard.nutriDish;
                return Form(
                  key: modelDishCard.globalKeyFormState,
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
                              ImplementAddNewDishController.instance
                                  .changeListAddDishEnableCard(index: index);

                              if (listIndexWherePhotosNotAdded
                                  .contains(index)) {
                                listIndexWherePhotosNotAdded.remove(index);
                              }
                            },
                            child: Icon(
                              ImplementAddNewDishController
                                          .instance.modelDishCardList.length >
                                      1
                                  ? Icons.close
                                  : Icons.delete,
                              color:
                                  Theme.of(context).textTheme.headline3!.color,
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
                                  newFontWeight: FontWeight.w300,
                                  context: context),
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
                                  newFontWeight: FontWeight.w300,
                                  context: context),
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
                );
              },
            ),
            PhotoFood(indexDishCard: index),
          ],
        ),
      ),
    );
  }
}
