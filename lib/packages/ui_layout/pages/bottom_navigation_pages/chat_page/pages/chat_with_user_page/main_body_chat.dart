import 'dart:async';

import 'package:aa_clinic/packages/data_layout/lib/data_layout.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/widgets/row_with_text_field_and_button.dart';
import 'package:business_layout/business_layout.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:style_app/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/widgets/message_types/alert_message.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/widgets/message_types/message.dart';

class MainBodyChatPage extends StatelessWidget {
  const MainBodyChatPage({
    required this.isOfficialChat,
    Key? key,
    required this.chatId,
  }) : super(key: key);
  final bool isOfficialChat;
  final String chatId;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatPageControllerGetx>(
      builder: (controllerChat) {
        return (controllerChat.mapWithMessage[chatId] != null)
            ? ListViewMessagesForChat(chatId: chatId)
            : Center(
                child: CircularProgressIndicator(
                  color: myColorIsActive,
                ),
              );
      },
    );
  }
}

class ListViewMessagesForChat extends StatelessWidget {
  const ListViewMessagesForChat({Key? key, required this.chatId})
      : super(key: key);
  final String chatId;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatPageControllerGetx>(
      builder: (controllerChat) {
        List<MessageModel> listChatMessages =
            controllerChat.mapWithMessage[chatId] ?? [];

        return listChatMessages.isNotEmpty
            ? Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  primary: true,
                  physics: BouncingScrollPhysics(),
                  reverse: true,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: myTopPaddingForContent),
                        child: AlertMessageWidget(
                          message:
                              'В этом чате вы можете общаться с нашими специалистами и получать квалифицированную помощь',
                        ),
                      ),
                      ListView.builder(
                        key: key,
                        itemCount: listChatMessages.length,
                        padding: EdgeInsets.zero,
                        primary: false,
                        reverse: true,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          MessageModel chatMessage = listChatMessages[index];
                          return MessageWidget(
                            chatMessage: chatMessage,
                            key: key,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            : Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: myTopPaddingForContent),
                    child: AlertMessageWidget(
                      message:
                          'В этом чате вы можете общаться с нашими специалистами и получать квалифицированную помощь',
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Нет сообщений",
                      style: myTextStyleFontUbuntu(
                        context: context,
                        newFontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
