import 'package:get/get.dart';
import 'package:business_layout/business_layout.dart'; //импортить только в таком формате

class SettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ImplementSettingGetXController(), permanent: true);
    Get.lazyPut(() => HomePageCalendarControllerGetxState(), fenix: true);
    Get.lazyPut(() => ProfileControllerGetxState(), fenix: true);
    Get.lazyPut(() => ChatPageControllerGetx(), fenix: true);
    Get.lazyPut(() => ArticlesControllerGetxState(), fenix: true);
    Get.lazyPut(() => OtherControllerGetxState(), fenix: true);
  }
}
