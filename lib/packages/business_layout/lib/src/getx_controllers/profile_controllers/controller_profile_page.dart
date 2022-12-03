import 'dart:io';
import 'package:business_layout/business_layout.dart';
import 'package:data_layout/data_layout.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:model/model.dart';
import 'package:hive/hive.dart';

//каждый раз при изменении запускать кодогенерацию
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs
//чтобы зарегистрировать как фабрику для GetIt и обращаться к сервис локатору через  MainSimpleStateManagement

class ProfileControllerGetxState extends GetxController {
  static ProfileControllerGetxState instance =
      Get.find<ProfileControllerGetxState>();

  final ProfilePageData _services = ProfilePageData();
  bool isSearchingDocument = false;

  void changeIsSearchingDocument({bool? isSearching}) {
    isSearchingDocument = isSearching ?? !isSearchingDocument;
    update();
  }

  @override
  void onInit() {
    initialDataProfile();
    super.onInit();
  }

  Future<void> initialDataProfile() async {
    await ImplementSettingGetXController.instance
        .getFindMe(isUpdateData: true)
        .then(
      (userAllData) async {
        //инициализация списка документов

        await getPatientDocumentsByUserId(
          userId: userAllData!.id,
        );
        //инициализация ачивок и статистики выполнения
        await getAchievements();
      },
    );
  }

  ///Роут для получения списка достижений +                ¬
  //  чтобы сохранять в текущей сессии и не тянyть из базы если есть в мапе Map<String, DocumentsListModel> == idDocuments :  DocumentsListModel
  AchievementsModel? achievementsModelData;

  int? percentAchievementsValue;

  Future<void> getAchievements() async {
    achievementsModelData = await _services.getAchievementsData(
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
    );
    update();

    final _allAchi = achievementsModelData!.docs.length;
    final _userAchi = ImplementSettingGetXController
        .instance.userAllData!.achievements.length;
    if (_allAchi != 0) {
      percentAchievementsValue = ((_userAchi / _allAchi) * 100).toInt();
      update();
    } else {
      percentAchievementsValue = 0;
      update();
    }
  }

  //  чтобы сохранять в текущей сессии и не тянyть из базы если есть в мапе DocumentsListModel
  DocumentsListModel? documentList;

  ///для поиска документов
  DocumentsListModel? searchDocumentList;

  ///Роут для получения списка документов по userId
  Future<void> getPatientDocumentsByUserId({required String userId}) async {
    documentList = await _services.getPatientDocumentsByUserIdData(
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
      userId: userId,
    );
    update();
  }

  ///Роут для получения достижения по его id +
  //  чтобы сохранять в текущей сессии и не тянyть из базы если есть в мапе Map<String, Achievement?> == idAchievement :  Achievement;
  Map<String, Achievement?> _achievement = {};

  Future<Achievement?> getAchievementsWithId(
      {required String idAchievement}) async {
    if (_achievement[idAchievement] == null) {
      final result = await _services.getAchievementsWithIdData(
        accessToken:
            ImplementAuthController.instance.userAuthorizedData!.accessToken,
        idAchievement: idAchievement,
      );
      _achievement[idAchievement] = result;
      update();
      return result;
    } else {
      return _achievement[idAchievement];
    }
  }

  File? photoProfile;

  ///Изменение аватарки пользователя
  void changePhotoProfile({required File? file}) {
    if (file != photoProfile) {
      photoProfile = file;
      update();
    }
  }

  Future<String?> postSetAvatarData() async {
    return await _services.postSetAvatarData(
      avatar: photoProfile!,
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
    );
  }

  ///лист с файлами фото для добавления нового документа
  List<File> listWithPhotoImage = [];

  void changeListWithPhotoImage(
      {int? index, File? file, bool isRemoveAll = false}) {
    if (isRemoveAll) {
      listWithPhotoImage = [];
      update();
      return;
    }
    if (file != null) {
      listWithPhotoImage.add(file);
      update();
    }

    if (index != null) {
      listWithPhotoImage.removeAt(index);
      update();
    }
  }

  ///Роут для загрузки файлов в создании документов (только картинки)
  Future<String?> postAttachmentsAndGetIdImage(
      {required File fileImage}) async {
    //возвращает Map данных {
    //   "id": "string",
    //   "userId": "string",
    //   "type": "string",
    //   "fileId": "string",
    //   "thumbnailFileId": "string",
    //   "createdAt": "string",
    //   "updatedAt": "string"
    // }
    return await _services.postAttachmentsAndGetIdImageData(
      fileImage: fileImage,
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
    );
  }

  ///Роут для создания документа пациента +
  Future<void> postPatientDocuments({
    required String category,
    required String title,
    required String? description,
    required List<String> attachmentsIds, //Массив с id вложений
  }) async {
    DocumentForIdModel? _res = await _services.postPatientDocumentsData(
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
      category: category,
      title: title,
      description: description,
      attachmentsIds: attachmentsIds,
    );
    if (_res != null && documentList != null) {
      documentList!.docs = [_res, ...documentList!.docs];
      update();
    }
  }
}
