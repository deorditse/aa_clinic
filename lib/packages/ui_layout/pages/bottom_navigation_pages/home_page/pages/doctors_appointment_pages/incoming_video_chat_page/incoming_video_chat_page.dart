import 'dart:async';
import 'dart:typed_data';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/widgets/app_bar_chat_with_user.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/home_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/doctors_appointment_pages/video_chat_with_a_psychologist_page/video_agora_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/main_bottom_menu_sceleton.dart';
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
      titleAppBar: 'doctor name',
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

Future<void> acceptCall() async {
  await RTCControllerGetxState.instance.acceptRealTimeCall();
}

bool avatarIsset = RTCControllerGetxState.instance.RTCFromUser?.avatar != null;

String imageUser = RTCControllerGetxState.instance.RTCFromUser?.avatar != null
    ? RTCControllerGetxState.instance.RTCFromUser!.avatar!
    : 'https://vdostavka.ru/wp-content/uploads/2019/05/no-avatar.png';

class _BodyIncomingVideoChatPageState
    extends State<_BodyIncomingVideoChatPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
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
                          child: avatarIsset
                              ? FutureBuilder(
                                  future: ImplementSettingGetXController
                                      .instance
                                      .getStaticFilesStorageAsUTF8(
                                          coverFileId: imageUser),
                                  builder: (context,
                                      AsyncSnapshot<Map<int, Uint8List?>?>
                                          fileData) {
                                    if (fileData.hasData) {
                                      return Image.memory(
                                        fileData.data!.values.first!,
                                        height: 174,
                                        width: 174,
                                        fit: BoxFit.fitWidth,
                                      );
                                    } else {
                                      return const SizedBox();
                                    }
                                  })
                              : Image.network(imageUser),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        fullName,
                        style: myTextStyleFontUbuntu(
                            fontSize: 24, context: context),
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
      ),
    );
  }

  _rowWithButtonCall() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            RTCControllerGetxState.instance
                .finishRealTimeCall()
                .whenComplete(() {
              Get.back();
            });
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
            Get.off(() => AgoraWithVideo());
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
