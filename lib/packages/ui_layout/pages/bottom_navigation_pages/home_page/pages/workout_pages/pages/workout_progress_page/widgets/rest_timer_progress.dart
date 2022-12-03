import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:flutter/material.dart';

restTimerProgress(
    {required String title, required int? time, required context}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: myTextStyleFontUbuntu(
              fontSize: 14,
              context: context,
            ),
          ),
          Text(
            ' ${(time) ?? 0} : 00',
            style: myTextStyleFontUbuntu(
                fontSize: 14, context: context, newFontWeight: FontWeight.w300),
          ),
        ],
      ),
      SizedBox(
        height: 6,
      ),
      ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        child: LinearProgressIndicator(
          value: (((time ?? 0) / 100).toDouble()),
          color: Color.fromRGBO(14, 214, 166, 1),
          backgroundColor: Color.fromRGBO(14, 214, 166, 1).withOpacity(0.5),
          minHeight: 13,
        ),
      ),
    ],
  );
}
