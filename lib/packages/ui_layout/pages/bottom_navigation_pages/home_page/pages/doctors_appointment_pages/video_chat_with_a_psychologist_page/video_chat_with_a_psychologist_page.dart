import 'package:aa_clinic/main.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/home_page.dart';
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
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

class VideoChatWithPsychologistPage extends StatelessWidget {
  static const String id = '/videoChatWithPsychologistPage';

  const VideoChatWithPsychologistPage({Key? key, this.nameWorkout = ''})
      : super(key: key);
  final String nameWorkout;

  static openVideoChatWithPsychologistPage({required context}) =>
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: RouteSettings(name: VideoChatWithPsychologistPage.id),
        screen: VideoChatWithPsychologistPage(),
        withNavBar: false,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );

  @override
  Widget build(BuildContext context) {
    return MyMaterialNewPageWithoutBorder(
      titleAppBar: 'name doctor',
      isSafeArea: false,
      widgetBody: _BodyVideoChatWithPsychologistPage(),
      backgroundColor: Colors.white,
      paddingHorizontalContent: 0,
    );
  }
}

class _BodyVideoChatWithPsychologistPage extends StatefulWidget {
  const _BodyVideoChatWithPsychologistPage({Key? key}) : super(key: key);

  @override
  State<_BodyVideoChatWithPsychologistPage> createState() =>
      _BodyVideoChatWithPsychologistPageState();
}

class _BodyVideoChatWithPsychologistPageState
    extends State<_BodyVideoChatWithPsychologistPage> {
  int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  Future<void> initAgora() async {
    String? appId = RTCControllerGetxState.instance.incomingRealTimeCall?.appId;
    String? channelName =
        RTCControllerGetxState.instance.incomingRealTimeCall?.channelName;
    String? agoraToken =
        RTCControllerGetxState.instance.incomingRealTimeCall?.token;
    String? userId = ImplementAuthController.instance.userAuthorizedData?.id;
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();
    //create the engine
    if (appId != null) {
      _engine = await RtcEngine.create(appId);
      await _engine.enableVideo();
      _engine.setEventHandler(
        RtcEngineEventHandler(
          joinChannelSuccess: (String channel, int uid, int elapsed) {
            print("local user $uid joined");
            setState(() {
              _localUserJoined = true;
            });
          },
          userJoined: (int uid, int elapsed) {
            print("remote user $uid joined");
            setState(() {
              _remoteUid = uid;
            });
          },
          userOffline: (int uid, UserOfflineReason reason) {
            print("remote user $uid left channel");
            setState(() {
              _remoteUid = null;
            });
          },
        ),
      );

      if (channelName != null && userId != null) {
        await _engine.joinChannelWithUserAccount(
          agoraToken,
          channelName,
          userId,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agora Video Call'),
      ),
      body: LayoutBuilder(
        builder: (ctx, constrains) {
          return Container(
            // height: Get.height * 0.9,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.offAndToNamed(
                              '${MyBottomMenuSceleton.id}'); //перехожу на главную страницу
                          // ImplementSettingGetXController.instance.goToScreenBody(
                          //     bodyScreens: BodyScreens.BodyArticlesPage);
                        },
                        child: Text('тест закрыть все и перейти на главную'),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Text(
                        'Private call',
                        style: myTextStyleFontUbuntu(
                            newFontWeight: FontWeight.w300,
                            context: context,
                            textColor:
                                Theme.of(context).scaffoldBackgroundColor),
                      ),
                      mySizedHeightBetweenContainer,
                    ],
                  ),
                ),
                Container(
                  color: Theme.of(context).cardColor,
                  height: Get.height / 7,
                  width: Get.width,
                  child: Column(
                    children: [
                      SizedBox(height: 4),
                      Text(
                        '0:12:31',
                        style: myTextStyleFontUbuntu(
                            newFontWeight: FontWeight.w300, context: context),
                      ),
                      //Expanded(child: _rowWithButtonCall()),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 100,
                    height: 150,
                    child: Center(
                      child: _localUserJoined
                          ? RtcLocalView.SurfaceView()
                          : CircularProgressIndicator(),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Display remote user's video
  Widget _remoteVideo({int? remoteUid, required String channelName}) {
    if (remoteUid != null) {
      return RtcRemoteView.SurfaceView(
        uid: remoteUid,
        channelId: channelName,
      );
    } else {
      return const Text(
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
  }
}
