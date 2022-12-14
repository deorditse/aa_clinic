import 'dart:convert';
import 'dart:developer';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/widgets/message_types/alert_message.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/widgets/message_types/document.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/widgets/message_types/image.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/widgets/message_types/message/message.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/widgets/message_types/new_basket_for_you_widget/new_basket_for_you_widget.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/widgets/row_with_text_field_and_button.dart';
import 'package:business_layout/business_layout.dart';
import 'package:model/model.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/user_profile_page/user_profile_page.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/material_sceleton_without_borders.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:style_app/style_app.dart';

class MainBodyChatPage extends StatelessWidget {
  const MainBodyChatPage({
    required this.isOfficialChat,
    Key? key,
    required this.messageId,
    required this.chatId,
  }) : super(key: key);
  final bool isOfficialChat;
  final String? messageId;
  final String chatId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: myHorizontalPaddingForContainer),
        child: _BodyChatListWithMessage(
          isOfficialChat: isOfficialChat,
          chatId: chatId,
          messageId: messageId,
        ),
      ),
    );
  }
}

class _BodyChatListWithMessage extends StatelessWidget {
  const _BodyChatListWithMessage({
    Key? key,
    required this.chatId,
    required this.messageId,
    required this.isOfficialChat,
  }) : super(key: key);
  final String chatId;
  final String? messageId;
  final bool isOfficialChat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder<ChatMessagesModel?>(
            future: ChatPageControllerGetx.instance.getMessagesInChat(
              chatId: chatId,
              messageId: messageId,
              isOfficialChat: isOfficialChat,
            ),
            builder: (BuildContext context,
                AsyncSnapshot<ChatMessagesModel?> chatData) {
              return chatData.hasData
                  ? ListView.builder(
                      itemCount: messages.length,
                      physics: BouncingScrollPhysics(),
                      reverse: true,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            if (index == messages.length - 1)
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: myTopPaddingForContent),
                                child: AlertMessageWidget(
                                  message:
                                      'В этом чате вы можете общаться с нашими специалистами и получать квалифицированную помощь',
                                ),
                              ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 16, right: 16, top: 10, bottom: 10),
                              child: messages[index],
                            ),
                          ],
                        );
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: myColorIsActive,
                      ),
                    );
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // getMessagesInChatData(
            //   accessToken: ImplementAuthController
            //       .instance.userAuthorizedData!.accessToken,
            //   chatId: chatId,
            //   messageId: null,
            //   isOfficialChat: true,
            // );
          },
          child: Text('get'),
        ),
        RowWithTextFieldAndButton(),
      ],
    );
  }
}

List<Widget> messages = [
  MessageWidget(
    message: 'Why must I love a heartless one Who',
    isSendMessage: true,
  ),
  AlertMessageWidget(
    message: 'Назначен модератор',
  ),
  MessageWidget(
    message: 'Bye.',
    isSendMessage: false,
  ),
  NewBasketForYouWidget(),
  ImageWidget(
    imagePath:
        'https://www.annabelkarmel.com/wp-content/uploads/2022/04/brooke-lark-jUPOXXRNdcA-unsplash-scaled.jpg',
    isSendMessage: true,
  ),
  DocumentWidget(
    isSendMessage: false,
    nameDocument: 'Документ УЛ',
  ),
  ImageWidget(
    imagePath:
        'https://restoranto.com/wp-content/uploads/2021/04/t-d-EST2Ah4rGyI-unsplash-1536x2048.jpg',
    isSendMessage: false,
  ),
  DocumentWidget(
    isSendMessage: true,
    nameDocument: 'Документ УЛ',
  ),
];
