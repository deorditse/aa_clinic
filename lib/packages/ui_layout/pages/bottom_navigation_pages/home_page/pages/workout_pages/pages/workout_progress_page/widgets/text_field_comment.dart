import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldComment extends StatelessWidget {
  TextFieldComment({Key? key}) : super(key: key);
  final Rx<bool> isComment = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => isComment.value
          ? Container(
              padding: EdgeInsets.only(top: myTopPaddingForContent),
              width: Get.width * 0.53,
              child: TextField(
                autofocus: true,
                cursorColor: myColorIsActive,
                decoration:
                    myStyleTextField(context, hintText: 'Комментарий...'),
                style: myTextStyleFontUbuntu(context: context),
                onSubmitted: (value) {},
                onChanged: (query) {},
              ),
            )
          : TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  EdgeInsets.zero,
                ),
              ),
              onPressed: () {
                isComment.value = !isComment.value;
              },
              child: Text(
                'Добавить комментарий...',
                style: myTextStyleFontUbuntu(
                    textColor: myColorIsActive.withOpacity(0.5),
                    context: context),
              ),
            ),
    );
  }
}
