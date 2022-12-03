import 'package:data_layout/data_layout.dart';
import 'package:get/get.dart';
import 'package:business_layout/business_layout.dart';

class HomePageCalendarBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomePageCalendarControllerGetxState());
  }
}
