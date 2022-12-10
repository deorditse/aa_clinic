import 'dart:collection';
import 'package:get/get.dart';
import 'package:model/model.dart';

//каждый раз при изменении запускать кодогенерацию
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs
//чтобы зарегистрировать как фабрику для GetIt и обращаться к сервис локатору через  MainSimpleStateManagement

class ChatPageControllerGetx extends GetxController {
  static ChatPageControllerGetx instance = Get.find<ChatPageControllerGetx>();

  @override
  void onInit() {
    super.onInit();
  }

  bool isSearchingChats = false;

  void changeIsSearchingChats({bool? isSearching}) {
    isSearchingChats = isSearching ?? !isSearchingChats;
    update();
  }

  ///для чата на первой странице
  List<ChatFindManyModel?> listDataUsers = [];


}
