import 'dart:io';
import 'package:business_layout/business_layout.dart';
import 'package:data_layout/data_layout.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';
import 'package:http/http.dart' as http;

//каждый раз при изменении запускать кодогенерацию
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs
//чтобы зарегистрировать как фабрику для GetIt и обращаться к сервис локатору через  MainSimpleStateManagement

class ChatPageControllerGetx extends GetxController {
  static ChatPageControllerGetx instance = Get.find<ChatPageControllerGetx>();
  final ChatPageData _services = ChatPageData();

  @override
  void onInit() {
    super.onInit();
    getChatsFindMany();
    _initialSocketChatController();
  }

  Future<void> _initialSocketChatController() async {
    print("createOfficialChatMessage socket");
    SettingPageData.socket?.on(
      'createOfficialChatMessage',
      (data) async {
        MessageModel _message = MessageModel.fromJson(data);
        print("createOfficialChatMessage new message ${_message}");
        mapWithMessage["AAClinic"]!.insert(0, _message);
        update();

        //получаем инфо о вложениях, если есть
        _message.attachmentsIds.forEach(
          (attachmentId) async {
            if (attachmentId != null) {
              AttachmentModel? _res = await ImplementSettingGetXController
                  .instance
                  .getAttachmentInfo(idAttachment: attachmentId);
              if (_res != null) {
                mapWithMessage["AAClinic"]![0].attachments.add(_res);
                update();
              }
            }
          },
        );
        //прочитано сообщение
        await http.put(
          urlMain(urlPath: 'api/officialChatMessages/read'),
          headers: {
            'Authorization':
                'Bearer ${ImplementAuthController.instance.userAuthorizedData!.accessToken}'
          },
        );
      },
    );

    print("createChatMessage socket");
    SettingPageData.socket?.on(
      'createChatMessage',
      (data) async {
        ///получить новое сообщение в чате
        MessageModel? _message = await _services.getOneChatMessageWithIdData(
          accessToken:
              ImplementAuthController.instance.userAuthorizedData!.accessToken,
          messageId: data["id"],
          chatId: data['chatId'],
        );
        print("createChatMessage new message ${_message}");

        if (_message != null) {
          mapWithMessage[_message.chatId]!.insert(0, _message);
          update();
        }
      },
    );
  }

//для поиска документов
  ///для поиска статей
  Map<String, Set<ChatFindManyModel>> mapNameSearchAndChatFindManyModel = {};
  String? searchingChatsText;

  void changeIsSearchingChats({String? searchText}) {
    searchingChatsText = searchText;
    update();
    if (searchText != null && searchText != '' && searchText.isNotEmpty) {
      listChats?.forEach(
        (chat) {
          if (chat == null) {
            return;
          }

          searchText.split(' ').forEach(
            (seText) {
              UserMinifiedDataIdModel? _fio = chat.userMinifiedData;
              if ((_fio?.firstName != null &&
                      _fio!.firstName!.contains(seText.capitalizeFirst!)) ||
                  (_fio?.middleName != null &&
                      _fio!.middleName!.contains(seText.capitalizeFirst!)) ||
                  (_fio?.lastName != null &&
                      _fio!.lastName!.contains(seText.capitalizeFirst!))) {
                print("$seText   ${chat}");
                if (mapNameSearchAndChatFindManyModel[searchText] == null) {
                  mapNameSearchAndChatFindManyModel[searchText] = {chat};
                  update();
                } else {
                  mapNameSearchAndChatFindManyModel[searchText]!.add(chat);
                  update();
                }
                print(mapNameSearchAndChatFindManyModel[searchText]);
              }
            },
          );
        },
      );
    }
  }

  ///для чатов на странице со списком чатов
  List<ChatFindManyModel?>? listChats;

  Future<void> getChatsFindMany() async {
    _services
        .getChatsData(
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
    )
        .then(
      (getListChats) {
        listChats = [];
        update();
        if (getListChats.isNotEmpty) {
          getListChats.forEach(
            (chat) async {
              if (chat != null && chat.specialistId != null) {
                ImplementSettingGetXController.instance
                    .getDataUserMinified(idUser: chat.specialistId!)
                    .then(
                  (userMD) {
                    chat.userMinifiedData = userMD;
                    listChats!.add(chat);
                    update();
                  },
                );
              }
            },
          );
        }
      },
    );
  }

