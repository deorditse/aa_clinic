import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_app/src/consts_app.dart';
import 'package:style_app/src/theme_app/custom_theme/material_theme/dark_custom_theme_material.dart';

BoxDecoration myStyleContainer({
  bool isCircular = false,
  Color? color,
  double? borderRadius,
  required BuildContext context,
}) {
  return BoxDecoration(
    color: color ?? Theme.of(context).cardColor,
    borderRadius: borderRadius != null
        ? BorderRadius.circular(borderRadius)
        : BorderRadius.circular(isCircular ? 100 : 15),
  );
}
