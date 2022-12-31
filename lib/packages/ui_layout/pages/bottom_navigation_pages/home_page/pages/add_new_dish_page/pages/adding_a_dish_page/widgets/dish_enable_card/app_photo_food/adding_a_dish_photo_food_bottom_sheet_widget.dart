import 'dart:io';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/add_new_dish_page/pages/adding_a_dish_page/adding_a_dish_page.dart';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/sceleton_show_bottomSheet.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void addingADishPhotoFoodBottomSheetWidgetHomePage(
    {required context, required int indexDishCard}) {
  showBottomSheetContainer(
    context: context,
    titleAppBar: 'Добавление фото блюда',
    backLine: true,
    onlyBack: false,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    widgetBody: _AddPhotoBottomSheetWidget(
      indexDishCard: indexDishCard,
    ),
  );
}

class _AddPhotoBottomSheetWidget extends StatelessWidget {
  const _AddPhotoBottomSheetWidget({Key? key, required this.indexDishCard})
      : super(key: key);
  final int indexDishCard;

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
      ImplementAddNewDishController.instance.changeListAddDishEnableCard(
        index: indexDishCard,
        file: imageTemporary,
      );

      if (listIndexWherePhotosNotAdded.contains(indexDishCard)) {
        listIndexWherePhotosNotAdded.remove(indexDishCard);
      }
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
      ImplementAddNewDishController.instance.changeListAddDishEnableCard(
        index: indexDishCard,
        file: imageTemporary,
      );

      if (listIndexWherePhotosNotAdded.contains(indexDishCard)) {
        listIndexWherePhotosNotAdded.remove(indexDishCard);
      }
    }
  }
}
