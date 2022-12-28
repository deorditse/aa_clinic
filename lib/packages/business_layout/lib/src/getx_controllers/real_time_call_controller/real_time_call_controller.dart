import 'dart:ffi';

//bottom_navigation_pages/home_page/pages/doctors_appointment_pages/incoming_video_chat_page/incoming_video_chat_page.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:business_layout/business_layout.dart';
import 'package:data_layout/data_layout.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vibration/vibration.dart';

//каждый раз при изменении запускать кодогенерацию
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs
//чтобы зарегистрировать как фабрику для GetIt и обращаться к сервис локатору через  MainSimpleStateManagement

class RTCControllerGetxState extends GetxController {
  static RTCControllerGetxState instance = Get.find<RTCControllerGetxState>();

  RealTimeCall? incomingRealTimeCall;
  RealTimeCallSocketEvent? incomingRealTimeCallFromSocket;
  UserMinifiedDataIdModel? RTCFromUser;
  int status = 0;

  // statuses: 0 - nothing, 1 - incomingCall, 2 - acceptedCall

  final RealTimeCallData _services = RealTimeCallData();

  Function newRTCCallback = () {};
  Function finishRTCCallback = () {};

  @override
  void onReady() {
    super.onReady();
    initializeDataRTC();
    _myInitRTCController();
  }

  void initializeDataRTC() {
    // в штатном режиме подключиться сокетом к серверу и в случае newRTC получить максимум простых данных и опять открыть скрин звонка

    print('initializeDataRTC from RTCControllerGetxState');
    SettingPageData.socket?.on('newRealTimeCall', (data) {
      print(data);
      newRTCCallback(RealTimeCallSocketEvent.fromJson(data));
    });
    SettingPageData.socket?.on(
      'finishRealTimeCall',
      (data) {
        print(data);
        finishRTCCallback();
      },
    );
  }

  void setNewRTCCallback(Function callback) {
    newRTCCallback = callback;
  }

  void setFinishRTCCallback(Function callback) {
    finishRTCCallback = callback;
  }

  Future<void> _myInitRTCController() async {
    if (await getIncomingCall() != null) {
      _vibrate();
      // при загрузке приложения проверить наличие входящих звонков и если они есть, то открыть скрин
      Get.toNamed('/incomingVideoChatPage');
      return;
    }

    setNewRTCCallback(
      (RealTimeCallSocketEvent incomingRTC) async {
        if (status != 0) {
          // если пациент уже с кем-то разговаривает или кто-то уже ему звонит
          return null;
        }
        status = 1;
        incomingRealTimeCallFromSocket = incomingRTC;
        RTCFromUser = await updateRTCFromUser();
        if (incomingRealTimeCallFromSocket?.id != null) {
          await getRealTimeCallById(id: incomingRealTimeCallFromSocket!.id)
              .then(
            (value) {
              incomingRealTimeCall = value;
              update();
              Get.toNamed('/incomingVideoChatPage');
            },
          );
        }
      },
    );
  }

  void _vibrate() async {
    if (await Vibration.hasVibrator() != null) {
      Vibration.vibrate(duration: 2000, amplitude: 255);
    }
  }

  Future<RealTimeCall?> getRealTimeCallById({
    required String id,
  }) {
    return _services.getRealTimeCallById(
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
      id: id,
    );
  }

  Future<RealTimeCall?> getIncomingCall() async {
    if (ImplementAuthController.instance.userAuthorizedData != null) {
      return await _services
          .getIncomingRealTimeCalls(
        accessToken:
            ImplementAuthController.instance.userAuthorizedData!.accessToken,
      )
          .then(
        (RealTimeCallModel? calls) async {
          if (calls != null &&
              calls.docs.isNotEmpty &&
              calls.docs.first.finishedAt == null) {
            incomingRealTimeCall = calls.docs.first;
            if (incomingRealTimeCall!.members.first !=
                ImplementAuthController.instance.userAuthorizedData!.id) {
              incomingRealTimeCallFromSocket?.from =
                  incomingRealTimeCall!.members.first!;
            } else {
              incomingRealTimeCallFromSocket?.from =
                  incomingRealTimeCall!.members[1]!;
            }
            incomingRealTimeCallFromSocket?.id = incomingRealTimeCall!.id;
            update();
            await updateRTCFromUser();
            return calls.docs.first;
          } else {
            return null;
          }
        },
      );
    }
  }

  Future updateRTCFromUser() async {
    if (incomingRealTimeCallFromSocket?.from != null) {
      RTCFromUser = await ImplementSettingGetXController.instance
          .getDataUserMinified(idUser: incomingRealTimeCallFromSocket!.from);
      update();
    }
  }

  Future acceptRealTimeCall() async {
    await _services.acceptRealTimeCalls(
        id: incomingRealTimeCall!.id,
        accessToken:
            ImplementAuthController.instance.userAuthorizedData!.accessToken);
    status = 2;
    update();
  }

  Future finishRealTimeCall() async {
    await _services.finishRealTimeCalls(
      id: incomingRealTimeCall!.id,
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
    );
    status = 0;
    update();
  }

  //для видеозвонков
  RtcEngine? engine;
  int? remoteUid;
  bool localUserJoined = false;

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();
    //create the engine
    if (incomingRealTimeCall?.appId != null) {
      engine = await RtcEngine.create(incomingRealTimeCall!.appId!);
      update();
      await engine?.enableVideo();
      engine?.setEventHandler(
        RtcEngineEventHandler(
          joinChannelSuccess: (String channel, int uid, int elapsed) {
            print("local user $uid joined");
            localUserJoined = true;
            update();
          },
          userJoined: (int uid, int elapsed) {
            print("remote user $uid joined");
            remoteUid = uid;
            update();
          },
          userOffline: (int uid, UserOfflineReason reason) {
            print("remote user $uid left channel");
            remoteUid = null;
            update();
          },
        ),
      );
      if (incomingRealTimeCall?.channelName != null &&
          ImplementAuthController.instance.userAuthorizedData?.id != null) {
        await engine?.joinChannelWithUserAccount(
          incomingRealTimeCall?.token,
          incomingRealTimeCall!.channelName,
          ImplementAuthController.instance.userAuthorizedData!.id!,
        );
      }
    }
  }
}
