import 'package:aa_clinic/packages/style_app/lib/src/consts_app.dart';
import 'package:aa_clinic/packages/style_app/lib/src/card_style.dart';
import 'package:aa_clinic/packages/style_app/lib/src/text_style.dart';
import 'package:aa_clinic/packages/style_app/lib/src/theme_app/custom_theme/material_theme/dark_custom_theme_material.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/main_bottom_menu_sceleton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> myDefaultDialogYesOrNo({
  TextEditingController? textEditingController,
  required BuildContext context,
  required String message,
  required VoidCallback voidCallbackToAccept,
  VoidCallback? voidCallbackCancel,
}) async {
  await Get.defaultDialog(
    // barrierDismissible: true,
    titlePadding: EdgeInsets.zero,
    contentPadding: EdgeInsets.zero,
    backgroundColor: Colors.transparent,
    content: _DefaultDialogBodyYesOrNo(
      message: message,
      voidCallbackToAccept: voidCallbackToAccept,
      textEditingController: textEditingController,
    ),
    title: "",
  );
}

class _DefaultDialogBodyYesOrNo extends StatelessWidget {
  const _DefaultDialogBodyYesOrNo({
    Key? key,
    required this.message,
    required this.voidCallbackToAccept,
    this.voidCallbackCancel,
    this.textEditingController,
  }) : super(key: key);
  final String message;
  final VoidCallback voidCallbackToAccept;
  final VoidCallback? voidCallbackCancel;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
        decoration: myStyleContainer(
            color: Theme.of(context).cardColor, context: context),
        child: Padding(
          padding: const EdgeInsets.only(
            top: myHorizontalPaddingForContainer,
            left: myHorizontalPaddingForContainer,
            right: myHorizontalPaddingForContainer,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Подтвердите действие",
                style: myTextStyleFontUbuntu(
                  context: context,
                ),
                textAlign: TextAlign.center,
              ),
              mySizedHeightBetweenContainer,
              Text(
                "Вы уверены, что ${message}",
                style: myTextStyleFontUbuntu(
                    context: context,
                    textColor: Theme.of(context).textTheme.headline3!.color),
                textAlign: TextAlign.center,
              ),
              if (textEditingController != null)
                Padding(
                  padding: EdgeInsets.only(
                    top: mySizedHeightBetweenContainer.height!,
                    bottom: mySizedHeightBetweenContainer.height!,
                  ),
                  child: TextField(
                    controller: textEditingController,
                    autofocus: false,
                    cursorColor: myColorIsActive,
                    decoration: myStyleTextField(context,
                        hintText: 'Причина отмены...'),
                    style: myTextStyleFontUbuntu(context: context),
                    onSubmitted: (value) {
                      textEditingController!.text = value;
                    },
                  ),
                ),
              _buttonRow(
                voidCallbackToAccept: voidCallbackToAccept,
                voidCallbackCancel: voidCallbackCancel,
                context: context,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_buttonRow({
  required VoidCallback voidCallbackToAccept,
  VoidCallback? voidCallbackCancel,
  required BuildContext context,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color.fromRGBO(224, 121, 114, 1),
          ),
        ),
        onPressed: () {
          voidCallbackCancel;
          Get.back();
        },
        child: Text('НАЗАД'),
      ),
      ElevatedButton(
        onPressed: () {
          voidCallbackToAccept();
          Get.offAllNamed('/');
        },
        child: Text('СОГЛАСИТЬСЯ'),
      ),
    ],
  );
}
