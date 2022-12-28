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
    getDocumentsListData(
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
      lower: ProfileControllerGetxState.instance.rangeStartForSearch,
      greater: ProfileControllerGetxState.instance.rangeEndForSearch,
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
    Map<String, dynamic> queryParameters = {
      'page': "$page",
      'perPage': '$perPage',
    };

    if (lower != null) {
      print(lower.toIso8601String());
      print(greater?.toIso8601String());
      queryParameters = {
        ...queryParameters,
        'filter[createdAt][lower]': "${lower.toIso8601String}",
        'filter[createdAt][greater]':
            "${greater?.toIso8601String ?? DateTime.now().toIso8601String}",
      };
      print(queryParameters);
    }

    Uri url = urlMain(
        urlPath: 'api/patientDocuments', queryParameters: queryParameters);

    var response = await http.get(url, headers: {
      "Authorization": "Bearer ${accessToken}",
    });

    print(
        'Response status from getPatientDocumentsByUserIdData: ${response.statusCode}');
    log('getPatientDocumentsByUserIdData DocumentsListModel ${response.body}');

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
