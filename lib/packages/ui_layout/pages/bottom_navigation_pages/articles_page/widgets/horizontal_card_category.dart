import 'package:aa_clinic/packages/style_app/lib/src/consts_app.dart';
import 'package:aa_clinic/packages/style_app/lib/src/card_style.dart';
import 'package:aa_clinic/packages/style_app/lib/src/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardHorizontal extends StatelessWidget {
  CardHorizontal({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(
          title,
          style: myTextStyleFontUbuntu(
            fontSize: 18,
            context: context,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
