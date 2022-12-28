import 'package:business_layout/business_layout.dart';
import 'package:get/get.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:model/model.dart';

List listHistory = [];

class ListWithHistory extends StatelessWidget {
  const ListWithHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImplementWorkoutControllerHomePage>(
      builder: (controllerWorkout) {
        return controllerWorkout.listOfCompletedWorkouts.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: controllerWorkout.listOfCompletedWorkouts.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final ApproachObjectsConsisting _commentData =
                      controllerWorkout.listOfCompletedWorkouts[index]!;
                  return SizedBox(
                    height: 30,
                    child: rowWithHistory(
                      context: context,
                      commentData: _commentData,
                    ),
                  );
                },
              )
            : Text(
                "Нет выполненных подходов",
                style: myTextStyleFontUbuntu(
                    context: context,
                    textColor: Theme.of(context).textTheme.headline3!.color!),
              );
      },
    );
  }

  Widget rowWithHistory({
    required BuildContext context,
    required ApproachObjectsConsisting commentData,
  }) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '${commentData.real.values.map((workout) => "${workout.value} ${workout.units} ").single}',
            style: myTextStyleFontUbuntu(
              fontSize: 14,
              context: context,
              newFontWeight: FontWeight.w300,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 9,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: myTopPaddingForContent),
              child: Text(
                '${commentData.comment ?? "комментарий не добавлен"}',
                style: myTextStyleFontUbuntu(
                  fontSize: 14,
                  textColor: Theme.of(context).textTheme.headline3!.color,
                  context: context,
                  newFontWeight: FontWeight.w300,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        Text(
          commentData.finishedAt != null
              ? "${DateFormat.Hm().format(DateTime.parse(commentData.finishedAt!))}"
              : '00:00',
          style: myTextStyleFontUbuntu(
            fontSize: 14,
            context: context,
            newFontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
