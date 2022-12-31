import 'dart:io';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/sceleton_show_bottomSheet.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void showAddPhotoBottomSheetWidgetProfilePage({required context}) {
  showBottomSheetContainer(
    context: context,
    titleAppBar: 'Добавить фото',
    backLine: true,
    onlyBack: false,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    widgetBody: const _AddPhotoBottomSheetWidget(),
  );
}

class _AddPhotoBottomSheetWidget extends StatelessWidget {
  const _AddPhotoBottomSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView(
          shrinkWrap: true,
          primary: false,
          children: [
            Card(
              child: ListTile(
                onTap: () async {
                  Navigator.of(context).pop();
                  await _pickImageFromGallery();
                },
                title: const Text('Из галереи'),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () async {
                  Navigator.of(context).pop();
                  await _pickImageFromCamera();
                },
                title: const Text('Сделать фото'),
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

      await Permission.photos.request();
    } else if (await Permission.photos.isPermanentlyDenied) {
      //если навсегда отключена mediaLibrary
      openAppSettings();
    } else {
      final XFile? image =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      ProfileControllerGetxState.instance
          .changeListWithPhotoImage(file: imageTemporary);

      ///сделал сохранение на сервер
    }
  }

  Future _pickImageFromCamera() async {
    //проверю сначала разрешения
    if (await Permission.camera.status.isDenied) {

      await Permission.camera.request();
    } else if (await Permission.camera.isPermanentlyDenied) {
      //если навсегда отключена camera
      openAppSettings();
    } else {
      final XFile? image =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      final imageTemporary = File(image.path);
      ProfileControllerGetxState.instance.changeListWithPhotoImage(
        file: imageTemporary,
      );
    }
  }
}
