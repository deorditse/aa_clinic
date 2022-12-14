import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/style/style_chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'icon_read_and_unread_message.dart';

class MessageWidget extends StatefulWidget {
  const MessageWidget(
      {Key? key, required this.message, required this.isSendMessage})
      : super(key: key);
  final String message;
  final bool isSendMessage;

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: myTopPaddingForContent),
      child: IconReadAndUnreadMessage(
        isSendMessage: widget.isSendMessage,
        isRead: true,
        child: Align(
          alignment: widget.isSendMessage
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: Get.width * 0.7,
            ),
            decoration: myStyleContainer(
              context: context,
              color: Get.isDarkMode
                  ? colorContainerIsDarkMode
                  : colorContainerIsLightkMode,
            ).copyWith(
              borderRadius: widget.isSendMessage
                  ? borderRadiusSendMessage()
                  : borderRadiusReceivedMessage(),
            ),
            child: Padding(
              padding: const EdgeInsets.all(myHorizontalPaddingForContainer),
              child: Text(
                widget.message,
                style: myTextStyleFontUbuntu(
                  textColor: Colors.white,
                  newFontWeight: FontWeight.w400,
                  fontSize: 15,
                  context: context,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
