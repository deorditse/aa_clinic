import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/widgets/calendar_home_page/calendar/utils_calendar_home_page.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'calendar_header.dart';

class CalendarProfilePage extends StatefulWidget {
  const CalendarProfilePage({super.key});

  @override
  _CalendarProfilePageState createState() => _CalendarProfilePageState();
}

class _CalendarProfilePageState extends State<CalendarProfilePage> {
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOn; // Can be toggled on/off by longpressing a date
  late final ValueNotifier<DateTime> _focusedDay;

  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _focusedDay = ValueNotifier(DateTime.now());
    _rangeStart = DateTime.now();
    _rangeEnd = DateTime.now().add(const Duration(days: 6));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'Выбор даты:',
            style: myTextStyleFontUbuntu(
              context: context,
              newFontWeight: FontWeight.w400,
            ),
          ),
        ),
        mySizedHeightBetweenContainer,
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: _rowWithDataRange(dateTime: _rangeStart),
            ),
            if (_rangeEnd != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SizedBox(
                    width: 7,
                    child: Divider(
                      height: 2,
                      thickness: 1,
                      color: Theme.of(context).textTheme.headline1!.color,
                    )),
              ),
            if (_rangeEnd != null) _rowWithDataRange(dateTime: _rangeEnd),
          ],
        ),
        ValueListenableBuilder<DateTime>(
          valueListenable: _focusedDay,
          builder: (context, value, _) {
            return CalendarHeaderProfilePage(
              key: widget.key,
              clearButtonVisible: false,
              onTodayButtonTap: () {
                setState(() {
                  _focusedDay.value = DateTime.now();
                });
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
        TableCalendar(
          availableGestures: AvailableGestures.horizontalSwipe,
          onDayLongPressed: _onDaySelectedLongTap,
          // onCalendarCreated: (controller) => _pageController = controller,
          onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
          onCalendarCreated: (controller) => _pageController = controller,
          startingDayOfWeek: StartingDayOfWeek.monday,
          headerVisible: false,
          daysOfWeekHeight: 25,
          rowHeight: 45,
          firstDay: kFirstDay,
          lastDay: kLastDay,
          focusedDay: _focusedDay.value,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          rangeStartDay: _rangeStart,
          rangeEndDay: _rangeEnd,
          calendarFormat: CalendarFormat.month,
          rangeSelectionMode: _rangeSelectionMode,
          onDaySelected: _onDaySelectedTap,
          onRangeSelected: _onRangeSelected,
          calendarBuilders: CalendarBuilders(
            rangeHighlightBuilder:
                (BuildContext context, DateTime day, bool isWithinRange) =>
                    Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: isWithinRange
                      ? myColorIsActive.withOpacity(0.5)
                      : Colors.transparent,
                ),
              ),
            ),

            rangeStartBuilder:
                (BuildContext context, DateTime day, DateTime focusedDay) =>
                    Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 22,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
                Center(
                  child: CircleAvatar(
                    backgroundColor: myColorIsActive,
                    radius: 16,
                    child: Text(
                      DateFormat.d().format(day),
                      style: myTextStyleFontUbuntu(
                          context: context,
                          textColor:
                              Theme.of(context).textTheme.headline1!.color),
                    ),
                  ),
                )
              ],
            ),
            rangeEndBuilder:
                (BuildContext context, DateTime day, DateTime focusedDay) =>
                    Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 22,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
                Center(
                  child: CircleAvatar(
                    backgroundColor: myColorIsActive,
                    radius: 16,
                    child: Text(
                      DateFormat.d().format(day),
                      style: myTextStyleFontUbuntu(
                          context: context,
                          textColor:
                              Theme.of(context).textTheme.headline1!.color),
                    ),
                  ),
                )
              ],
            ),
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
            disabledBuilder:
                (BuildContext context, DateTime day, DateTime focusedDay) {
              return Center(
                child: CircleAvatar(
                  // key: ValueKey(widget.key),
                  backgroundColor: Colors.transparent,
                  child: Text(
                    DateFormat.d().format(day),
                    style: myTextStyleFontUbuntu(
                      context: context,
                      textColor: Colors.transparent,
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
                    style: myTextStyleFontUbuntu(
                      context: context,
                      textColor: Theme.of(context).textTheme.headline1!.color,
                    ),
                  ),
                ),
              );
            },

            outsideBuilder: (context, day, focusedDay) {
              return Center(
                child: Text(
                  '${day.day}',
                  style: myTextStyleFontUbuntu(
                      context: context,
                      textColor: Theme.of(context).textTheme.headline3!.color),
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
                            context: context,
                            textColor:
                                Theme.of(context).textTheme.headline3!.color,
                            newFontWeight: FontWeight.w300,
                          ),
                        ),
                      )
                    else
                      Center(
                        child: Text(
                          text,
                          overflow: TextOverflow.visible,
                          style: myTextStyleFontUbuntu(
                            context: context,
                            textColor:
                                Theme.of(context).textTheme.headline3!.color,
                            newFontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _onDaySelectedTap(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay.value = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });
    }
  }

  void _onDaySelectedLongTap(DateTime selectedDay, DateTime focusedDay) {}

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay.value = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });
  }

  _rowWithDataRange({required DateTime? dateTime}) {
    return Container(
      decoration: myStyleContainer(
          context: context, color: Theme.of(context).backgroundColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
        child: Text(
          dateTime != null ? '${DateFormat('d.M.yy').format(dateTime)}' : '',
          style: myTextStyleFontUbuntu(
            context: context,
            newFontWeight: FontWeight.w300,
            textColor: Theme.of(context).textTheme.headline2!.color,
          ),
        ),
      ),
    );
  }
}
