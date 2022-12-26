import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:aa_clinic/packages/data_layout/lib/data_layout.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:model/model.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/style/style_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:business_layout/business_layout.dart';
import 'package:open_filex/open_filex.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'web_view_page.dart';

class DocumentWidget extends StatelessWidget {
  const DocumentWidget(
      {Key? key, required this.attachment, required this.isSendMessage})
      : super(key: key);
  final bool isSendMessage;
  final AttachmentModel attachment;

  @override
  Widget build(BuildContext context) {
    Future<String?> getDownloadPath() async {
      Directory? directory;
      try {
        if (Platform.isIOS) {
          directory = await getApplicationDocumentsDirectory();
        } else {
          directory = Directory('/storage/emulated/0/Download');

          if (!await directory.exists())
            directory = await getExternalStorageDirectory();
        }
      } catch (err, stack) {
        print("Cannot get download folder path");
      }
      return directory?.path;
    }

    return GestureDetector(
      onTap: () async {
        getDownloadPath().then(
          (path) async {
            print(path);
            if (await Permission.storage.status.isDenied) {
              await Permission.storage.request();
            } else if (await Permission.storage.isPermanentlyDenied) {
              //если навсегда отключена mediaLibrary
              openAppSettings();
            } else {
              //save file
              ImplementSettingGetXController.instance
                  .getStaticFilesStorageAsUTF8(
                coverFileId: attachment.fileId!,
              )
                  .then(
                (Map<int, Uint8List?>? mapData) async {
                  Get.snackbar("Загрузка файла в папку download", '',
                      snackPosition: SnackPosition.TOP);
                  if (mapData != null) {
                    File file = await File(
                            '${path}/${attachment.type!.split("/").last}')
                        .create(recursive: true);
                    await file.writeAsBytes(mapData.values.single!);
                  }
                },
              );
            }
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: isSendMessage
              ? borderRadiusSendMessage()
              : borderRadiusReceivedMessage(),
          border: Border.all(width: 1, color: Colors.white.withOpacity(0.2)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(myHorizontalPaddingForContainer),
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Text(
                  ("Документ ${attachment.type!.split("/").last}"),
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
      ),
    );
  }
}
