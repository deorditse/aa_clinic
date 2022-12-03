import 'dart:convert';

import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/add_new_dish_page/add_new_dish_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/add_new_dish_page/pages/adding_a_dish_page/adding_a_dish_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/default_page_if_not_find_page/default_task_for_day_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/doctors_appointment_pages/doctors_appointment_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/food_pages/food_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/workout_pages/workout_page.dart';
import 'package:model/model.dart';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/widgets/task_for_the_day/row_with_task.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'notifications/disable_notifications.dart';

_goToPage({
  required String? actionsPageType,
  required BuildContext context,
  required String targetId,
  required String title,
}) {
  switch (actionsPageType) {
    case 'appointment':
      print('Встреча');
      DoctorsAppointmentPage.openDoctorsAppointmentPage(
          context: context, title: title, targetId: targetId);
      //при переходе делаю запрос на получение данных события Встреча
      HomePageCalendarControllerGetxState.instance
          .getAppointmentsWithId(targetId: targetId);
      break;
    case 'workout':
      print('Тренировка');
      WorkoutPageFromHomePage.openWorkoutPageFromHomePage(
          context: context, title: title, targetId: targetId);
      //при переходе делаю запрос на получение данных события Тренировка
      HomePageCalendarControllerGetxState.instance
          .getFitnessWorkoutsWithId(targetId: targetId);
      break;
    case 'meal':
      print('Еда');
      FoodPage.openFoodPage(context: context, title: title, targetId: targetId);
      //при переходе делаю запрос на получение данных события Еда
      HomePageCalendarControllerGetxState.instance
          .getNutriMealsWithId(targetId: targetId);
      break;
    case 'action':
      print('Страница по умолчанию');

      DefaultTaskForDayPage.openDefaultTaskForDayPage(
        context: context,
        title: title,
        targetId: targetId,
      );
      //при переходе делаю запрос на получение данных дефолтного события
      HomePageCalendarControllerGetxState.instance
          .getCalendarActionsWithId(targetId: targetId);
      break;

    default:
      print('Страница по умолчанию');
      DefaultTaskForDayPage.openDefaultTaskForDayPage(
          context: context, title: title, targetId: targetId);
      break;
  }
}

class TaskForTheDay extends StatelessWidget {
  TaskForTheDay({Key? key}) : super(key: key);

  final int _barrierItemCount = 9;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: myStyleContainer(context: context),
      child: Padding(
        padding: const EdgeInsets.all(myTopPaddingForContent),
        child: GetBuilder<HomePageCalendarControllerGetxState>(
          builder: (controllerCalendar) {
            final DateTime _mySelectedDay = controllerCalendar.mySelectedDay;

            bool isDailyTask = controllerCalendar.eventsForDay[
                    "${_mySelectedDay.year}-${_mySelectedDay.month}-${_mySelectedDay.day}"] !=
                null;

            List<DailyCalendarEventsModel?> _dailyTaskSheet = isDailyTask
                ? controllerCalendar.eventsForDay[
                    "${_mySelectedDay.year}-${_mySelectedDay.month}-${_mySelectedDay.day}"]!
                : [];

            int itemCountLength = _dailyTaskSheet.length;

            Rx<int> _itemCountAll = ((itemCountLength < _barrierItemCount)
                    ? itemCountLength
                    : _barrierItemCount)
                .obs;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _rowDayAndButton(context: context),
                mySizedHeightBetweenContainer,
                Container(
                  constraints: BoxConstraints(
                    minHeight: Get.height / 14,
                  ),
                  child: _itemCountAll.value == 0
                      ? Center(
                          child: Text(
                            'Нет задач на день',
                            style: myTextStyleFontUbuntu(
                              newFontWeight: FontWeight.w300,
                              textColor:
                                  Theme.of(context).textTheme.headline3!.color,
                              fontSize: 20,
                              context: context,
                            ),
                          ),
                        )
                      : Obx(
                          () => ListView.builder(
                            shrinkWrap: true,
                            //для динамического изменения высоты
                            padding: EdgeInsets.zero,
                            primary: false,
                            itemCount: _itemCountAll.value,
                            itemBuilder: (context, index) {
                              DailyCalendarEventsModel? _dayTask =
                                  _dailyTaskSheet[index];
                              return TextButton(
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.zero)),
                                onPressed: () {
                                  if (_dayTask != null) {
                                    _goToPage(
                                      context: context,
                                      title: _dayTask.title,
                                      actionsPageType: _dayTask.type,
                                      targetId: _dayTask.targetId,
                                    );
                                  }
                                },
                                child: RowWithTask(
                                  index: index,
                                  dailySheet: _dailyTaskSheet[index]!,
                                ),
                              );
                            },
                          ),
                        ),
                ),
                if (itemCountLength > _barrierItemCount)
                  Padding(
                    padding: const EdgeInsets.only(top: myTopPaddingForContent),
                    child: GestureDetector(
                      onTap: () {
                        _itemCountAll.value == itemCountLength
                            ? _itemCountAll.value = _barrierItemCount
                            : _itemCountAll.value = itemCountLength;
                      },
                      child: Obx(
                        () => Text(
                          _itemCountAll.value == itemCountLength
                              ? 'Смотреть меньше...'
                              : 'Смотреть больше...',
                          style: myTextStyleFontUbuntu(
                              newFontWeight: FontWeight.w300,
                              textColor:
                                  Theme.of(context).textTheme.headline3!.color,
                              context: context),
                        ),
                      ),
                    ),
                  ),
                mySizedHeightBetweenContainer,
                SizedBox(
                  height: myTopPaddingForContent,
                ),
                Notifications(),
              ],
            );
          },
          //   );
          // },
        ),
      ),
    );
  }

  _rowDayAndButton({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GetBuilder<HomePageCalendarControllerGetxState>(
          builder: (controllerCalendar) {
            return Text(
              '${DateFormat('EEEE').format(controllerCalendar.mySelectedDay).capitalize}, ${DateFormat('d MMMM').format(controllerCalendar.mySelectedDay)}',
              style: myTextStyleFontUbuntu(
                  fontSize: 18,
                  newFontWeight: FontWeight.w400,
                  context: context),
            );
          },
        ),
        GestureDetector(
          onTap: () {
            if (DateFormat.yMd().format(DateTime.now()) ==
                DateFormat.yMd().format(HomePageCalendarControllerGetxState
                    .instance.mySelectedDay)) {
              AddNewDishHomePage.addNewDishHomePage(context: context);
            } else {
              Get.snackbar(
                '',
                'Можно добавить событие только на сегодняшний день',
                snackPosition: SnackPosition.TOP,
              );
            }
          },
          child: SvgPicture.asset(
            Get.isDarkMode
                ? 'assets/icons/menu_icons_otherPage/add-circle.svg'
                : 'assets/icons/for_light_theme/add-circle_light.svg',
            semanticsLabel: 'addNewEvent',
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
