import 'package:get/get.dart';
import 'package:business_layout/business_layout.dart';

class ChatPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>ChatPageControllerGetx());
  }
}
