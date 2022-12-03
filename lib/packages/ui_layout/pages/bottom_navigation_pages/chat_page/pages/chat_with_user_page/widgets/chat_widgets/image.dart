import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/style/style_chat.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget(
      {Key? key, required this.imagePath, required this.isSendMessage})
      : super(key: key);
  final String imagePath;
  final bool isSendMessage;

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: myTopPaddingForContent),
      child: Align(
        alignment:
            widget.isSendMessage ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
            height: Get.height / 3.5,
            width: Get.width * 0.47,
            clipBehavior: Clip.antiAlias,
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
            child: CachedNetworkImage(imageUrl:
              widget.imagePath,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
