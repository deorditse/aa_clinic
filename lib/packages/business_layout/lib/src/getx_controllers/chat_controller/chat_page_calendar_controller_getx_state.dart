import 'dart:collection';
import 'package:business_layout/business_layout.dart';
import 'package:data_layout/data_layout.dart';
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
    await _getChatsFindMany();
    _services.initSocketChat();
  }

  bool isSearchingChats = false;

  void changeIsSearchingChats({bool? isSearching}) {
    isSearchingChats = isSearching ?? !isSearchingChats;
    update();
  }

  ///для чатов на странице со списком чатов
  List<ChatFindManyModel?> listChats = [];

  Future<void> _getChatsFindMany() async {
    listChats = await _services.getChatsData(
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
    );
    update();
  }

  ///Route Get messages in chat (and official)
  Future<ChatMessagesModel?> getMessagesInChat({
    required bool isOfficialChat,
    required String? chatId,
    //messageId нужен для получения всех сообщений до определенного сообщения чей id указывается в параметре
  }) async {
    return await _services.getMessagesInChatData(
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
      chatId: chatId,
      isOfficialChat: isOfficialChat,
    );
  }
}
