import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/style/style_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DocumentWidget extends StatefulWidget {
  const DocumentWidget(
      {Key? key, required this.nameDocument, required this.isSendMessage})
      : super(key: key);
  final String nameDocument;
  final bool isSendMessage;

  @override
  State<DocumentWidget> createState() => _DocumentWidgetState();
}

class _DocumentWidgetState extends State<DocumentWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: myTopPaddingForContent),
      child: Align(
        alignment:
            widget.isSendMessage ? Alignment.centerRight : Alignment.centerLeft,
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
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.nameDocument,
                  style: myTextStyleFontUbuntu(
                    textColor: Colors.white,
                    newFontWeight: FontWeight.w400,
                    fontSize: 15,
                    context: context,
                  ),
                ),
                SizedBox(
                  width: myTopPaddingForContent,
                ),
                SvgPicture.asset(
                  'assets/icons/chats/document_icon.svg',
                  semanticsLabel: 'document',
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
