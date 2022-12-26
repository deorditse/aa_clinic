import 'package:model/model.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/style/style_chat.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/container_for_photo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget(
      {Key? key, required this.attachments, required this.isSendMessage})
      : super(key: key);
  final List<AttachmentModel?> attachments;
  final bool isSendMessage;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      primary: false,
      shrinkWrap: true,
      children: [
        ...attachments.map(
          (attachment) {
            if (attachment!.type == "image/jpeg") {
              return Container(
                height: Get.height / 4,
                child: ContainerForPhotoFuture(
                  coverFileId: attachment.fileId,
                  openView: true,
                  borderRadius: 16,
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }
}
