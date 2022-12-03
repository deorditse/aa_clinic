import 'dart:collection';
import 'package:get/get.dart';
import 'package:model/model.dart';
import 'package:table_calendar/table_calendar.dart';

//каждый раз при изменении запускать кодогенерацию
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs
//чтобы зарегистрировать как фабрику для GetIt и обращаться к сервис локатору через  MainSimpleStateManagement

class ChatPageControllerGetx extends GetxController {
  static ChatPageControllerGetx instance = Get.find<ChatPageControllerGetx>();

  DateTime mySelectedDay = DateTime.now();

  void changeMySelectedDay({required DateTime newDateTime}) {
    mySelectedDay = newDateTime;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  ///для events list / календарь

  dynamic events = {};


  bool isSearchingChats = false;

  void changeIsSearchingChats({bool? isSearching}) {
    isSearchingChats = isSearching ?? !isSearchingChats;
    update();
  }
}


