import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:aa_clinic/packages/data_layout/lib/data_layout.dart';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/sceleton_show_bottomSheet.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:model/model.dart';
import 'package:http/http.dart' as http;

void showAddPhotoFoodBottomSheetWidgetHomePage(
    {required BuildContext context,
    required int indexDish,
    required String targetId}) {
  showBottomSheetContainer(
    context: context,
    titleAppBar: 'Добавление фото еды',
    backLine: true,
    onlyBack: false,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    widgetBody:
        _AddPhotoBottomSheetWidget(indexDish: indexDish, targetId: targetId),
  );
}

class _AddPhotoBottomSheetWidget extends StatelessWidget {
  const _AddPhotoBottomSheetWidget(
      {Key? key, required this.targetId, required this.indexDish})
      : super(key: key);
  final String targetId;
  final int indexDish;

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
                  await _pickImageFromGallery(
                      targetId: targetId, indexDish: indexDish);
                },
                title: const Text('Из галереи'),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () async {
                  Navigator.of(context).pop();
                  await _pickImageFromCamera(
                      targetId: targetId, indexDish: indexDish);
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

  Future _pickImageFromGallery({
    required String targetId,
    required int indexDish,
  }) async {
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
      final XFile? image =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);

      HomePageCalendarControllerGetxState.instance.changePhotoFood(
        targetId: targetId,
        file: imageTemporary,
        indexDish: indexDish,
      );
    }
  }

  Future _pickImageFromCamera(
      {required String targetId, required int indexDish}) async {
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
      HomePageCalendarControllerGetxState.instance.changePhotoFood(
        targetId: targetId,
        file: imageTemporary,
        indexDish: indexDish,
      );
    }
  }
}
