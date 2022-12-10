import 'package:business_layout/business_layout.dart';
import 'package:get/get.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies()  {
    Get.lazyPut(() => ImplementAuthController(), fenix: true);
  }
}
