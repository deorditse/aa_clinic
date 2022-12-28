import 'dart:developer';
import 'dart:io';
import 'dart:convert';
import 'package:data_layout/data_layout.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:model/model.dart';

class ChatPageData {
  ///для чатов на странице со списком чатов
  Future<List<ChatFindManyModel?>> getChatsData({
    required String accessToken,
  }) async {
    try {
      Uri url = urlMain(urlPath: 'api/chats');

      var response = await http
          .get(url, headers: {"Authorization": "Bearer ${accessToken}"});

      print('Response status from getChatsData: ${response.statusCode}');
      log('getChatsData ChatFindManyModel ${response.body}');
      if (response.statusCode == 200) {
        List<ChatFindManyModel?> _resList = [];
        await jsonDecode(response.body).forEach((chat) {
          _resList.add(ChatFindManyModel.fromJson(chat));
        });

        return _resList;
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
          ? urlMain(urlPath: 'api/officialChatMessages')
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

  ///получить новое сообщение в чате
  Future<MessageModel?> getOneChatMessageWithIdData({
    required String accessToken,
    required String messageId,
    required String chatId,
  }) async {
    try {
      Uri url = urlMain(urlPath: 'api/chatMessages/$messageId');

      var response = await http
          .get(url, headers: {"Authorization": "Bearer ${accessToken}"});

      print(
          'Response status from getOneChatMessageWithIdData: ${response.statusCode}');
      log('getMessagesInId MessageModel ${response.body}');
      if (response.statusCode == 200) {
        // //прочитано сообщение
        await http.put(
          urlMain(urlPath: 'api/chatMessages/readChat/$chatId'),
          headers: {'Authorization': 'Bearer ${accessToken}'},
        );

        return await MessageModel.fromJson(
          json.decode(response.body),
        );
      }
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error getOneChatMessageWithIdData: $error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from getOneChatMessageWithIdData $error ');
    }
    return null;
  }

  ///Write message in chat
  Future<MessageModel?> postMessagesInChatData({
    required String accessToken,
    required bool isOfficialChat,
    required String? recipientId,
    required String? text,
    required List<String> attachmentsIds,
  }) async {
    try {
      Uri url = isOfficialChat
          ? urlMain(urlPath: 'api/officialChatMessages')
          : urlMain(urlPath: 'api/chatMessages');

      Map<String, dynamic> _jsonData = {
        "recipientId": recipientId,
        "text": text ?? '',
        "attachmentsIds": attachmentsIds,
      };
      var response = await http.post(
        url,
        headers: {
          "Authorization": "Bearer ${accessToken}",
          'Content-Type': 'application/json',
        },
        body: json.encode(_jsonData),
      );

      print(response.body);

      print(
          'Response status from ${isOfficialChat ? "isOfficialChat" : "chat"} postMessagesInChatData: ${response.statusCode}');
      log('postMessagesInChatData ${isOfficialChat ? "isOfficialChat" : "chats"} ${response.body}');
      if (response.statusCode == 201) {
        return await MessageModel.fromJson(
          jsonDecode(response.body),
        );
      }
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error ${isOfficialChat ? "isOfficialChat" : "chat"} postMessagesInChatData: $error}',
        snackPosition: SnackPosition.TOP,
      );
      print(
          'я в ошибке from ${isOfficialChat ? "isOfficialChat" : "chat"} postMessagesInChatData $error ');
    }
    return null;
  }
}
