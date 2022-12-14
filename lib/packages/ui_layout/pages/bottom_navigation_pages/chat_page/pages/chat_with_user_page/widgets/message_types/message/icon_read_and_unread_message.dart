import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/style/style_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
      mainAxisSize: MainAxisSize.max,
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
