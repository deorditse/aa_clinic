import 'package:get/get.dart';
import 'package:business_layout/business_layout.dart'; //импортить только в таком формате

class CalendarBindingChat implements Bindings {
  @override
  void dependencies() {
    Get.put(ImplementationCalendarEventsChatPage());
  }
}
