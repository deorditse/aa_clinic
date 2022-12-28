import 'package:intl/intl.dart';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/main_login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

import 'text_fieeld_and_button.dart';

class GridChooseTimeToRecord extends StatelessWidget {
  const GridChooseTimeToRecord({Key? key, required this.specialistId})
      : super(key: key);
  final String specialistId;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImplementationCalendarEventsChatPage>(
      builder: (controllerChatCalendar) {
        final DateTime _mySelectedDay = controllerChatCalendar.mySelectedDay;

        List<DailyReceptionScheduleEventModel?> _dailyTaskSheet =
            controllerChatCalendar.eventsForDay[
                "${_mySelectedDay.year}-${_mySelectedDay.month}-${_mySelectedDay.day}"]!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mySizedHeightBetweenContainer,
            Text(
              'Выберите время для записи',
              style: myTextStyleFontUbuntu(
                  context: context,
                  fontSize: 17,
                  textColor: Theme.of(context).textTheme.headline3!.color!,
                  newFontWeight: FontWeight.w400),
            ),
            mySizedHeightBetweenContainer,
            GridView.builder(
              primary: false,
              shrinkWrap: true,
              //чтобы растягиваля под значения

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: myHorizontalPaddingForContainer,
                crossAxisSpacing: myHorizontalPaddingForContainer,
                childAspectRatio: 0.8,
                mainAxisExtent: 30,
              ),
              itemCount: _dailyTaskSheet.length,

              itemBuilder: (BuildContext context, int index) {
                return _timeWidget(
                  context: context,
                  dailyReceptionScheduleEvent: _dailyTaskSheet[index]!,
                  startedAtTime: controllerChatCalendar.appointmentStartTime,
                  scheduleId: _dailyTaskSheet[index]!.id,
                );
              },
            ),
            if (controllerChatCalendar.appointmentStartTime != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  mySizedHeightBetweenContainer,
                  Text(
                    'Выбранное время: ${DateFormat.Hm().format(controllerChatCalendar.appointmentStartTime!)}- ${DateFormat.Hm().format(controllerChatCalendar.appointmentEndTime!)}',
                    style: myTextStyleFontUbuntu(
                        context: context,
                        fontSize: 17,
                        textColor:
                            Theme.of(context).textTheme.headline3!.color!,
                        newFontWeight: FontWeight.w400),
                  ),
                  TextFieldAndButton(specialistId: specialistId),
                ],
              ),
          ],
        );
      },
    );
  }
}

_timeWidget({
  required BuildContext context,
  required DateTime? startedAtTime,
  required String scheduleId,
  required DailyReceptionScheduleEventModel dailyReceptionScheduleEvent,
}) {
  bool isAfterDate = DateTime.parse(dailyReceptionScheduleEvent.startedAt!)
      .toUtc()
      .isAfter(DateTime.now());
  return ElevatedButton(
    style: ButtonStyle().copyWith(
      backgroundColor: MaterialStateProperty.all(
        (isAfterDate && dailyReceptionScheduleEvent.patientId == null)
            ? startedAtTime != null &&
                    startedAtTime ==
                        DateTime.parse(dailyReceptionScheduleEvent.startedAt!)
                ? myColorIsActive.withOpacity(0.6)
                : myColorIsActive
            : Theme.of(context).backgroundColor.withOpacity(1),
      ),
      padding: MaterialStatePropertyAll(EdgeInsets.all(2)),
    ),
    onPressed: () {
      if (isAfterDate) {
        if (dailyReceptionScheduleEvent.patientId == null) {
          ImplementationCalendarEventsChatPage.instance
              .changeAppointmentTimeForSpecialist(
            startTime: DateTime.parse(dailyReceptionScheduleEvent.startedAt!),
            endTime: DateTime.parse(dailyReceptionScheduleEvent.finishedAt!),
            newScheduleId: scheduleId,
          );
        } else {
          ImplementationCalendarEventsChatPage.instance
              .changeAppointmentTimeForSpecialist(
            startTime: null,
            endTime: null,
            newScheduleId: null,
          );
        }
      } else {
        Get.snackbar("", "Запись доступна только от сегоднящнего дня");
      }
    },
    child: Text(
      "${DateFormat.Hm().format(DateTime.parse(dailyReceptionScheduleEvent.startedAt!))}",

      // "${DateFormat.Hm().format(DateTime.parse(dailyReceptionScheduleEvent.startedAt!))}-${DateFormat.Hm().format(DateTime.parse(dailyReceptionScheduleEvent.finishedAt!))}",
      style: myTextStyleFontUbuntu(
        textColor: (dailyReceptionScheduleEvent.patientId == null) &&
                isAfterDate
            ? Colors.white
            : Theme.of(context).textTheme.headline3!.color!.withOpacity(0.3),
        context: context,
        fontSize: 17,
      ),
    ),
  );
}
