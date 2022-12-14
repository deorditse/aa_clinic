import 'dart:convert';

import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;

class HealthAssessment extends StatelessWidget {
  const HealthAssessment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(myTopPaddingForContent / 2),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(bottom: myHorizontalPaddingForContainer),
            child: Text(
              "Оценка здоровья",
              style: myTextStyleFontUbuntu(
                context: context,
                newFontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FittedBox(
                    child: Text(
                      "Данную оценку проставил",
                      style: myTextStyleFontUbuntu(
                        newFontWeight: FontWeight.w300,
                        context: context,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: myHorizontalPaddingForContainer,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "специалист",
                        style: myTextStyleFontUbuntu(
                          newFontWeight: FontWeight.w300,
                          context: context,
                        ),
                      ),
                      FutureBuilder<int?>(
                        future: HomePageCalendarControllerGetxState.instance
                            .getHealthRates(),
                        builder: (context, AsyncSnapshot<int?> snapshot) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                right: myTopPaddingForContent / 1.5),
                            child: Text(
                              snapshot.hasData
                                  ? '${((snapshot.data! / 100) * 5).toStringAsFixed(1)}'
                                  : "0.0",
                              style: myTextStyleFontUbuntu(
                                  textColor: myColorIsActive,
                                  newFontWeight: FontWeight.w500,
                                  fontSize: 22,
                                  context: context),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  Center(
                    child: FittedBox(
                      child: Text(
                        "11.08.22 - 12.08.22",
                        style: myTextStyleFontUbuntu(
                          textColor:
                              Theme.of(context).textTheme.headline3!.color,
                          newFontWeight: FontWeight.w300,
                          fontSize: 13,
                          context: context,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
