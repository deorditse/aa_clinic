import 'dart:convert';
import 'dart:io';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/button_alert_message.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/container_for_photo.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/material_sceleton_without_borders.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/sliver_sceleton_pages/sliver_sceleton_without_borders.dart';
import 'package:model/model.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/doctors_appointment_pages/video_chat_with_a_psychologist_page/video_agora_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/main_login_page.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/default_dialog_yes_no.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/my_shimmer_effect_container.dart';
import 'package:business_layout/business_layout.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'widgets/container_with_title_and_info_message.dart';
import 'widgets/row_with_photo_and_data_profile.dart';

class DoctorsAppointmentPage extends StatelessWidget {
  static const String id = '/doctorsAppointmentPage';

  const DoctorsAppointmentPage({Key? key, this.title, this.targetId})
      : super(key: key);
  final String? title;
  final String? targetId;

  static openDoctorsAppointmentPage({
    required context,
    required String title,
    required String targetId,
  }) =>
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: RouteSettings(name: DoctorsAppointmentPage.id),
        screen: DoctorsAppointmentPage(title: title, targetId: targetId),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );

  @override
  Widget build(BuildContext context) {
    final String titleDate = abbreviatedTitleDateAppBar(
        mySelectedDay:
            HomePageCalendarControllerGetxState.instance.mySelectedDay,
        isShort: true);
    return MyMaterialNewPageWithoutBorder(
      titleAppBar: '${titleDate}, $title',
      widgetBody: _BodyDoctorsAppointmentPage(targetId: targetId!),
    );
  }
}

class _BodyDoctorsAppointmentPage extends StatelessWidget {
  const _BodyDoctorsAppointmentPage({
    Key? key,
    required this.targetId,
  }) : super(key: key);
  final String targetId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GetBuilder<HomePageCalendarControllerGetxState>(
        builder: (controllerHome) {
          AppointmentsModel? dataAppointment =
              controllerHome.mapTargetIdAndAppointmentsWithId[targetId];

          return Column(
            children: [
              RowWithPhotoAndDataProfile(dataFitnessWorkout: dataAppointment),
              SizedBox(height: myHorizontalPaddingForContainer),
              Divider(
                indent: 1,
                thickness: 1,
                height: 1,
                color: Theme.of(context)
                    .textTheme
                    .headline1!
                    .color!
                    .withOpacity(0.5),
              ),
              Expanded(
                child: _BodyContentInfo(
                  dataFitnessWorkout: dataAppointment,
                  targetId: targetId,
                ),
              ),
              SizedBox(height: myHorizontalPaddingForContainer),
            ],
          );
        },
      ),
    );
  }
}

class _BodyContentInfo extends StatelessWidget {
  const _BodyContentInfo({
    Key? key,
    required this.dataFitnessWorkout,
    required this.targetId,
  }) : super(key: key);
  final String targetId;
  final AppointmentsModel? dataFitnessWorkout;

  @override
  Widget build(BuildContext context) {
    final String titleDate = abbreviatedTitleDateAppBar(
        mySelectedDay:
            HomePageCalendarControllerGetxState.instance.mySelectedDay);
    final bool isDataForPage = dataFitnessWorkout != null;
    return Column(
      children: [
        mySizedHeightBetweenContainer,
        Expanded(
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContainerWithTitleAndInfoMessage(
                  message: dataFitnessWorkout?.healthComplaint?.capitalizeFirst,
                  title: "???????? ???????????? ???? ????????????????",
                ),
                mySizedHeightBetweenContainer,
                mySizedHeightBetweenContainer,
                if (dataFitnessWorkout?.status == 1 ||
                    dataFitnessWorkout?.status == 0)
                  ContainerWithTitleAndInfoMessage(
                    message:
                        '?????????? ???????????? ?? ${dataFitnessWorkout?.startedAt != null ? DateFormat.Hm().format(DateTime.parse(dataFitnessWorkout!.startedAt!)) : ""} ${dataFitnessWorkout?.finishedAt != null ? "???? ${DateFormat.Hm().format(DateTime.parse(dataFitnessWorkout!.finishedAt!))}" : ""}, ${titleDate.toLowerCase()}',
                    title: "???? ???????????????? ???? ??????????",
                  ),
                if (dataFitnessWorkout?.status == 2)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ContainerWithTitleAndInfoMessage(
                        message: dataFitnessWorkout?.conclusion,
                        title: "????????????????????",
                      ),
                      mySizedHeightBetweenContainer,
                      mySizedHeightBetweenContainer,
                      Text(
                        '????????????????????????',
                        style: myTextStyleFontUbuntu(
                            context: context, newFontWeight: FontWeight.w500),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: isDataForPage
                            ? dataFitnessWorkout!.recommendations.length
                            : 2,
                        itemBuilder: (context, index) {
                          return ContainerWithTitleAndInfoMessage(
                            message: dataFitnessWorkout?.recommendations[index],
                          );
                        },
                      ),
                    ],
                  )
                else if (dataFitnessWorkout?.status == (-1))
                  ContainerWithTitleAndInfoMessage(
                    message: dataFitnessWorkout?.cancelReason,
                    title: "?????????????? ????????????",
                  ),
              ],
            ),
          ),
        ),
        if (isDataForPage)
          //0 - requested, 1 - planning, 2 - done, -1 - canceled
          dataFitnessWorkout!.status == 0
              ? _buttonRow(context: context, targetId: targetId)
              : dataFitnessWorkout!.status == 1
                  ? _buttonRow(context: context, targetId: targetId)
                  : dataFitnessWorkout!.status == 2
                      ? buttonAlertMessage(
                          context: context,
                          message: '?????????? ????????????????',
                          isDone: true,
                        )
                      : dataFitnessWorkout!.status == (-1)
                          ? buttonAlertMessage(
                              context: context,
                              message: '?????????? ??????????????',
                            )
                          : Container(),
      ],
    );
  }

  _buttonRow({required BuildContext context, required String targetId}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Color.fromRGBO(224, 121, 114, 1),
            ),
          ),
          onPressed: () {
            TextEditingController textEditingController =
                TextEditingController();
            myDefaultDialogYesOrNo(
              textEditingController: textEditingController,
              context: context,
              message: '???????????? ???????????????? ???????????',
              voidCallbackToAccept: () {
                HomePageCalendarControllerGetxState.instance
                    .calendarAppointmentsCancel(
                  targetId: targetId,
                  cancelReason: textEditingController.text.isNotEmpty
                      ? textEditingController.text
                      : "?????????????? ???????????? ???? ??????????????",
                );
              },
            );
          },
          child: Text('???????????????? ??????????'),
        ),
        mySizedHeightBetweenContainer,
      ],
    );
  }
}
