import 'package:get/get.dart';
import 'package:business_layout/business_layout.dart'; //импортить только в таком формате

class ArticlesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticlesControllerGetxState());
  }
}
