import 'package:get/get.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';

Widget buttonAlertMessage({
  required BuildContext context,
  required String message,
  bool isDone = false,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Container(
      decoration: myStyleContainer(
          context: context,
          color: Get.isDarkMode
              ? Color.fromRGBO(40, 40, 40, 1)
              : Theme.of(context).backgroundColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Center(
          child: Text(
            message,
            style: myTextStyleFontUbuntu(
              context: context,
              textColor: isDone
                  ? const Color.fromRGBO(14, 214, 166, 1)
                  : const Color.fromRGBO(230, 43, 43, 1),
            ),
          ),
        ),
      ),
    ),
  );
}
