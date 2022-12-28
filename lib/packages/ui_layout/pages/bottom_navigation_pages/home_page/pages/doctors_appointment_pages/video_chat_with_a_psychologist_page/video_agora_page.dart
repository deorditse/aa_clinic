import 'dart:async';
import 'dart:typed_data';

import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/main_bottom_menu_sceleton.dart';
import 'package:flutter/material.dart';
import 'package:business_layout/business_layout.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:get/get.dart';

class AgoraWithVideo extends StatelessWidget {
  static const String id = '/agoraWithVideo';

  const AgoraWithVideo({Key? key}) : super(key: key);

  static openAgoraWithVideo({required context}) =>
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(context,
          settings: RouteSettings(name: AgoraWithVideo.id),
          screen: AgoraWithVideo());

  @override
  Widget build(BuildContext context) {
    return AgoraPage();
  }
}

class AgoraPage extends StatefulWidget {
  const AgoraPage({Key? key}) : super(key: key);

  @override
  State<AgoraPage> createState() => _AgoraPageState();
}

class _AgoraPageState extends State<AgoraPage> {
  int? _remoteUid;
  bool _localUserJoined = false;
  RtcEngine? _engine;

  String appId = RTCControllerGetxState.instance.incomingRealTimeCall!.appId!;
  String channelName =
      RTCControllerGetxState.instance.incomingRealTimeCall!.channelName;
  String agoraToken =
      RTCControllerGetxState.instance.incomingRealTimeCall!.token!;
  String userId = ImplementAuthController.instance.userAuthorizedData!.id!;

  RtcStats? _time;
  int? timer;
  bool muted = false;
  bool noVideo = false;

  @override
  void initState() {
    timer = _time?.duration;
    initAgora();
    super.initState();
  }

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();
    //create the engine
    _engine = await RtcEngine.create(appId);
    await _engine?.enableVideo();
    _engine?.setEventHandler(
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

    await _engine?.joinChannelWithUserAccount(agoraToken, channelName, userId);
  }

  String imageUser = RTCControllerGetxState.instance.RTCFromUser?.avatar != null
      ? RTCControllerGetxState.instance.RTCFromUser!.avatar!
      : 'https://vdostavka.ru/wp-content/uploads/2019/05/no-avatar.png';

  bool avatarIsset =
      RTCControllerGetxState.instance.RTCFromUser?.avatar != null;

  String fullName =
      '${RTCControllerGetxState.instance.RTCFromUser?.lastName ?? ''} '
      '${RTCControllerGetxState.instance.RTCFromUser?.firstName ?? ''} '
      '${RTCControllerGetxState.instance.RTCFromUser?.middleName ?? ''}';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: SafeArea(
            child: AppBar(
              title: Text(
                fullName,
                style: myTextStyleFontUbuntu(
                    newFontWeight: FontWeight.w300, context: context),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 15, top: 5),
                  child: avatarIsset
                      ? FutureBuilder(
                          future: ImplementSettingGetXController.instance
                              .getStaticFilesStorageAsUTF8(
                                  coverFileId: imageUser),
                          builder: (context,
                              AsyncSnapshot<Map<int, Uint8List?>?> fileData) {
                            if (fileData.hasData) {
                              return CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    MemoryImage(fileData.data!.values.first!),
                              );
                            } else {
                              return const SizedBox();
                            }
                          })
                      : CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(imageUser),
                        ),
                ),
              ],
              centerTitle: true,
              automaticallyImplyLeading: false,
            ),
          ),
        ),
        body: SafeArea(
          child: LayoutBuilder(builder: (ctx, constrains) {
            return Container(
              color: Colors.black,
              // height: Get.height * 0.9,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 100,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Center(
                          child: _localUserJoined
                              ? RtcLocalView.SurfaceView()
                              : CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        Text(
                          'PRIVATE',
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
                    child: Column(
                      children: [
                        SizedBox(height: 4),
                        Text(
                          '${timer ?? ''}',
                          style: myTextStyleFontUbuntu(
                              newFontWeight: FontWeight.w300, context: context),
                        ),
                        Expanded(child: _rowWithButtonCall()),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  // Display remote user's video
  Widget _remoteVideo({required int? remoteUid, required String? channelName}) {
    if (remoteUid != null && channelName != null) {
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

  void _onToggleVideoVisible() {
    setState(() {
      noVideo = !noVideo;
    });
    _engine?.muteLocalVideoStream(noVideo);
  }

  void _onToggleMute() {
    setState(() {
      muted = !muted;
    });
    _engine?.muteLocalAudioStream(muted);
  }

  _rowWithButtonCall() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                noVideo = !noVideo;
              });
              _engine?.muteLocalVideoStream(noVideo);
            },
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero)),
            child: SvgPicture.asset(
              noVideo
                  ? 'assets/icons/no_video.svg'
                  : 'assets/icons/noVideo.svg',
              color: Get.isDarkMode
                  ? null
                  : Theme.of(context).textTheme.headline1!.color,
              semanticsLabel: 'noVideo',
              fit: BoxFit.contain,
            ),
          ),
          TextButton(
            onPressed: () {
              RTCControllerGetxState.instance.finishRealTimeCall().then(
                (value) {
                  _engine?.leaveChannel();
                  Get.back();
                },
              );
            },
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero)),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              child: Container(
                color: const Color.fromRGBO(230, 43, 43, 1),
                child: SvgPicture.asset(
                  'assets/icons/call.svg',
                  width: 70,
                  height: 70,
                  semanticsLabel: 'call',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                muted = !muted;
              });
              _engine?.muteLocalAudioStream(muted);
            },
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero)),
            child: SvgPicture.asset(
              muted ? 'assets/icons/no_mic.svg' : 'assets/icons/microphone.svg',
              semanticsLabel: 'microphone',
              color: Get.isDarkMode
                  ? null
                  : Theme.of(context).textTheme.headline1!.color,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
