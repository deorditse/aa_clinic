import 'dart:collection';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/widgets/calendar_home_page/calendar/utils_calendar_home_page.dart';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'calendar_header.dart';

class CalendarChatPage extends StatelessWidget {
  CalendarChatPage({Key? key}) : super(key: key);

  //_focusedDay для отслеживания месяца для _pageController
  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());
  DateTime? _rangeStart;

  DateTime? _rangeEnd;

  late final PageController _pageController;

  @override
  void dispose() {
    _focusedDay.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder<DateTime>(
          valueListenable: _focusedDay,
          builder: (context, value, _) {
            return CalendarHeaderChatPage(
              key: key,
              clearButtonVisible: false,
              onTodayButtonTap: () {
                ChatPageControllerGetx.instance
                    .changeMySelectedDay(
                  newDateTime: DateTime.now(),
                );
              },
              onClearButtonTap: () {},
              onLeftArrowTap: () {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              },
              onRightArrowTap: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              },
              focusedDay: _focusedDay.value,
            );
          },
        ),
        mySizedHeightBetweenContainer,
        GetBuilder<ChatPageControllerGetx>(
          builder: (controllerCalendar) {
            return TableCalendar(
              key: Key('HomePageCalendar'),
              availableGestures: AvailableGestures.horizontalSwipe,
              // eventLoader: controllerCalendar.getEventsForDay,
              // eventLoader: (day) {
              //   return null;
              // //при выбранном дне можно сделать событие
              // },
              daysOfWeekHeight: 36,
              rowHeight: 50,
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarBuilders: CalendarBuilders(
                //стиль для маркеров
                markerBuilder: (BuildContext context, date, events) {
                  if (events.isEmpty) return SizedBox();
                  return Container(
                    margin: EdgeInsets.only(bottom: 41),
                    width: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: myColorIsActive,
                    ),
                  );
                },
                //сегодняшний день
                todayBuilder:
                    (BuildContext context, DateTime day, DateTime focusedDay) {
                  return Center(
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: myColorIsActive,
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.transparent,
                        child: Text(
                          DateFormat.d().format(day),
                          style: myTextStyleFontUbuntu(context: context),
                        ),
                      ),
                    ),
                  );
                },
                selectedBuilder: //для выбранных ячеек
                    (BuildContext context, DateTime day, DateTime focusedDay) {
                  return Center(
                    child: CircleAvatar(
                      backgroundColor: myColorIsActive,
                      radius: 15,
                      child: Text(
                        DateFormat.d().format(day),
                        style: myTextStyleFontUbuntu(
                            textColor: Color.fromRGBO(46, 46, 46, 1),
                            //Theme.of(context).textTheme.headline1!.color,
                            context: context),
                      ),
                    ),
                  );
                },
                disabledBuilder:
                    (BuildContext context, DateTime day, DateTime focusedDay) {
                  return Center(
                    child: CircleAvatar(
                      // key: ValueKey(widget.key),
                      backgroundColor: Colors.transparent,
                      child: Text(
                        DateFormat.d().format(day),
                        style: myTextStyleFontUbuntu(
                            textColor: Colors.transparent, context: context
                            //   textColor:
                            ),
                      ),
                    ),
                  );
                },
                defaultBuilder: // Для невыбранных ячеек
                    (BuildContext context, DateTime day, DateTime focusedDay) {
                  return Center(
                    child: CircleAvatar(
                      // key: ValueKey(widget.key),
                      backgroundColor: Colors.transparent,
                      child: Text(
                        DateFormat.d().format(day),
                        style: myTextStyleFontUbuntu(context: context),
                      ),
                    ),
                  );
                },

                outsideBuilder: (context, day, focusedDay) {
                  return Center(
                    child: Text(
                      '${day.day}',
                      style: myTextStyleFontUbuntu(
                          textColor:
                              Theme.of(context).textTheme.headline3!.color,
                          context: context),
                    ),
                  );
                },
                dowBuilder: (context, day) {
                  final text = DateFormat.E().format(day);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (day.weekday == DateTime.sunday ||
                            day.weekday == DateTime.saturday)
                          Center(
                            child: Text(
                              text,
                              overflow: TextOverflow.visible,
                              style: myTextStyleFontUbuntu(
                                  textColor: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .color,
                                  newFontWeight: FontWeight.w300,
                                  context: context),
                            ),
                          )
                        else
                          Center(
                            child: Text(
                              text,
                              overflow: TextOverflow.visible,
                              style: myTextStyleFontUbuntu(
                                  textColor: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .color,
                                  newFontWeight: FontWeight.w300,
                                  context: context),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
              firstDay: kFirstDay,
              lastDay: kLastDay,
              focusedDay: controllerCalendar.mySelectedDay,
              headerVisible: false,
              selectedDayPredicate: (day) =>
                  isSameDay(controllerCalendar.mySelectedDay, day),
              rangeStartDay: _rangeStart,
              rangeEndDay: _rangeEnd,
              calendarFormat: CalendarFormat.month,
              holidayPredicate: (day) {
                return day == controllerCalendar.mySelectedDay;
              },
              onDaySelected: _onDaySelectedTap,
              onDayLongPressed: _onDaySelectedLongTap,
              onCalendarCreated: (controller) => _pageController = controller,
              onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
            );
          },
        ),
      ],
    );
  }

  void _onDaySelectedTap(DateTime selectedDay, DateTime focusedDay) {
    final controllerCalendar = ChatPageControllerGetx.instance;
    _focusedDay.value = focusedDay;
    if (!isSameDay(controllerCalendar.mySelectedDay, selectedDay)) {
      controllerCalendar.changeMySelectedDay(newDateTime: selectedDay);
      print(selectedDay);
    }
  }

  void _onDaySelectedLongTap(DateTime selectedDay, DateTime focusedDay) {}
}
