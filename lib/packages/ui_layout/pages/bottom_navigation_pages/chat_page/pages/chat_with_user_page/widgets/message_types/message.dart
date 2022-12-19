import 'package:business_layout/business_layout.dart';
import 'package:model/model.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/widgets/container_for_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'document.dart';
import 'image.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({Key? key, required this.chatMessage}) : super(key: key);
  final MessageModel chatMessage;

  @override
  Widget build(BuildContext context) {
    bool isSendMessage = (chatMessage.senderId ==
        ImplementAuthController.instance.userAuthorizedData!.id);
    return ContainerForMessageWidget(
      isSendMessage: isSendMessage,
      isRead: chatMessage.isReaded,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            isSendMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (chatMessage.attachments.isNotEmpty)
            ImageWidget(
              isSendMessage: isSendMessage,
              attachments: chatMessage.attachments,
            ),
          if (chatMessage.text != "" && chatMessage.text != null)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: myHorizontalPaddingForContainer,
                vertical: myHorizontalPaddingForContainer,
              ),
              child: Text(

                chatMessage.text!.capitalizeFirst!,
                style: myTextStyleFontUbuntu(
                  textColor: Colors.white,
                  newFontWeight: FontWeight.w400,
                  fontSize: 15,
                  context: context,
                ),
              ),
            ),
          if (chatMessage.attachments.isNotEmpty)
            Container(
              constraints: BoxConstraints(maxWidth: Get.width / 2),
              child: ListView(
                padding: EdgeInsets.all(myHorizontalPaddingForContainer / 2),
                primary: false,
                shrinkWrap: true,
                children: [
                  ...chatMessage.attachments.map(
                    (attachment) {
                      if (attachment!.type != "image/jpeg") {
                        return DocumentWidget(
                          nameDocument: attachment.type ?? '',
                          isSendMessage: isSendMessage,
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
