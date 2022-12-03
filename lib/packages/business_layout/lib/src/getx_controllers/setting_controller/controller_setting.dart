import 'dart:io';

import 'package:business_layout/business_layout.dart';
import 'package:data_layout/data_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

//каждый раз при изменении запускать кодогенерацию
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs
//чтобы зарегистрировать как фабрику для GetIt и обращаться к сервис локатору через  MainSimpleStateManagement
//для навигации по нажатию кнопкт

//страницы навигации
enum BodyScreens {
  BodyProfilePage,
  BodyChatPage,
  BodyHomePage,
  BodyArticlesPage,
  BodyOtherPage,
}

class ImplementSettingGetXController extends GetxController {
  static ImplementSettingGetXController instance = Get.find();

  SettingPageData _services = SettingPageData();

//контроллер для управления состоянием меню
//   PersistentTabController controllerTabIndex =
//       PersistentTabController(initialIndex: 2);
  int controllerTabIndex = 2;

  @override
  void onInit() {
    super.onInit();

    // initializedControllerForPage();
  }

  void goToScreenBody({required BodyScreens bodyScreens}) {
    switch (bodyScreens) {
      case BodyScreens.BodyProfilePage:
        changeBodyPageForIndex(indexPage: 0);
        break;
      case BodyScreens.BodyChatPage:
        changeBodyPageForIndex(indexPage: 1);
        break;
      case BodyScreens.BodyHomePage:
        changeBodyPageForIndex(indexPage: 2);
        break;
      case BodyScreens.BodyArticlesPage:
        changeBodyPageForIndex(indexPage: 3);
        break;
      case BodyScreens.BodyOtherPage:
        changeBodyPageForIndex(indexPage: 4);
        break;
    }
  }

  Future<void> changeBodyPageForIndex({required int indexPage}) async {
    // controllerTabIndex.index = (indexPage);
    controllerTabIndex = indexPage;
    update();
  }

  //
  // void initializedControllerForPage({int indexPage = 2}) {
  //   switch (indexPage) {
  //     case 0:
  //       print('initState BodyProfilePage');
  //       // Get.put(ProfileControllerGetxState());
  //       Get.lazyPut(() => ProfileControllerGetxState(), fenix: true);
  //
  //       break;
  //     case 1:
  //       print('initState BodyChatPage');
  //       // Get.put(ChatPageControllerGetx());
  //       Get.lazyPut(() => ChatPageControllerGetx(), fenix: true);
  //
  //       break;
  //     case 2:
  //       print('initState BodyHomePage');
  //       // Get.put(HomePageCalendarControllerGetxState());
  //       Get.lazyPut(() => HomePageCalendarControllerGetxState(), fenix: true);
  //
  //       break;
  //     case 3:
  //       print('initState BodyArticlesPage');
  //       // Get.put(ArticlesControllerGetxState());
  //       Get.lazyPut(() => ArticlesControllerGetxState(), fenix: true);
  //       break;
  //     case 4:
  //       print('initState BodyOtherPage');
  //       // Get.put(OtherControllerGetxState());
  //       Get.lazyPut(() => OtherControllerGetxState(), fenix: true);
  //       break;
  //   }
  // }

  UserDataModel? userAllData;

  Future<UserDataModel?> getFindMe({bool isUpdateData = false}) async {
    if (userAllData == null || isUpdateData) {
      final result = await _services.getFindMeData(
        accessToken:
            ImplementAuthController.instance.userAuthorizedData!.accessToken,
      );
      userAllData = result;
      update();
      return result;
    } else {
      return userAllData;
    }
  }

  ///обновление данных пользователя
  Future<void> updateMeUser({required UserDataModel editUserAllData}) async {
    if (userAllData != editUserAllData) {
      userAllData = editUserAllData;
      update();

      //обновление данных пользователя
      await _services.updateMeData(
        accessToken:
            ImplementAuthController.instance.userAuthorizedData!.accessToken,
        userEdit: editUserAllData,
      );
    }
  }

  ///Роут для получения минимальной информации о пользователе по ID +
  //  чтобы сохранять в текущей сессии и не тянyть из базы если есть в мапе Map<String, UserMinifiedDataIdModel?>? == IdUser :  UserMinifiedDataIdModel
  Map<String, UserMinifiedDataIdModel?> mapIdUserAndUserMinifiedData = {};

  Future<UserMinifiedDataIdModel?> getDataUserMinified(
      {required String idUser}) async {
    if (mapIdUserAndUserMinifiedData[idUser] == null) {
      final result = await _services.getDataUserMinifiedData(
        idUser: idUser,
        accessToken:
            ImplementAuthController.instance.userAuthorizedData!.accessToken,
      );
      mapIdUserAndUserMinifiedData[idUser] = result;
      return result;
    } else {
      return mapIdUserAndUserMinifiedData[idUser];
    }
  }

  ///Роут для получения файла по id из статического хранилища файлов +
  //  чтобы сохранять в текущей сессии и не тянyть из базы если есть в мапе Map<String, Uint8List> == coverFileId :  Uint8List
  Map<String, Uint8List?> mapCoverFileIdAndUint8ListStaticFilesStorage = {};

  Future<Uint8List?> getStaticFilesStorage(
      {required String coverFileId}) async {
    if (mapCoverFileIdAndUint8ListStaticFilesStorage[coverFileId] == null) {
      final result = await _services.getStaticFilesStorageData(
        coverFileId: coverFileId,
        accessToken:
            ImplementAuthController.instance.userAuthorizedData!.accessToken,
      );
      mapCoverFileIdAndUint8ListStaticFilesStorage[coverFileId] = result;
      return result;
    } else {
      return mapCoverFileIdAndUint8ListStaticFilesStorage[coverFileId];
    }
  }

  ///Роут для загрузки файлов (только картинки)
  Future<String?> postStaticFilesAndGetIdImage(
      {required File fileImage, required String category}) async {
    //возвращает coverId

    update();
    return await _services.postStaticFilesAndGetIdImageData(
      fileImage: fileImage,
      category: category,
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
    );
  }

  ///Роут для удаления  файла (только картинки)
  Future<void> deleteStaticFilesAndGetIdImage({required String coverId}) async {
    await _services.deleteStaticFilesAndGetIdImageData(
      coverId: coverId,
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
    );
  }
}
