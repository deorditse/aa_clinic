import 'dart:io';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/sceleton_show_bottomSheet.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void showAddFileBottomSheetWidgetInChatPage({required context}) {
  showBottomSheetContainer(
    context: context,
    // titleAppBar: null,
    // backLine: true,
    deleteAppBar: true,
    onlyBack: false,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    widgetBody: const _AddFileBottomSheetWidgetInChatPage(),
    titleAppBar: 'Добавить файл',
  );
}

class _AddFileBottomSheetWidgetInChatPage extends StatelessWidget {
  const _AddFileBottomSheetWidgetInChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: myBackLineInAppBar(context: context)),
        ListView(
          shrinkWrap: true,
          primary: false,
          children: [
            Card(
              child: ListTile(
                onTap: () async {
                  Navigator.of(context).pop();
                  await _pickImageFromCamera();
                },
                title: const Text('Сделать фото'),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () async {
                  Navigator.of(context).pop();
                  await _pickImageFromGallery();
                },
                title: const Text('Добавить фото из галереи'),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () async {
                  Navigator.of(context).pop();
                  ChatPageControllerGetx.instance.uploadDocument();
                },
                title: const Text('Прикрепить документ'),
              ),
            ),
          ],
        ),
        mySizedHeightBetweenContainer,
      ],
    );
  }

  Future _pickImageFromGallery() async {
    if (await Permission.photos.status.isDenied) {
      Get.snackbar(
        'Необходим доступ к галереи',
        'Для дабавления фото',
      );
      await Permission.photos.request();
    } else if (await Permission.photos.isPermanentlyDenied) {
      //если навсегда отключена mediaLibrary
      openAppSettings();
    } else {
      final List<XFile>? listImages = await ImagePicker().pickMultiImage();

      if (listImages == null) return;

      List<File> _listWithPhotoImage =
          listImages.map((image) => File(image.path)).toList();

      ChatPageControllerGetx.instance
          .changeListWithPhotoImage(listImages: _listWithPhotoImage);

      ///сделал сохранение на сервер
    }
  }

  Future _pickImageFromCamera() async {
    //проверю сначала разрешения
    if (await Permission.camera.status.isDenied) {
      Get.snackbar(
        'Необходим доступ к камере',
        'Для дабавления фото',
      );
      await Permission.camera.request();
    } else if (await Permission.camera.isPermanentlyDenied) {
      //если навсегда отключена camera
      openAppSettings();
    } else {
      final XFile? image =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      final imageTemporary = File(image.path);
      ProfileControllerGetxState.instance
          .changeListWithPhotoImage(file: imageTemporary);
    }
  }
}
