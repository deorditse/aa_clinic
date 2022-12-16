import 'dart:async';

import 'package:aa_clinic/packages/data_layout/lib/data_layout.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/widgets/row_with_text_field_and_button.dart';
import 'package:business_layout/business_layout.dart';
import 'package:model/model.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:style_app/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/widgets/message_types/alert_message.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/widgets/message_types/message.dart';
import 'package:http/http.dart' as http;
import 'package:model/model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

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
    return FutureBuilder<ChatMessagesModel?>(
      future: ChatPageControllerGetx.instance.getMessagesInChat(
        chatId: chatId,
        isOfficialChat: isOfficialChat,
      ),
      builder:
          (BuildContext context, AsyncSnapshot<ChatMessagesModel?> chatData) {
        return chatData.hasData
            ? ListViewMessagesForChat(
                chatMessages: chatData.data!,
              )
            : Center(
                child: CircularProgressIndicator(
                  color: myColorIsActive,
                ),
              );
      },
    );
  }
}

class ListViewMessagesForChat extends StatefulWidget {
  const ListViewMessagesForChat({Key? key, required this.chatMessages})
      : super(key: key);
  final ChatMessagesModel chatMessages;

  @override
  State<ListViewMessagesForChat> createState() =>
      _ListViewMessagesForChatState();
}

class _ListViewMessagesForChatState extends State<ListViewMessagesForChat> {
  IO.Socket? socket;

  void socketConnect({
    required String? accessToken,
  }) {
    socket?.on(
      'connected',
      (data) => {print(data)},
    );
    // socket?.onConnect((data) => print("connection"));
    socket?.onConnectError((data) => print(data));
    socket?.onError((data) => {print(data)});
    socket?.onDisconnect((data) => {});
  }

  @override
  void initState() {
    super.initState();
    socket = IO.io(
      "https://$urlMainApiConst",
      IO.OptionBuilder().setTransports(['websocket']).setAuth({
        "token":
            ImplementAuthController.instance.userAuthorizedData!.accessToken
      }).build(),
    );
    socketConnect(
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<MessageModel> listChatMessages = widget.chatMessages.docs;
    return widget.chatMessages.docs.isNotEmpty
        ? Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              primary: true,
              physics: BouncingScrollPhysics(),
              reverse: true,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: myTopPaddingForContent),
                    child: AlertMessageWidget(
                      message:
                          'В этом чате вы можете общаться с нашими специалистами и получать квалифицированную помощь',
                    ),
                  ),
                  ListView.builder(
                    itemCount: listChatMessages.length,
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      MessageModel chatMessage = listChatMessages[index];
                      return MessageWidget(
                        chatMessage: chatMessage,
                      );
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _main();
                      },
                      child: Text('test'))
                ],
              ),
            ),
          )
        : Center(
            child: Text(
              "Нет сообщений",
              style: myTextStyleFontUbuntu(
                context: context,
                newFontWeight: FontWeight.w100,
              ),
            ),
          );
  }

  _main() {
    socket?.on('createChatMessage', (data) => print(data));
  }
}
