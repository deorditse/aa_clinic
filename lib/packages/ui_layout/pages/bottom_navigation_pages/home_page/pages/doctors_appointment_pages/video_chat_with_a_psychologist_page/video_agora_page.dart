import 'package:flutter/material.dart';
import 'package:business_layout/business_layout.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
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
  @override
  void initState() {
    print('INIT AgoraPage');
    super.initState();
    RTCControllerGetxState.instance.initAgora();
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
            height: constrains.maxHeight,
            child: GetBuilder<RTCControllerGetxState>(
              builder: (controllerRTC) => Stack(
                children: [
                  Center(
                    child: _remoteVideo(
                      remoteUid: controllerRTC.remoteUid,
                      channelName:
                          controllerRTC.incomingRealTimeCall?.channelName,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 100,
                      height: 150,
                      child: Center(
                        child: controllerRTC.localUserJoined
                            ? RtcLocalView.SurfaceView()
                            : CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
}
