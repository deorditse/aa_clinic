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
        Center(
          child: myBackLineInAppBar(context: context),
        ),
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

  Future<void> _submit({required BuildContext context}) async {
    Navigator.of(context).pop();
    await getDocumentsListData(
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
      lower: ProfileControllerGetxState.instance.rangeStartForSearch.toUtc(),
      greater: ProfileControllerGetxState.instance.rangeEndForSearch?.toUtc(),
      page: 1,
      perPage: 6,
    );
  }
}

///роут для получения доков выбранного промежутка и поиска доков
Future<DocumentsListModel?> getDocumentsListData({
  required String accessToken,
  required int page,
  required int perPage,
  required DateTime? greater,
  required DateTime? lower,
}) async {
  try {
    Map<String, dynamic> queryParameters = {};

    if (lower != null) {
      print(lower.toLocal());
      print(greater?.toLocal());
      queryParameters = {
        'page': "$page",
        'perPage': '$perPage',
        "filter[createdAt][lower]": "${lower.toLocal}",
        "filter[createdAt][greater]": "${greater?.toLocal ?? DateTime.now()}",
      };
    }
    Uri url = urlMain(
        urlPath: 'api/patientDocuments', queryParameters: queryParameters);
    var response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer ${accessToken}",
        "Content-Type": "application/json",
      },
    );

    print(
        'Response status from getPatientDocumentsByUserIdData: DocumentsListModel ${response.statusCode} ${response.body}');

    if (response.statusCode == 200) {
      DocumentsListModel _res =
          DocumentsListModel.fromJson(jsonDecode(response.body));
      print(_res.docs.length);
      return _res;
    } else {
      Get.snackbar(
        'Exception',
        'Bad Request getPatientDocumentsByUserIdData: status ${response.statusCode}',
        snackPosition: SnackPosition.TOP,
      );
    }
  } catch (error) {
    Get.snackbar(
      'Exception',
      'error getPatientDocumentsByUserIdData: $error}',
      snackPosition: SnackPosition.TOP,
    );
    print('я в ошибке from getPatientDocumentsByUserIdData $error ');
  }
  return null;
}
