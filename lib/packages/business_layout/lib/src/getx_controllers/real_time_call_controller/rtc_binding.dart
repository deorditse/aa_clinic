import 'package:get/get.dart';
import 'package:business_layout/business_layout.dart'; //импортить только в таком формате

class RTCBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RTCControllerGetxState(), fenix: true);
  }
}
