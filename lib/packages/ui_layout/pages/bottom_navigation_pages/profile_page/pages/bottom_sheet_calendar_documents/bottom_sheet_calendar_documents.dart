import 'dart:io';

import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/app_bars/sliver_app_bar.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/sceleton_show_bottomSheet.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';

import 'calendar/calendar.dart';

class BottomSheetCalendarDocumentsProfilePage extends StatelessWidget {
  static const String id = '/bottomSheetCalendarDocumentsProfilePage';

  const BottomSheetCalendarDocumentsProfilePage({Key? key}) : super(key: key);

  static showBottomSheetWidgetBodyCalendarDocumentsProfilePage(
          {required context}) =>
      showBottomSheetContainer(
        context: context,
        titleAppBar: 'Выбор даты:',
        deleteAppBar: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        widgetBody: BottomSheetCalendarDocumentsProfilePage(),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: myBackLineInAppBar(context: context)),
        CalendarProfilePage(),
        Center(
          child: ElevatedButton(
            onPressed: () => _submit(context: context),
            child: Text('СОХРАНИТЬ'),
          ),
        ),
      ],
    );
  }

  void _submit({required BuildContext context}) {
    Navigator.of(context).pop();
  }
}