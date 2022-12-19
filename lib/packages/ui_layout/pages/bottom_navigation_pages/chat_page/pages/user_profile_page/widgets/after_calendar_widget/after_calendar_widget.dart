import 'package:intl/intl.dart';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'grid_choose_time_to_record/grid_choose_time_to_record.dart';

class AfterCalendarWidget extends StatelessWidget {
  const AfterCalendarWidget({Key? key, required this.specialistId})
      : super(key: key);
  final String specialistId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: myTopPaddingForContent,
        right: myTopPaddingForContent,
        bottom: myTopPaddingForContent,
      ),
      child: GetBuilder<ImplementationCalendarEventsChatPage>(
        builder: (controllerChatCalendar) {
          final DateTime _mySelectedDay = controllerChatCalendar.mySelectedDay;

          bool isDailyTask = controllerChatCalendar.eventsForDay[
                  "${_mySelectedDay.year}-${_mySelectedDay.month}-${_mySelectedDay.day}"] !=
              null;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<HomePageCalendarControllerGetxState>(
                builder: (controllerCalendar) {
                  return Text(
                    'Записаться на  ${DateFormat('d MMMM').format(controllerChatCalendar.mySelectedDay)}, ${DateFormat('EEEE').format(controllerChatCalendar.mySelectedDay).toLowerCase()}:',
                    style: myTextStyleFontUbuntu(
                        fontSize: 17,
                        newFontWeight: FontWeight.w400,
                        context: context),
                  );
                },
              ),
              isDailyTask
                  ? GridChooseTimeToRecord(specialistId: specialistId)
                  : Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: mySizedHeightBetweenContainer.height! * 2),
                        child: Text(
                          "Нет доступных окон для записи",
                          style: myTextStyleFontUbuntu(
                            newFontWeight: FontWeight.w300,
                            textColor:
                                Theme.of(context).textTheme.headline3!.color,
                            fontSize: 20,
                            context: context,
                          ),
                        ),
                      ),
                    ),
              mySizedHeightBetweenContainer,
            ],
          );
        },
      ),
    );
  }
}
