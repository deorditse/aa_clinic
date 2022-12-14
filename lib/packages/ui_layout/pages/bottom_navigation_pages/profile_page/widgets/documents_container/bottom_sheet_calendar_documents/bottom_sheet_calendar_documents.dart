import 'dart:io';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/app_bars/sliver_app_bar.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/sceleton_show_bottomSheet.dart';
import 'package:intl/intl.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'calendar/calendar.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:data_layout/data_layout.dart';
import 'package:model/model.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/profile_page/pages/add_new_document_page/add_new_document_page.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/app_bars/widgetsRightAppBar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

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
    Navigator.of(context).pop();
    getPatientDocumentsByUserIdForSearchRangeData(
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
      startRangeDateTime:
          ProfileControllerGetxState.instance.rangeStartForSearch,
      endRangeDateTime: ProfileControllerGetxState.instance.rangeEndForSearch,
    );
  }
}

///Роут для получения списка документов по userId
Future<DocumentsListModel?> getPatientDocumentsByUserIdForSearchRangeData({
  required String accessToken,
  required DateTime startRangeDateTime,
  required DateTime? endRangeDateTime,
}) async {
  String timeStringFormat({required DateTime date, required bool isStart}) {
    return isStart
        ? date.toIso8601String()
        : date.add(Duration(days: 1)).toIso8601String();
  }

  try {
    Map<String, dynamic> bodyFilter = {
      'lower': '${timeStringFormat(date: startRangeDateTime, isStart: true)}',
      'greater':
          '${timeStringFormat(date: endRangeDateTime ?? startRangeDateTime, isStart: false)}',
    };
    final queryParameters = {
      "filter[createdAt]": makeQuery(bodyFilter),
    };

    print(queryParameters);

    Uri url = urlMain(
        urlPath: 'api/patientDocuments', queryParameters: queryParameters);

    var response = await http.get(
      url,
      headers: {"Authorization": "Bearer ${accessToken}"},
    );

    print(
        'Response status from getPatientDocumentsByUserIdForSearchRangeData: ${response.statusCode}');
    log('getPatientDocumentsByUserIdForSearchRangeData DocumentsListModel ${response.body}');

    if (response.statusCode == 200) {
      return DocumentsListModel.fromJson(jsonDecode(response.body));
    } else {
      Get.snackbar(
        'Exception',
        'Bad Request getPatientDocumentsByUserIdForSearchRangeData: status ${response.statusCode}',
        snackPosition: SnackPosition.TOP,
      );
    }
  } catch (error) {
    Get.snackbar(
      'Exception',
      'error getPatientDocumentsByUserIdForSearchRangeData: $error}',
      snackPosition: SnackPosition.TOP,
    );
    print(
        'я в ошибке from getPatientDocumentsByUserIdForSearchRangeData $error ');
  }
  return null;
}
