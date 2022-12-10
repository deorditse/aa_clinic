import 'package:aa_clinic/packages/style_app/lib/src/text_style.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarHeaderProfilePage extends StatelessWidget {
  final DateTime focusedDay;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;
  final VoidCallback onTodayButtonTap;
  final VoidCallback onClearButtonTap;
  final bool clearButtonVisible;

  const CalendarHeaderProfilePage({
    Key? key,
    required this.focusedDay,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
    required this.onTodayButtonTap,
    required this.onClearButtonTap,
    required this.clearButtonVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headerText = DateFormat('MMMM').format(focusedDay);
    final headerTextYear = DateFormat('yyyy').format(focusedDay);
//header calendar
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: myTopPaddingForContent - 3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  '${headerText.capitalize} $headerTextYear',
                  style: myTextStyleFontUbuntu(context: context,
                    newFontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TextButton(
                onPressed: onTodayButtonTap,
                child: Text(
                  "сегодня",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      color: Theme.of(context).textTheme.headline2!.color,
                    ),
                    onPressed: onLeftArrowTap,
                  ),
                  GestureDetector(
                    onTap: onRightArrowTap,
                    child: Icon(
                      Icons.chevron_right,
                      color: Theme.of(context).textTheme.headline2!.color,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            height: 1,
            color: Theme.of(context).textTheme.headline3!.color,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