  ///сохранение в локали сообщений {chatId : ChatMessagesModel?}
  Map<String, List<MessageModel>> mapWithMessage = {};

  ///Route Get messages in chat (and official)

  Future<void> getMessagesInChat({
    required bool isOfficialChat,
    required String chatId,
    bool isUpdate = false,
    //messageId нужен для получения всех сообщений до определенного сообщения чей id указывается в параметре
  }) async {
    if (mapWithMessage[chatId] == null || isUpdate) {
      await _services
          .getMessagesInChatData(
        accessToken:
            ImplementAuthController.instance.userAuthorizedData!.accessToken,
        chatId: chatId,
        isOfficialChat: isOfficialChat,
      )
          .then(
        (messagesForChat) {
          if (messagesForChat != null) {
            mapWithMessage[chatId] = messagesForChat.docs;
            update();
          }
        },
      );
    }
  }

  bool isSendMessageLoading = false;

  Future<void> addNewMessage({
    required String accessToken,
    required bool isOfficialChat,
    required String? recipientId,
    required String? text,
    required String chatId,
  }) async {
    if ((text == "" || text == null) &&
        listWithPhotoImage.isEmpty &&
        listDocuments.isEmpty) {
      return;
    }
    isSendMessageLoading = true;
    update();
    List<String> attachmentsIds = [];
    List<File?> _listWithPhoto = listWithPhotoImage;
    List<PlatformFile> _listDocuments = listDocuments;
    uploadDocument(isDeleteListDocuments: true);
    changeListWithPhotoImage(isRemoveAll: true);

    if (_listWithPhoto.isNotEmpty) {
      for (var image in _listWithPhoto) {
        if (image?.path != null) {
          String? _res = await ImplementSettingGetXController.instance
              .postStaticFilesAndGetIdImage(filePath: image!.path);
          if (_res != null) {
            attachmentsIds.add(_res);
            update();
          }
        }
      }
      print("listWithPhotoImage.isNotEmpty ${attachmentsIds}");
    }

    if (_listDocuments.isNotEmpty) {
      for (var doc in _listDocuments) {
        if (doc.path != null) {
          String? _res = await ImplementSettingGetXController.instance
              .postStaticFilesAndGetIdImage(filePath: doc.path!);
          if (_res != null) {
            attachmentsIds.add(_res);
            update();
          }
        }
      }
    }

    print(
        "attachmentsIds для загрузки через postMessagesInChatData ${attachmentsIds}");
    await _services.postMessagesInChatData(
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
      isOfficialChat: isOfficialChat,
      recipientId: recipientId,
      text: text,
      attachmentsIds: attachmentsIds,
    );
    isSendMessageLoading = false;
    update();
  }

  ///лист с файлами фото для добавления в чат
  List<File?> listWithPhotoImage = [];

  void changeListWithPhotoImage(
      {int? index, List<File>? listImages, bool isRemoveAll = false}) {
    if (isRemoveAll) {
      listWithPhotoImage = [];
      update();
      return;
    }
    if (listImages != null) {
      listWithPhotoImage = [...listImages, ...listWithPhotoImage];
      update();
    }
    if (index != null) {
      listWithPhotoImage.removeAt(index);
      update();
    }
  }

  ///лист с файлами документов для добавления в чат
  List<PlatformFile> listDocuments = [];

  Future<void> uploadDocument({
    isDeleteListDocuments = false,
    PlatformFile? file,
    int? indexForDelete,
  }) async {
    if (isDeleteListDocuments) {
      listDocuments = [];
      update();
      return;
    }

    if (indexForDelete != null) {
      listDocuments.removeAt(indexForDelete);
      update();
      return;
    }

    FilePickerResult? docFile = await FilePicker.platform.pickFiles();

    if (docFile != null) {
      listDocuments.add(docFile.files.first);
      update();
    }

    // if (file != null) {
    //   listDocuments.add(file!);
    //   update();
    // }
  }
}
