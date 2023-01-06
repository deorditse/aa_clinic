import 'package:business_layout/business_layout.dart';
import 'package:data_layout/data_layout.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

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

  final SettingPageData _services = SettingPageData();

  int controllerTabIndex = 2;

  @override
  Future<void> onInit() async {
    super.onInit();

    // инициирую сокет для всего приложения
    print("инициализация сокета для всего приложения");
    _services.socketConnect(
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
    );
    getFindMe(isUpdateData: true).whenComplete(() {
      initializedControllersForPage();
    });
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
    controllerTabIndex = indexPage;
    update();
  }

  void initializedControllersForPage({int indexPage = 2}) {
    switch (indexPage) {
      case 0:
        print('initState BodyProfilePage');
        Get.put(ProfileControllerGetxState());
        Get.put(ActiveValueControllerProfilePage());
        break;
      case 1:
        print('initState BodyChatPage');
        Get.put(ChatPageControllerGetx());
        break;
      case 2:
        print('initState BodyHomePage');

        Get.put(RTCControllerGetxState());
        Get.put(ActiveValueControllerProfilePage());
        break;
      case 3:
        print('initState BodyArticlesPage');
        Get.put(ArticlesControllerGetxState());
        break;
      case 4:
        print('initState BodyOtherPage');
        Get.put(OtherControllerGetxState());
        break;
    }
  }

  UserDataModel? userAllData;

  Future<UserDataModel?> getFindMe({bool isUpdateData = false}) async {
    if (userAllData == null || isUpdateData) {
      _services
          .getFindMeData(
        accessToken:
            ImplementAuthController.instance.userAuthorizedData!.accessToken,
      )
          .then(
        (mapFindMeDat) {
          if (mapFindMeDat!.keys.first == 200) {
            userAllData = UserDataModel.fromJson(mapFindMeDat.values.first);
            update();
            return userAllData;
          } else if (mapFindMeDat.keys.first == 401) {
            ImplementAuthController.instance.codeResponseStatus401(
              codeString: mapFindMeDat.values.first['code'],
            );
          }
          return null;
        },
      );
    } else {
      return userAllData;
    }
    return null;
  }

  ///обновление данных пользователя
  Future<void> updateMeUser({required UserDataModel editUserAllData}) async {
    // if (userAllData != editUserAllData) {
    userAllData = editUserAllData;
    update();

    //обновление данных пользователя
    await _services.updateMeData(
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
      userEdit: editUserAllData,
    );
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
      update();
      return result;
    } else {
      return mapIdUserAndUserMinifiedData[idUser];
    }
  }

  ///Роут для получения файла по id из статического хранилища файлов +
  //  чтобы сохранять в текущей сессии и не тянyть из базы если есть в мапе Map<String, Map<int, Uint8List?>> = coverFileId :  <responseStatus : Uint8List>
  Map<String, Map<int, Uint8List?>>
      _mapCoverFileIdAndUint8ListStaticFilesStorage = {};

  Future<Map<int, Uint8List?>?> getStaticFilesStorageAsUTF8(
      {required String coverFileId}) async {
    if (_mapCoverFileIdAndUint8ListStaticFilesStorage[coverFileId] == null) {
      final Map<int, Uint8List?>? result =
          await _services.getStaticFilesStorageData(
        coverFileId: coverFileId,
        accessToken:
            ImplementAuthController.instance.userAuthorizedData!.accessToken,
      );
      if (result != null) {
        _mapCoverFileIdAndUint8ListStaticFilesStorage[coverFileId] = result;
        update();
      }

      return result;
    } else {
      return _mapCoverFileIdAndUint8ListStaticFilesStorage[coverFileId];
    }
  }

  ///Роут для получения файла по его id
  //  чтобы сохранять в текущей сессии и не тянyть из базы если есть в мапе Map<String, Uint8List> == coverFileId :  Uint8List
  Map<String, StaticFileModel?> mapCoverFileIdAndStaticFileModel = {};

  Future<StaticFileModel?> getStaticFile({required String coverFileId}) async {
    if (mapCoverFileIdAndStaticFileModel[coverFileId] == null) {
      final result = await _services.getStaticFileData(
        coverFileId: coverFileId,
        accessToken:
            ImplementAuthController.instance.userAuthorizedData!.accessToken,
      );
      mapCoverFileIdAndStaticFileModel[coverFileId] = result;
      update();
      return result;
    } else {
      return mapCoverFileIdAndStaticFileModel[coverFileId];
    }
  }

  ///Роут для получения вложения по его id
  Future<AttachmentModel?> getAttachmentInfo(
      {required String idAttachment}) async {
    return await _services.getAttachmentInfoData(
      idAttachment: idAttachment,
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
    );
  }

  ///Роут для загрузки файлов (только картинки) возвращает coverId
  Future<String?> postStaticFilesAndGetIdImage({
    required String filePath,
    String? category = "publicForUsers",
    bool isAttachmentsRoute = true,
  }) async {
    return await _services.postStaticFilesAndGetIdImageData(
      filePath: filePath,
      category: category,
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
      isAttachmentsRoute: isAttachmentsRoute,
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
