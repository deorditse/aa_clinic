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

  initCalendarChatUserEvents({
    required String specialistId,
    DateTime? dateMarks,
    bool isUpdate = false,
  }) async {
    await getMonthlyCalendarMarksForMouth(
      specialistId: specialistId,
      isUpdate: isUpdate,
      dateMarksMouth: dateMarks ?? DateTime.now().toUtc(),
    ).whenComplete(
      () async {
        await getDailyCalendarEvents(
          isUpdate: isUpdate,
          specialistId: specialistId,
          dateDaily: dateMarks ?? DateTime.now().toUtc(),
        );
      },
    );
  }

  DateTime mySelectedDay = DateTime.now().toUtc();

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

      update();
    }
  }

  ///получение событий выбранной даты +
  //  чтобы сохранять в текущей сессии и не тянyть из базы если есть в мапе Map<String, DailyCalendarEventsModel> == год и месяц / DailyCalendarEventsModel
  Map<String, List<DailyReceptionScheduleEventModel?>> eventsForDay = {};

  Future<List<DailyReceptionScheduleEventModel?>> getDailyCalendarEvents(
      {required DateTime dateDaily,
      bool isUpdate = false,
      required String specialistId}) async {
    String _formatData =
        "${dateDaily.year}-${dateDaily.month}-${dateDaily.day}";

    //проверяю есть ли марка на этот день
    bool isMarkForDay =
        (marksCountForMonth['${dateDaily.year}-${dateDaily.month}']
                ?[_formatData] !=
            null);

    if (isMarkForDay) {
      ///проверяю есть марки на этот  день, чтобы не тратить ресурс на запрос

      if ((eventsForDay[_formatData] == null &&
              ImplementAuthController.instance.userAuthorizedData != null) ||
          isUpdate) {
        List<DailyReceptionScheduleEventModel?> _res =
            await _services.getDailyCalendarEventsData(
          accessToken:
              ImplementAuthController.instance.userAuthorizedData!.accessToken,
          dateDaily: dateDaily,
          specialistId: specialistId,
        );
        eventsForDay[_formatData] = _res;
        update();
        return _res;
      } else {
        return eventsForDay[_formatData]!;
      }
    } else {
      return [];
    }
  }

  //для записи к специалисту
  DateTime? appointmentStartTime;
  DateTime? appointmentEndTime;
  String? scheduleId;

  void changeAppointmentTimeForSpecialist(
      {required DateTime? startTime,
      required DateTime? endTime,
      required String? newScheduleId}) {
    appointmentStartTime = startTime;
    appointmentEndTime = endTime;
    scheduleId = newScheduleId;
    update();
  }

  ///Роут для записи на приём по расписанию +
  Future<void> putMakeAnAppointment({
    required String newScheduleId,
    required String specialistId,
    required String healthComplaint,
  }) async {
    await _services
        .putMakeAnAppointmentData(
      scheduleId: newScheduleId,
      specialistId: specialistId,
      healthComplaint: healthComplaint,
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
    )
        .whenComplete(
      () async {
        Get.snackbar("Вы успешно записаны на прием!", "");
        getDailyCalendarEvents(
                dateDaily: appointmentStartTime!,
                specialistId: specialistId,
                isUpdate: true)
            .whenComplete(
          () {
            appointmentStartTime = null;
            appointmentEndTime = null;
            scheduleId = null;
            update();
            changeMySelectedDay(newDateTime: DateTime.now().toUtc());
          },
        );
        HomePageCalendarControllerGetxState.instance.initializeHomePageData(
          dateMarksMouth: appointmentStartTime!,
          isUpdate: true,
        );
      },
    );
  }
}
