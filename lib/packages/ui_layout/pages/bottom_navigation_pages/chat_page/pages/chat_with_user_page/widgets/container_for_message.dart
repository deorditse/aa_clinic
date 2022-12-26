import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/style/style_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ContainerForMessageWidget extends StatelessWidget {
  const ContainerForMessageWidget({
    Key? key,
    required this.child,
    required this.isSendMessage,
    required this.isRead,
    this.isCenter = false,
  }) : super(key: key);
  final Widget child;
  final bool isRead;
  final bool isSendMessage;
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: myTopPaddingForContent),
      child: IconReadAndUnreadMessage(
        isSendMessage: isSendMessage,
        isRead: isRead,
        child: Align(
          alignment: isCenter
              ? Alignment.center
              : isSendMessage
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: Get.width * 0.7,
            ),
            decoration: myStyleContainer(
              context: context,
              color: Theme.of(context).brightness == Brightness.dark
                  ? colorContainerIsDarkMode
                  : colorContainerIsLightkMode,
            ).copyWith(
              borderRadius: isSendMessage
                  ? borderRadiusSendMessage()
                  : borderRadiusReceivedMessage(),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class IconReadAndUnreadMessage extends StatelessWidget {
  const IconReadAndUnreadMessage({
    Key? key,
    required this.isSendMessage,
    required this.isRead,
    required this.child,
  }) : super(key: key);
  final bool isSendMessage;
  final bool isRead;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment:
          isSendMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (isSendMessage) _isRead(isRead: isRead),
        child,
        if (!isSendMessage) _isRead(isRead: isRead),
      ],
    );
  }

  SvgPicture _isRead({required bool isRead}) {
    return SvgPicture.asset(
      isRead
          ? 'assets/icons/chats/read message.svg'
          : 'assets/icons/chats/unread_message.svg',
      semanticsLabel: 'read_unread_message',
      fit: BoxFit.contain,
    );
  }
}
