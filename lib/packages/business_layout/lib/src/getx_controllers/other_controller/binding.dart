import 'package:data_layout/data_layout.dart';
import 'package:get/get.dart';
import 'package:business_layout/business_layout.dart'; //импортить только в таком формате

class OtherBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtherControllerGetxState());
  }
}
