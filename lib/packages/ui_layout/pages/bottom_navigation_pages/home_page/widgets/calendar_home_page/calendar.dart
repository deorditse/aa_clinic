import 'dart:convert';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/widgets/calendar_home_page/calendar_header.dart';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;

import '../../../../../widgets_for_all_pages/utils_calendars.dart';

class CalendarHomePage extends StatefulWidget {
  CalendarHomePage({Key? key}) : super(key: key);

  @override
  State<CalendarHomePage> createState() => _CalendarHomePageState();
}

class _CalendarHomePageState extends State<CalendarHomePage> {
  //_focusedDay для отслеживания месяца для _pageController
  final Rx<DateTime> _focusedDay = DateTime.now().obs;

  late final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () {
            return CalendarHeaderChatPage(
              key: widget.key,
              clearButtonVisible: false,
              onTodayButtonTap: () {
                _focusedDay.value = DateTime.now();

                HomePageCalendarControllerGetxState.instance
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
        GetBuilder<HomePageCalendarControllerGetxState>(
          builder: (controllerCalendar) {
            //HomePageCalendarControllerGetxState.instance.getFetchData();
            return Obx(
              () => TableCalendar(
                key: Key('HomePageCalendar'),
                availableGestures: AvailableGestures.horizontalSwipe,
                eventLoader: (controllerCalendar.marksCountForMonth[
                            "${_focusedDay.value.year}-${_focusedDay.value.month}"] !=
                        null)
                    ? (day) {
                        final Map<String, int>? _dateMark = controllerCalendar
                                .marksCountForMonth[
                            "${_focusedDay.value.year}-${_focusedDay.value.month}"];

                        if (_dateMark?["${day.year}-${day.month}-${day.day}"] !=
                            null) {
                          return [
                            _dateMark!["${day.year}-${day.month}-${day.day}"]
                          ];
                        } else {
                          return [];
                        }
                      }
                    : null,
                daysOfWeekHeight: 36,
                rowHeight: 50,
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarBuilders: CalendarBuilders(
                  //стиль для маркеров
                  markerBuilder: (BuildContext context, date, events) {
                    if (events.isEmpty) return const SizedBox();
                    return Container(
                      margin: const EdgeInsets.only(bottom: 41),
                      width: 12,
                      decoration: date
                              .toUtc()
                              .isAfter(DateTime.now().add(Duration(days: -1)))
                          ? const BoxDecoration(
                              shape: BoxShape.circle,
                              color: myColorIsActive,
                            )
                          : BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  Theme.of(context).textTheme.headline3!.color!,
                              // .withOpacity(0.4),
                            ),
                    );
                  },
                  //сегодняшний день
                  todayBuilder: (BuildContext context, DateTime day,
                      DateTime focusedDay) {
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
                      (BuildContext context, DateTime day,
                          DateTime focusedDay) {
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
                  disabledBuilder: (BuildContext context, DateTime day,
                      DateTime focusedDay) {
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
                      (BuildContext context, DateTime day,
                          DateTime focusedDay) {
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
                focusedDay: _focusedDay.value,
                headerVisible: false,
                selectedDayPredicate: (day) =>
                    isSameDay(controllerCalendar.mySelectedDay, day),
                calendarFormat: CalendarFormat.month,
                holidayPredicate: (day) {
                  return day == controllerCalendar.mySelectedDay;
                },
                onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                  if (!isSameDay(
                      controllerCalendar.mySelectedDay, selectedDay)) {
                    controllerCalendar.changeMySelectedDay(
                        newDateTime: selectedDay);
                    controllerCalendar.getDailyCalendarEvents(
                        dateDaily: selectedDay);
                  }
                },
                onCalendarCreated: (controller) {
                  _pageController = controller;
                },
                onPageChanged: (focusedDay) {
                  _focusedDay.value = focusedDay;
                  print(
                      'HomePageCalendarControllerGetxState  _focusedDay $focusedDay _______________ ${_focusedDay.value.toUtc()}');
                  controllerCalendar.getMonthlyCalendarMarksForMouth(
                    dateMarksMouth: focusedDay,
                  );
                },
              ),
            );
          },
        ),
        SizedBox(
          height: myHorizontalPaddingForContainer / 2,
        ),
      ],
    );
  }
}
