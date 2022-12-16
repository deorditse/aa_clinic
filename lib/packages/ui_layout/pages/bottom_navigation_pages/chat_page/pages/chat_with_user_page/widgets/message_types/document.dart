import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/style/style_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DocumentWidget extends StatelessWidget {
  const DocumentWidget(
      {Key? key, required this.nameDocument, required this.isSendMessage})
      : super(key: key);
  final bool isSendMessage;
  final String nameDocument;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: isSendMessage
            ? borderRadiusSendMessage()
            : borderRadiusReceivedMessage(),
        border: Border.all(width: 1, color: Colors.white.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(myHorizontalPaddingForContainer),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Text(
                nameDocument,
                style: myTextStyleFontUbuntu(
                  textColor: Colors.white,
                  newFontWeight: FontWeight.w400,
                  fontSize: 15,
                  context: context,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SvgPicture.asset(
              'assets/icons/chats/document_icon.svg',
              semanticsLabel: 'document',
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
