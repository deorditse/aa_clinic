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
  String? RTCFromId;
  String? RTCId;
  UserMinifiedDataIdModel? RTCFromUser;
  int status = 0;

  // statuses: 0 - nothing, 1 - incomingCall, 2 - acceptedCall

  final RealTimeCallData _services = RealTimeCallData();

  @override
  onInit() {
    super.onInit();
    _myInitRTCController();
  }

  Future<void> _myInitRTCController() async {
    if (await getIncomingCall() != null) {
      _vibrate();
      // при загрузке приложения проверить наличие входящих звонков и если они есть, то открыть скрин
      Get.toNamed('/incomingVideoChatPage');
    }
    print('INIT socket for RTC');
    // в штатном режиме подключиться сокетом к серверу и в случае newRTC получить максимум простых данных и опять открыть скрин звонка

    if (ImplementAuthController.instance.userAuthorizedData?.accessToken !=
        null) {
      _services.initializeDataRTC();

      _services.setNewRTCCallback(
        (RealTimeCallSocketEvent incomingRTC) async {
          print('INCOMING');
          if (status != 0) {
            // если пациент уже с кем-то разговаривает или кто-то уже ему звонит
            return null;
          }
          status = 1;
          incomingRealTimeCallFromSocket = incomingRTC;
          RTCFromId = incomingRealTimeCallFromSocket?.from;
          // TODO: get minifieduserdata
          RTCId = incomingRealTimeCallFromSocket?.id;
          if (RTCId != null) {
            incomingRealTimeCall = await getRealTimeCallById(id: RTCId!);
            Get.toNamed('/incomingVideoChatPage');
          }
          update();
        },
      );
    }
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
              accessToken: ImplementAuthController
                  .instance.userAuthorizedData!.accessToken)
          .then(
        (RealTimeCallModel? calls) async {
          if (calls!.docs.isNotEmpty && calls.docs.first.finishedAt == null) {
            incomingRealTimeCall = calls.docs.first;
            if (incomingRealTimeCall!.members.first !=
                ImplementAuthController.instance.userAuthorizedData!.id) {
              RTCFromId = incomingRealTimeCall!.members.first;
            } else {
              RTCFromId = incomingRealTimeCall!.members[1];
            }
            RTCId = incomingRealTimeCall!.id;
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
    if (RTCFromId != null) {
      RTCFromUser = await ImplementSettingGetXController.instance
          .getDataUserMinified(idUser: RTCFromId!);
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
            ImplementAuthController.instance.userAuthorizedData!.accessToken);
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
