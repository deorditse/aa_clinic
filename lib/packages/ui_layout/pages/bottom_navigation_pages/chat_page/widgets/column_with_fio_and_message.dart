import 'package:flutter/material.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';

class ColumnWithFioAndMessage extends StatelessWidget {
  const ColumnWithFioAndMessage(
      {Key? key, required this.fullName, required this.lastMessageDate})
      : super(key: key);

  final String fullName;
  final String? lastMessageDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: myHorizontalPaddingForContainer),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$fullName',
            overflow: TextOverflow.ellipsis,
            style: myTextStyleFontUbuntu(context: context),
          ),
          Text(
            (lastMessageDate != null && lastMessageDate != '')
                ? '$lastMessageDate'
                : "Нет сообщений",
            overflow: TextOverflow.ellipsis,
            style: myTextStyleFontUbuntu(
                // fontSize: 14,
                textColor: Theme.of(context).textTheme.headline3!.color,
                newFontWeight: FontWeight.w300,
                context: context),
          ),
        ],
      ),
    );
  }
}
