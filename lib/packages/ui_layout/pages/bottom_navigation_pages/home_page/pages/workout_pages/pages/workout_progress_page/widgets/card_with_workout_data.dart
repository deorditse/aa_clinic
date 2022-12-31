import 'package:business_layout/business_layout.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'row_with_timer.dart';

class CardWithWorkoutData extends StatelessWidget {
  CardWithWorkoutData({
    Key? key,
    required this.indexExercises,
    required this.targetIdWorkout,
  }) : super(key: key);
  final int indexExercises;
  final String targetIdWorkout;

  final Rx<bool> isComment = false.obs;
  final TextEditingController _controllerComment = TextEditingController();
  RxList<String> listValueWorkout = [""].obs;
  Rx<String> _messageError = "".obs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImplementWorkoutControllerHomePage>(
      builder: (controllerWorkout) {
        ApproachObjectsConsisting? approachObjectsConsisting =
            controllerWorkout.listOfMissedWorkouts.isNotEmpty
                ? controllerWorkout.listOfMissedWorkouts.first
                : null;

        listValueWorkout.value = List.generate(
            approachObjectsConsisting?.target.length ?? 0, (index) => '');

        return approachObjectsConsisting != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  mySizedHeightBetweenContainer,
                  RowWithTimer(
                    title: 'Таймер отдыха',
                    newColor: Color.fromRGBO(14, 214, 166, 1),
                    timerSecondsValue:
                        ((approachObjectsConsisting?.restTime == null) ||
                                (approachObjectsConsisting!.restTime == 0))
                            ? 30
                            : approachObjectsConsisting.restTime!,
                  ),
                  mySizedHeightBetweenContainer,
                  Container(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            primary: true,
                            padding: EdgeInsets.zero,
                            itemCount: approachObjectsConsisting.target.length,
                            itemBuilder: (context, index) {
                              final Map<String,
                                      TargetObjectsDescriptionApproachObjectsConsisting?>
                                  _target = approachObjectsConsisting.target;
                              return Padding(
                                padding: const EdgeInsets.only(
                                  right: myTopPaddingForContent,
                                ),
                                child: _rowWithRecCount(
                                  indexHorizontalList: index,
                                  containerText: _target
                                      .values.first!.title!.capitalizeFirst!,
                                  title:
                                      'Рек: ${_target.values.first!.value} ${_target.values.first!.units}',
                                  context: context,
                                  targetIdWorkout: targetIdWorkout,
                                  indexExercises: indexExercises,
                                  indexWorkoutValue: index,
                                ),
                              );
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (listValueWorkout.isEmpty) {
                              _messageError.value =
                                  "Заполнимте показатели тренировки";
                              return;
                            } else {
                              _messageError.value = '';
                              listValueWorkout.forEach(
                                (element) {
                                  if (element == "") {
                                    _messageError.value =
                                        "*не все поля заполнены";
                                    return;
                                  }
                                },
                              );
                              if (_messageError.value == "") {
                                //меняю данные тренировки

                                await controllerWorkout
                                    .changeMapTargetIdAndWorkoutsWithId(
                                  targetIdWorkout: targetIdWorkout,
                                  indexExercises: indexExercises,
                                  listValueWorkout: listValueWorkout,
                                  comment: _controllerComment.text,
                                )
                                    .whenComplete(
                                  () async {
                                    _controllerComment.text = "";
                                    listValueWorkout.value = List.generate(
                                        approachObjectsConsisting.target.length,
                                        (index) => '');
                                    // await putFitnessWorkoutWithIdData(
                                    //   accessToken: ImplementAuthController
                                    //       .instance
                                    //       .userAuthorizedData!
                                    //       .accessToken,
                                    //   fitnessWorkout: controllerWorkout
                                    //           .mapTargetIdAndWorkoutsWithId[
                                    //       targetIdWorkout]!,
                                    // );
                                  },
                                );
                              }
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: myTopPaddingForContent),
                            child: SvgPicture.asset(
                              Get.isDarkMode
                                  ? 'assets/icons/menu_icons_otherPage/add-circle.svg'
                                  : 'assets/icons/for_light_theme/add-circle_light.svg',
                              semanticsLabel: 'addNewEvent',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => Column(
                      children: [
                        if (_messageError.value != "")
                          SizedBox(
                            child: Text(
                              _messageError.value,
                              style: myTextStyleFontUbuntu(
                                context: context,
                                textColor: Colors.red,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  _textFieldComment(context: context),
                ],
              )
            : Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: myTopPaddingForContent),
                  child: Text(
                    "Все подходы выполнены",
                    style: myTextStyleFontUbuntu(context: context),
                  ),
                ),
              );
      },
    );
  }

  _textFieldComment({required BuildContext context}) {
    return Obx(
      () => isComment.value
          ? Container(
              padding: EdgeInsets.only(top: myTopPaddingForContent),
              width: Get.width * 0.53,
              child: TextField(
                autofocus: true,
                controller: _controllerComment,
                cursorColor: myColorIsActive,
                decoration:
                    myStyleTextField(context, hintText: 'Комментарий...'),
                style: myTextStyleFontUbuntu(context: context),
                onSubmitted: (value) {},
                onChanged: (query) {},
              ),
            )
          : TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  EdgeInsets.zero,
                ),
              ),
              onPressed: () {
                isComment.value = !isComment.value;
              },
              child: Text(
                'Добавить комментарий...',
                style: myTextStyleFontUbuntu(
                    textColor: myColorIsActive.withOpacity(0.5),
                    context: context),
              ),
            ),
    );
  }

  _rowWithRecCount({
    required int indexHorizontalList,
    required String containerText,
    required String title,
    required String targetIdWorkout,
    required int indexExercises,
    required int indexWorkoutValue,
    required BuildContext context,
  }) {
    return Row(
      children: [
        IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                style: myTextStyleFontUbuntu(
                    textColor: Theme.of(context).textTheme.headline3!.color,
                    context: context),
              ),
              const SizedBox(
                height: 4,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (workoutValue) {
                  _messageError.value = '';
                  listValueWorkout[indexHorizontalList] = workoutValue;
                },
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.singleLineFormatter,
                ],
                decoration: myStyleTextField(
                  context,
                  hintText: containerText,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
