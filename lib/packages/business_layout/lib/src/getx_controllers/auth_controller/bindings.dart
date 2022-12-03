import 'package:business_layout/business_layout.dart';
import 'package:get/get.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ImplementAuthController(), permanent: true);
  }
}
