import 'package:aa_clinic/packages/style_app/lib/src/card_style.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:flutter/material.dart';

class AlertMessageWidget extends StatefulWidget {
  const AlertMessageWidget({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  State<AlertMessageWidget> createState() => _AlertMessageWidgetState();
}

class _AlertMessageWidgetState extends State<AlertMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: myTopPaddingForContent),
      child: Text(
        widget.message,
        style: myTextStyleFontUbuntu(
            textColor: Theme.of(context).textTheme.headline3!.color,
            fontSize: 14,
            newFontWeight: FontWeight.w300,
            context: context),
        textAlign: TextAlign.center,
      ),
    );
  }
}
