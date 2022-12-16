import 'dart:developer';
import 'dart:io';
import 'dart:convert';
import 'package:data_layout/data_layout.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:model/model.dart';

class ChatPageData {
  void initSocketChat() {
    SettingPageData.socket?.on(
      'createChatMessage',
      (data) {
        print(data);
        print('ChatPageData initSocketChat data socket?');
      },
    );
  }

  ///для чатов на странице со списком чатов
  Future<List<ChatFindManyModel?>> getChatsData(
      {required String accessToken}) async {
    try {
      Uri url = urlMain(urlPath: '/api/chats');

      var response = await http.get(url, headers: {
        "Authorization": "Bearer ${accessToken}",
      });

      print('Response status from getChatsData: ${response.statusCode}');
      log('getChatsData ChatFindManyModel ${response.body}');
      if (response.statusCode == 200) {
        List<ChatFindManyModel?> _resList = [];
        await jsonDecode(response.body).forEach((chat) {
          _resList.add(ChatFindManyModel.fromJson(chat));
        });

        return _resList;
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request getChatsData: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error getChatsData: $error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from getChatsData $error ');
    }
    return [];
  }

  ///Route Get messages in chat (and official)
  Future<ChatMessagesModel?> getMessagesInChatData({
    required String accessToken,
    required bool isOfficialChat,
    required String? chatId,
    //messageId нужен для получения всех сообщений до определенного сообщения чей id указывается в параметре
  }) async {
    try {
      Uri url = isOfficialChat
          ? urlMain(urlPath: '/api/officialChatMessages')
          : urlMain(urlPath: 'api/chatMessages/inChat/$chatId');

      var response = await http
          .get(url, headers: {"Authorization": "Bearer ${accessToken}"});

      print(
          'Response status from getMessagesInChatData: ${response.statusCode}');
      log('getMessagesInChatData ${isOfficialChat ? "isOfficialChat" : "chats"} ChatMessagesModel ${response.body}');
      if (response.statusCode == 200) {
        //прочитано сообщение

        await http.put(
          urlMain(
              urlPath: isOfficialChat
                  ? 'api/officialChatMessages/read'
                  : 'api/chatMessages/readChat/$chatId'),
          headers: {'Authorization': 'Bearer ${accessToken}'},
        );

        return await ChatMessagesModel.fromJson(
          jsonDecode(response.body),
        );
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request getMessagesInChatData: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error getMessagesInChatData: $error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from getMessagesInChatData $error ');
    }
    return null;
  }
}
