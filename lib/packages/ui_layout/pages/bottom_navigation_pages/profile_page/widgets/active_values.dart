import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:business_layout/business_layout.dart';
import 'package:model/model.dart';
import 'package:hive/hive.dart';

class ActiveValues extends StatelessWidget {
  static const String id = '/activeValues';

  const ActiveValues({Key? key}) : super(key: key);

  static openActiveValuesPage({required context, required int indexDocument}) =>
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: const RouteSettings(name: ActiveValues.id),
        screen: ActiveValues(),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(myTopPaddingForContent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Активные значения",
            style: myTextStyleFontUbuntu(
              context: context,
              fontSize: 21,
              newFontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: myHorizontalPaddingForContainer),
          Expanded(child: _columnWithValueTitle(context: context)),
        ],
      ),
    );
  }

  _columnWithValueTitle({required BuildContext context}) {
    return GetBuilder<ActiveValueControllerProfilePage>(
        builder: (controllerActiveValue) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Get.width / 5,
                child: _valueTitle(
                  title: 'Пульс',
                  value:

                      ///Проверяем данные здоровья пользователя на их наличие и выводим на экран полученное значение, иначе поле с текстом ' - '
                      controllerActiveValue.activeHealthValues != null &&
                              controllerActiveValue
                                      .activeHealthValues!.heartRate !=
                                  null
                          ? '${controllerActiveValue.activeHealthValues!.heartRate} bpm'
                          : '-',
                  context: context,
                ),
              ),
              SizedBox(
                width: Get.width / 3,
                child: _valueTitle(

                    ///Проверяем данные здоровья пользователя на их наличие и выводим на экран полученное значение, иначе поле с текстом ' - '
                    title: 'Аритмия',
                    value: controllerActiveValue.activeHealthValues != null &&
                            controllerActiveValue
                                    .activeHealthValues!.arrhythmia !=
                                null
                        ? '${controllerActiveValue.activeHealthValues!.arrhythmia} ms'
                        : '-',
                    context: context),
              ),
              SizedBox(
                width: Get.width / 4.5,
                child: _valueTitle(
                    title: 'Кислород',

                    ///Проверяем данные здоровья пользователя на их наличие и выводим на экран полученное значение, иначе поле с текстом ' - '
                    value: controllerActiveValue.activeHealthValues != null &&
                            controllerActiveValue.activeHealthValues!.oxygen !=
                                null
                        ? '${controllerActiveValue.activeHealthValues!.oxygen} %'
                        : '-',
                    context: context),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Get.width / 5,
                child: _valueTitle(
                  title: 'Шаги',

                  ///Проверяем данные здоровья пользователя на их наличие и выводим на экран полученное значение, иначе поле с текстом ' - '
                  value: controllerActiveValue.activeHealthValues != null &&
                          controllerActiveValue.activeHealthValues!.steps !=
                              null
                      ? '${controllerActiveValue.activeHealthValues!.steps} шт'
                      : '-',
                  context: context,
                ),
              ),
              SizedBox(
                width: Get.width / 3,
                child: _valueTitle(
                    title: 'Ккал сожжено',

                    ///Проверяем данные здоровья пользователя на их наличие и выводим на экран полученное значение, иначе поле с текстом ' - '
                    value: controllerActiveValue.activeHealthValues != null &&
                            controllerActiveValue
                                    .activeHealthValues!.energyBurned !=
                                null
                        ? '${controllerActiveValue.activeHealthValues!.energyBurned} kkal'
                        : '-',
                    context: context),
              ),
              SizedBox(
                width: Get.width / 4.5,
                child: _valueTitle(
                    title: 'Сон',

                    ///Проверяем данные здоровья пользователя на их наличие и выводим на экран полученное значение, иначе поле с текстом ' - '
                    value: controllerActiveValue.activeHealthValues != null &&
                            controllerActiveValue
                                    .activeHealthValues!.sleepinbed !=
                                null
                        ? '${controllerActiveValue.activeHealthValues!.sleepinbed} hours'
                        : '-',
                    context: context),
              ),
            ],
          ),
        ],
      );
    });
  }
}

_valueTitle(
    {required String title,
    required String value,
    required BuildContext context}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      FittedBox(
        child: Text(
          title,
          style: myTextStyleFontUbuntu(
              context: context,
              newFontWeight: FontWeight.w400,
              textColor: Theme.of(context).textTheme.headline1!.color!),
          overflow: TextOverflow.fade,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 4.0, bottom: 3),
        child: Text(
          value,
          style: myTextStyleFontUbuntu(
            context: context,
            newFontWeight: FontWeight.w300,
            textColor:
                Theme.of(context).textTheme.headline2!.color!.withOpacity(0.9),
          ),
        ),
      ),
      SvgPicture.asset(
        'assets/icons/rectangle.svg',
        semanticsLabel: 'Профиль',
        // width: 30,
      ),
    ],
  );
}
