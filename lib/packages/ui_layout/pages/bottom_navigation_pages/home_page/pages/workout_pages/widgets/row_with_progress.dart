import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:flutter/material.dart';

rowWithProgress(
    {required String title, required int? progress, required context}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: myTextStyleFontUbuntu(
              fontSize: 15,
              context: context,
            ),
          ),
          Text(
            ' ${progress ?? 0}%',
            style: myTextStyleFontUbuntu(
              fontSize: 14,
              context: context,
              newFontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 6,
      ),
      ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        child: LinearProgressIndicator(
          value: (((progress ?? 0) / 100).toDouble()),
          color: myColorIsActive,
          backgroundColor: myColorIsActive.withOpacity(0.5),
          minHeight: 13,
        ),
      ),
    ],
  );
}
