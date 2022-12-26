import 'dart:io';
import 'package:business_layout/business_layout.dart';
import 'package:data_layout/data_layout.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

//каждый раз при изменении запускать кодогенерацию
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs
//чтобы зарегистрировать как фабрику для GetIt и обращаться к сервис локатору через  MainSimpleStateManagement

class ChatPageControllerGetx extends GetxController {
  static ChatPageControllerGetx instance = Get.find<ChatPageControllerGetx>();
  final ChatPageData _services = ChatPageData();

  @override
  void onInit() {
    super.onInit();
    initialChatController();
  }

  Future<void> initialChatController() async {
    await getChatsFindMany();

    print("createOfficialChatMessage socket");
    SettingPageData.socket?.on(
      'createOfficialChatMessage',
      (data) {
        MessageModel _message = MessageModel.fromJson(data);
        print("createOfficialChatMessage new message ${_message}");

        if (_message.senderId !=
            ImplementAuthController.instance.userAuthorizedData?.id) {
          Get.snackbar(
            'Новое сообщение',
            '${_message.text}',
            snackPosition: SnackPosition.TOP,
          );
        }
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
      },
    );

    print("createChatMessage socket");
    SettingPageData.socket?.on(
      'createChatMessage',
      (data) async {
        //socketCreateChatMessage{
        // id	string
        // chatId	string
        // senderId	string
        // recipientId	string
        // example: 634be2093f86cd440599aff4
        // }
        ///получить новое сообщение в чате
        MessageModel? _message = await _services.getOneChatMessageWithIdData(
          accessToken:
              ImplementAuthController.instance.userAuthorizedData!.accessToken,
          messageId: data["id"],
        );
        print("createChatMessage new message ${_message}");

        if (_message != null) {
          if (_message.senderId !=
              ImplementAuthController.instance.userAuthorizedData?.id) {
            Get.snackbar(
              'Новое сообщение',
              '${_message.text}',
              snackPosition: SnackPosition.TOP,
            );
          }
          mapWithMessage[_message.chatId]!.insert(0, _message);
          update();
        }
      },
    );
  }

  ///для поиска статей
  Map<String, List<ChatFindManyModel?>?> mapNameSearchAndChatFindManyModel = {};

  String? searchingChatsText;

  //для поиска документов
  void changeIsSearchingChats({String? searchText}) {
    if (searchText != null) {
      searchingChatsText = searchText;
      update();
    } else if (searchText != null && searchText != '') {
      getChatsFindMany(searchText: searchText);
    } else {
      searchingChatsText = null;
      update();
    }
  }

  ///для чатов на странице со списком чатов
  List<ChatFindManyModel?>? listChats;

  Future<void> getChatsFindMany({String? searchText}) async {
    if (searchText != null) {
      mapNameSearchAndChatFindManyModel[searchText] =
          await _services.getChatsData(
        searchText: searchText,
        accessToken:
            ImplementAuthController.instance.userAuthorizedData!.accessToken,
      );
      update();
    } else {
      listChats = await _services.getChatsData(
        searchText: searchText,
        accessToken:
            ImplementAuthController.instance.userAuthorizedData!.accessToken,
      );
      update();
    }
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

  Future<void> addNewMessage({
    required String accessToken,
    required bool isOfficialChat,
    required String? recipientId,
    required String? text,
    required String chatId,
  }) async {
    update();
    List<String> attachmentsIds = [];
    if (listWithPhotoImage.isNotEmpty) {
      for (var image in listWithPhotoImage) {
        if (image?.path != null) {
          String? _res = await ImplementSettingGetXController.instance
              .postStaticFilesAndGetIdImage(filePath: image!.path);
          if (_res != null) {
            attachmentsIds.add(_res);
          }
        }
      }
      print("listWithPhotoImage.isNotEmpty ${attachmentsIds}");
    }

    changeListWithPhotoImage(isRemoveAll: true);

    if (listDocuments.isNotEmpty) {
      for (var doc in listDocuments) {
        if (doc.path != null) {
          String? _res = await ImplementSettingGetXController.instance
              .postStaticFilesAndGetIdImage(filePath: doc.path!);
          if (_res != null) {
            attachmentsIds.add(_res);
          }
        }
      }
    }

    uploadDocument(isDeleteListDocuments: true);

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
