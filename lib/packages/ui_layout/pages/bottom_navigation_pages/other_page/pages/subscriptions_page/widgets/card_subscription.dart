import 'dart:convert';
import 'dart:math';

import 'package:business_layout/business_layout.dart';
import 'package:model/model.dart';
import 'package:aa_clinic/packages/style_app/lib/src/consts_app.dart';
import 'package:aa_clinic/packages/style_app/lib/src/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardSubscription extends StatelessWidget {
  const CardSubscription({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    MarketSubscription subscription =
        OtherControllerGetxState.instance.subscriptions!.docs[index]!;
    _GradientColorList _gradientColors = listGradientColors[index] ??
        listGradientColors[Random().nextInt(listGradientColors.length)]!;
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: myHorizontalPaddingForContainer),
      child: Container(
        height: Get.size.height / 3.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.01, 1],
            colors: [
              Get.isDarkMode
                  ? _gradientColors.gradientStart.withOpacity(0.5)
                  : _gradientColors.gradientStart
                      .withOpacity(0.9)
                      .withGreen(170),
              Get.isDarkMode
                  ? _gradientColors.gradientEnd.withOpacity(0.5)
                  : _gradientColors.gradientEnd.withOpacity(0.9)
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(myTopPaddingForContent),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subscription.title ?? '',
                style: myTextStyleFontUbuntu(
                  fontSize: 22,
                  context: context,
                  textColor: Color.fromRGBO(251, 254, 255, 1),
                ),
              ),
              mySizedHeightBetweenContainer,
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    subscription.description ?? '',
                    style: myTextStyleFontUbuntu(
                      fontSize: 16,
                      context: context,
                      textColor: Color.fromRGBO(251, 254, 255, 1),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('КУПИТЬ'),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        '${subscription.pricePerMonth?.toInt() ?? '...'}/мес',
                        style: myTextStyleFontUbuntu(
                          fontSize: 20,
                          newFontWeight: FontWeight.w300,
                          context: context,
                          textColor: Color.fromRGBO(251, 254, 255, 1),
                        ),
                      ),
                    ),
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

class _GradientColorList {
  _GradientColorList({
    required this.gradientStart,
    required this.gradientEnd,
  });

  Color gradientStart;
  Color gradientEnd;
}

List<_GradientColorList?> listGradientColors = [
  _GradientColorList(
    gradientEnd: const Color.fromRGBO(126, 14, 214, 0.69),
    gradientStart: myColorIsActive,
  ),
  _GradientColorList(
    gradientEnd: const Color.fromRGBO(102, 214, 14, 0.69),
    gradientStart: myColorIsActive,
  ),
  _GradientColorList(
    gradientEnd: const Color.fromRGBO(255, 150, 255, 0.69),
    gradientStart: myColorIsActive,
  ),
  _GradientColorList(
    gradientEnd: const Color.fromRGBO(255, 60, 14, 0.69),
    gradientStart: myColorIsActive,
  ),
];
