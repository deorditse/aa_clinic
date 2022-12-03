import 'dart:convert';
import 'dart:io';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/container_for_photo.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:model/model.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/my_shimmer_effect_container.dart';
import 'package:business_layout/business_layout.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RowWithPhotoAndDataProfile extends StatelessWidget {
  const RowWithPhotoAndDataProfile({Key? key, required this.dataFitnessWorkout})
      : super(key: key);
  final AppointmentsModel? dataFitnessWorkout;

  @override
  Widget build(BuildContext context) {
    return (dataFitnessWorkout != null)
        ? _ifDetectedDataUser(
            context: context,
            dataFitnessWorkout: dataFitnessWorkout!,
          )
        : _ifNotDetected(context: context);
  }

  DateTime? _getYbDate({required String? bDate}) {
    return bDate != null
        ? DateTime.parse(dataFitnessWorkout!.specialist!.bdate!)
        : null;
  }

  _ifDetectedDataUser({
    required BuildContext context,
    // required UserMinifiedDataIdModel userMinifiedDataId,
    required AppointmentsModel dataFitnessWorkout,
  }) {
    DateTime? yBdate = _getYbDate(bDate: dataFitnessWorkout.specialist?.bdate);

    String? _getInitialValuebBdate() {
      if (dataFitnessWorkout.specialist?.bdate != null) {
        final _res = DateTime.parse(dataFitnessWorkout.specialist!.bdate!);
        return '${_res.day}.${_res.month}.${_res.year}';
      }
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: dataFitnessWorkout.specialist?.avatar != null
              ? FittedBox(
                  child: CircleAvatar(
                    child: Container(
                      decoration: myStyleContainer(context: context),
                      clipBehavior: Clip.hardEdge,
                      height: double.maxFinite,
                      width: double.maxFinite,
                      child: containerForPhotoFuture(
                        coverFileId: dataFitnessWorkout.specialist!.avatar!,
                        openView: true,
                      ),
                    ),
                  ),
                )
              : FittedBox(
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).backgroundColor,
                    child: Container(),
                  ),
                ),
        ),
        Expanded(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: myHorizontalPaddingForContainer),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text(
                    "${dataFitnessWorkout.specialist?.lastName?.capitalizeFirst ?? ''} ${dataFitnessWorkout.specialist?.firstName?.capitalizeFirst ?? ''} ${dataFitnessWorkout.specialist?.middleName?.capitalizeFirst ?? ''}",
                    style: myTextStyleFontUbuntu(
                      context: context,
                      newFontWeight: FontWeight.w500,
                    ),
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
                mySizedHeightBetweenContainer,
                Text(
                  "${dataFitnessWorkout.specialist?.firstName != null ? 'Професссия API' : 'Специалист'}",
                  style: myTextStyleFontUbuntu(
                      textColor: Theme.of(context).textTheme.headline3!.color,
                      context: context),
                ),
                mySizedHeightBetweenContainer,
                Text(
                  // '12.12.1975 (47 лет)',
                  "${_getInitialValuebBdate() ?? 'Дата рождения не указана'} ${yBdate != null ? '(${DateTime.now().year - int.parse(DateFormat('y').format(yBdate))} лет)' : ''}",
                  style: myTextStyleFontUbuntu(
                      textColor: Theme.of(context).textTheme.headline3!.color,
                      context: context),
                ),
                // mySizedHeightBetweenContainer,
                // Text(
                //   "1 (234) 567-89-10",
                //   style: myTextStyleFontUbuntu(
                //       textColor: Theme.of(context).textTheme.headline3!.color,
                //       context: context),
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _ifNotDetected({required BuildContext context}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: FittedBox(
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: myShimmerEffectContainer(
                context: context,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: myHorizontalPaddingForContainer),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                myShimmerEffectContainer(context: context, newHeight: 10),
                mySizedHeightBetweenContainer,
                myShimmerEffectContainer(context: context, newHeight: 10),
                mySizedHeightBetweenContainer,
                myShimmerEffectContainer(context: context, newHeight: 10),
                mySizedHeightBetweenContainer,
                myShimmerEffectContainer(context: context, newHeight: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
