import 'package:flutter/material.dart';
import 'package:get/get.dart';

myTextStyleFontOswald(
        {double? fontSize,
        Color? textColor,
        FontWeight? newFontWeight,
        required BuildContext? context}) =>
    TextStyle(
      color: textColor ??
          (context != null
              ? Theme.of(context).textTheme.headline1!.color
              : Get.theme.textTheme.headline1!.color),
      fontFamily: 'Oswald',
      fontSize: fontSize ?? 20,
      fontWeight: newFontWeight ?? FontWeight.w400,
    );

TextStyle myTextStyleFontUbuntu(
        {double? fontSize,
        Color? textColor,
        FontWeight? newFontWeight,
        required BuildContext? context}) =>
    TextStyle(
      color: textColor ??
          (context != null
              ? Theme.of(context).textTheme.headline1!.color
              : Get.theme.textTheme.headline1!.color),
      fontFamily: 'Ubuntu',
      fontSize: fontSize ?? 16,
      fontWeight: newFontWeight ?? FontWeight.w400,
    );
