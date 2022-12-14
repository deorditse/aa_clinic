import 'dart:async';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/home_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/doctors_appointment_pages/video_chat_with_a_psychologist_page/video_agora_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/doctors_appointment_pages/video_chat_with_a_psychologist_page/video_chat_with_a_psychologist_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/main_login_page.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/material_sceleton_without_borders.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/sliver_sceleton_pages/sliver_sceleton_without_borders.dart';
import 'package:business_layout/business_layout.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';

class IncomingVideoChatPage extends StatelessWidget {
  static const String id = '/incomingVideoChatPage';

  const IncomingVideoChatPage({Key? key, this.nameWorkout = ''})
      : super(key: key);
  final String nameWorkout;

  static openIncomingVideoChatPage({required context}) =>
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: RouteSettings(name: IncomingVideoChatPage.id),
        screen: IncomingVideoChatPage(),
        withNavBar: false,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );

  @override
  Widget build(BuildContext context) {
    // final titleDate = abbreviatedTitleDateAppBar(
    //     mySelectedDay:
    //         HomePageCalendarControllerGetxState.instance.mySelectedDay);
    return MyMaterialNewPageWithoutBorder(
      titleAppBar: 'name doctor',
      deleteAppBar: true,
      widgetBody: _BodyIncomingVideoChatPage(),
      backgroundColor: Theme.of(context).cardColor,
      paddingHorizontalContent: 0,
    );
  }
}

class _BodyIncomingVideoChatPage extends StatefulWidget {
  const _BodyIncomingVideoChatPage({Key? key}) : super(key: key);

  @override
  State<_BodyIncomingVideoChatPage> createState() =>
      _BodyIncomingVideoChatPageState();
}

void acceptCall() {
  RTCControllerGetxState.instance.acceptRealTimeCall();
}

void finishCall() {
  RTCControllerGetxState.instance.finishRealTimeCall();
}

class _BodyIncomingVideoChatPageState
    extends State<_BodyIncomingVideoChatPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<RTCControllerGetxState>(
        builder: (rtcController) {
          String fullName =
              '${rtcController.RTCFromUser?.lastName ?? ''} ${rtcController.RTCFromUser?.firstName ?? ''} ${rtcController.RTCFromUser?.middleName ?? ''}';
          return Padding(
            padding: const EdgeInsets.fromLTRB(35, 60, 35, 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(150),
                        child: Image.network(
                          'https://miro.medium.com/max/1400/0*vzeerCL0vZVofMs9.jpeg',
                          height: 174,
                          width: 174,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      fullName,
                      style:
                          myTextStyleFontUbuntu(fontSize: 24, context: context),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Входящий видеозвонок',
                        style: myTextStyleFontUbuntu(
                            fontSize: 14,
                            textColor: Colors.white70,
                            context: context)),
                  ],
                ),
                _rowWithButtonCall(),
              ],
            ),
          );
        },
      ),
    );
  }

  _rowWithButtonCall() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            finishCall();
            Get.back();
          },
          style:
              ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            child: Container(
              color: Color.fromRGBO(230, 43, 43, 1),
              child: SvgPicture.asset(
                'assets/icons/call.svg',
                width: 90,
                height: 90,
                semanticsLabel: 'call',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            acceptCall();
            Get.toNamed(AgoraWithVideo.id);
          },
          style:
              ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            child: Container(
              color: const Color.fromRGBO(14, 214, 166, 1),
              child: SvgPicture.asset(
                'assets/icons/acceptCall.svg',
                width: 90,
                height: 90,
                semanticsLabel: 'acceptCall',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
