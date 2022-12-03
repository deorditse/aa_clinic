import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/default_dialog_yes_no.dart';
import 'package:business_layout/business_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

buttonsRowEvents({required BuildContext context, required String targetId}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color.fromRGBO(224, 121, 114, 1),
          ),
        ),
        onPressed: () => _submitCancel(context: context, targetId: targetId),
        child: Text('ОТМЕНИТЬ'),
      ),
      ElevatedButton(
        onPressed: () => _submitSave(targetId: targetId),
        child: Text('ГОТОВО'),
      ),
    ],
  );
}
//
// String urlMainApiConst = 'aaclinic-dev.glavstudio.pro';
//
// ///Роут для завершения календарного события и изменение его на статуса done +
// Future<void> calendarActionDoneData({
//   required String targetId,
//   required String accessToken,
// }) async {
//   try {
//     Uri url = Uri.http(urlMainApiConst, 'api/calendarActions/done/$targetId');
//     var response = await http.put(
//       url,
//       headers: {'Authorization': 'Bearer ${accessToken}'},
//     );
//
//     if (response.statusCode == 200) {
//       print(
//           'Response status from calendarActionDoneData: ${response.statusCode}');
//       // print(jsonEncode(userEdit));
//     } else {
//       print(response.body);
//       Get.snackbar(
//         'Exception',
//         'Bad Request calendarActionDoneData: status ${response.statusCode}',
//         snackPosition: SnackPosition.TOP,
//       );
//     }
//   } catch (error) {
//     Get.snackbar(
//       'Exception',
//       'error calendarActionDoneData:$error}',
//       snackPosition: SnackPosition.TOP,
//     );
//     print('я в ошибке from calendarActionDoneData $error ');
//   }
// }

Future<void> _submitSave({required String targetId}) async {
  await HomePageCalendarControllerGetxState.instance.calendarActionDone(
    targetId: targetId,
  );
}

Future<void> _submitCancel(
    {required BuildContext context, required String targetId}) async {
  TextEditingController textEditingController = TextEditingController();
  myDefaultDialogYesOrNo(
    textEditingController: textEditingController,
    message: 'хотите отменить действие?',
    voidCallbackToAccept: () async {
      await HomePageCalendarControllerGetxState.instance.calendarActionCancel(
        targetId: targetId,
        cancelReason: textEditingController.text,
      );
    },
    context: context,
  );
}
