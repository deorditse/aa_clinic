import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:flutter/cupertino.dart';

Widget titleTextForAuth({required String titleText, required context}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 18.0),
    child: Text(
      titleText,
      style: myTextStyleFontOswald(
        context: context,
        fontSize: 28,
        newFontWeight: FontWeight.w400,
      ),
      textAlign: TextAlign.center,
    ),
  );
}
