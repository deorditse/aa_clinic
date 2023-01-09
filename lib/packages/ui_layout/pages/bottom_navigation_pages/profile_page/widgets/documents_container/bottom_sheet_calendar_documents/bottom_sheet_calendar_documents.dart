import 'dart:io';
import 'package:business_layout/business_layout.dart';
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

  String makeQuery(Map<String, dynamic>? data) {
    var result = [];

    if (data != null) {
      data.forEach((key, value) {
        if (value != null && (value is! String || value.trim().isNotEmpty)) {
          result.add('$key=${value.toString()}');
        }
      });
    }

    return result.join('&');
  }

  void _submit({required BuildContext context}) {
    //обнуление перед новым запросом
    ProfileControllerGetxState.instance
        .deleteRangeFromCalendarDocumentList(isDelete: true);

    Navigator.of(context).pop();
    ProfileControllerGetxState.instance.getDocumentsList(
      lower: ProfileControllerGetxState.instance.rangeStartForSearch.toUtc(),
      greater: ProfileControllerGetxState.instance.rangeEndForSearch?.toUtc(),
      updateRangeFromCalendarDocumentList: true,
      currentDocsPage: 1,
    );
  }
}
