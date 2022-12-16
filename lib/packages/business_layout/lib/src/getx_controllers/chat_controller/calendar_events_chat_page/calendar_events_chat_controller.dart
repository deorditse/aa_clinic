import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:business_layout/business_layout.dart';
import 'package:data_layout/data_layout.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';
import 'package:http/http.dart' as http;

class ImplementationCalendarEventsChatPage extends GetxController {
  //инициализируется тоолько когда пользователь заходит на эту страницу и диспозится после
  static ImplementationCalendarEventsChatPage instance =
      Get.find<ImplementationCalendarEventsChatPage>();

  // final HomePageData _services = HomePageData();
  final CalendarUserChatData _services = CalendarUserChatData();

  DateTime mySelectedDay = DateTime.now();

  void changeMySelectedDay({required DateTime newDateTime}) {
    mySelectedDay = newDateTime;
    update();
  }

  ///получение марок в календаре +
  //  чтобы сохранять в текущей сессии и не тянyть из базы если есть
  //  в мапе Map<String, Map<String, int>> == год и месяц / map {'дата события' : {'total' : 'всего событий','free' : 'свободных событий',}}
  Map<String, Map<String, Map<String, int>>> marksCountForMonth = {};

  Future<void> getMonthlyCalendarMarksForMouth({
    required DateTime dateMarksMouth,
    required String specialistId,
    bool isUpdate = false,
  }) async {
    //делаю запрос к серверу если нет в списке marksCountForMonth этого события
    String _formatData = '${dateMarksMouth.year}-${dateMarksMouth.month}';

    Map<String, Map<String, int>?>? _marksForMonth =
        marksCountForMonth[_formatData];

    if ((_marksForMonth == null || isUpdate) &&
        ImplementAuthController.instance.userAuthorizedData?.accessToken !=
            null) {
      marksCountForMonth[_formatData] =
          await _services.getMonthlyCalendarMarksData(
        accessToken:
            ImplementAuthController.instance.userAuthorizedData!.accessToken,
        dateMark: dateMarksMouth,
        specialistId: specialistId,
      );
      print(
          "marksCountForMonth from getMonthlyCalendarMarksForMouth $marksCountForMonth");
      update();
    }
  }

  ///получение событий выбранной даты +
  //  чтобы сохранять в текущей сессии и не тянyть из базы если есть в мапе Map<String, DailyCalendarEventsModel> == год и месяц / DailyCalendarEventsModel
  Map<String, List<DailyCalendarEventsModel?>> eventsForDay = {};

// Future<List<DailyCalendarEventsModel?>> getDailyCalendarEvents(
//     {required DateTime dateDaily, bool isUpdate = false}) async {
//   String _formatData =
//       "${dateDaily.year}-${dateDaily.month}-${dateDaily.day}";
//
//   //проверяю есть ли марка на этот день
//   bool isMarkForDay =
//       (marksCountForMonth['${dateDaily.year}-${dateDaily.month}']
//               ?[_formatData] !=
//           null);
//
//   if (isMarkForDay) {
//     ///проверяю есть ли такой лист eventsForDay в контроллере
//
//     if ((eventsForDay[_formatData] == null &&
//             ImplementAuthController.instance.userAuthorizedData != null) ||
//         isUpdate) {
//       List<DailyCalendarEventsModel?> _res =
//           await HomePageData().getDailyCalendarEventsData(
//         accessToken:
//             ImplementAuthController.instance.userAuthorizedData!.accessToken,
//         dateDaily: dateDaily,
//       );
//       eventsForDay[_formatData] = _res;
//       update();
//       return _res;
//     } else {
//       return eventsForDay[_formatData]!;
//     }
//   } else {
//     return [];
//   }
// }
}
