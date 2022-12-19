import 'dart:io';
import 'package:business_layout/business_layout.dart';
import 'package:data_layout/data_layout.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:model/model.dart';
import 'package:hive/hive.dart';

class ProfileControllerGetxState extends GetxController {
  static ProfileControllerGetxState instance =
      Get.find<ProfileControllerGetxState>();

  final ProfilePageData _services = ProfilePageData();
  String? searchDocumentsListText;

  //для поиска документов
  void changeIsSearchingDocument({String? searchText}) {
    searchDocumentsListText = searchText;
    update();
    if (searchText != null && searchText != '') {
      getDocumentsList(
        currentDocsPage: 1,
        updateSearchResultDocumentList: true,
        searchText: searchText,
      );
    } else {
      searchResultDocumentList = null;
      update();
    }
  }

  @override
  void onInit() {
    initControllerProfile();
    super.onInit();
  }

  void initControllerProfile() {
    ImplementSettingGetXController.instance.getFindMe(isUpdateData: true).then(
      (userAllData) {
        //инициализация списка документов
        getDocumentsList(currentDocsPage: 1);
        //инициализация ачивок и статистики выполнения
        getAchievements();
      },
    );
  }

  ///Роут для получения списка достижений +
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
    _services
        .postPatientDocumentsData(
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
      category: category,
      title: title,
      description: description,
      attachmentsIds: attachmentsIds,
    )
        .whenComplete(() {
      getDocumentsList(currentDocsPage: 1, isReloatForAddNewDocument: true);
    });
  }

  /////////////////// DOCUMENTS

  ///список документов по умолчанию
  DocumentsListModel? documentList;

  ///для поиска документов
  DocumentsListModel? searchResultDocumentList;

  ///для выбора промежутка выдачи документов через календарь
  DocumentsListModel? rangeFromCalendarDocumentList;
  DateTime rangeStartForSearch = DateTime.now().add(const Duration(days: -6));
  DateTime? rangeEndForSearch = DateTime.now();

  void changeRangeDateTimeForSortDocumentsList({
    required DateTime newRangeStartForSearch,
    required DateTime? newRangeEndForSearch,
  }) {
    rangeStartForSearch = newRangeStartForSearch;
    rangeEndForSearch = newRangeEndForSearch;
    update();
  }

  ///роут для получения доков / выбранного промежутка / поиска доков
  Future<void> getDocumentsList({
    String? searchText,
    required int currentDocsPage,
    bool updateRangeFromCalendarDocumentList = false,
    bool updateSearchResultDocumentList = false,
    bool isReloatForAddNewDocument = false,
  }) async {
    //везде где вызываю этот метод, обновлять _mapKeyDocumentsListAndCurrentPageAndDocumentsListModel
    _services
        .getDocumentsListData(
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
      page: currentDocsPage,
      perPage: 6,
      searchText: searchText,
    )
        .then(
      (DocumentsListModel? newDocumentsList) {
        if (newDocumentsList != null) {
          if (updateRangeFromCalendarDocumentList) {
            if (rangeFromCalendarDocumentList != null) {
              rangeFromCalendarDocumentList!.page = newDocumentsList.page;
              rangeFromCalendarDocumentList!.docs = {
                ...rangeFromCalendarDocumentList!.docs,
                ...newDocumentsList.docs,
              };
              update();
            } else {
              rangeFromCalendarDocumentList = newDocumentsList;
              update();
            }

            return;
          } else if (updateSearchResultDocumentList &&
              (searchText != null && searchText != '')) {
            if (searchResultDocumentList != null) {
              searchResultDocumentList!.page = newDocumentsList.page;
              searchResultDocumentList!.docs = {
                ...searchResultDocumentList!.docs,
                ...newDocumentsList.docs,
              };
              update();
            } else {
              searchResultDocumentList = newDocumentsList;
              update();
            }

            return;
          } else {
            if (documentList != null && !isReloatForAddNewDocument) {
              documentList!.page = newDocumentsList.page;
              documentList!.docs = {
                ...documentList!.docs,
                ...newDocumentsList.docs,
              };
              update();
            } else {
              documentList = newDocumentsList;
              update();
            }
            return;
          }
        }
      },
    );
  }
}
