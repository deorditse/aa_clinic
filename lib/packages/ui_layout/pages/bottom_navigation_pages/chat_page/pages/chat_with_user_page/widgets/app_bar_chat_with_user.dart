import 'dart:io';

import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/model/lib/model.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/container_for_photo.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';

class ChatMaterialAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(myToolbarHeight);

  ChatMaterialAppBar({
    Key? key,
    this.rightVoidCallback,
    this.unreadedMessages,
    required this.title,
    this.fontSizeAppBar,
    this.isSvgImage = false,
    this.subTitle,
    this.imagePath,
  }) : super(key: key);
  final VoidCallback? rightVoidCallback;
  final String title;
  final double? fontSizeAppBar;
  final String? subTitle;
  final String? imagePath;
  final bool isSvgImage;
  final int? unreadedMessages;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).cardColor,
      leadingWidth: 50,
      // toolbarHeight: myToolbarHeight,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            myIconBackAppBar(context: context),
            if (unreadedMessages != null && unreadedMessages != 0)
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, left: 20),
                  child: Container(
                    width: double.maxFinite,
                    decoration: myStyleContainer(
                        context: context, color: myColorIsActive),
                    child: Text(
                      unreadedMessages != null ? '$unreadedMessages' : '0',
                      textAlign: TextAlign.center,
                      style: myTextStyleFontUbuntu(
                        fontSize: 14,
                        newFontWeight: FontWeight.w500,
                        context: context,
                        textColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),

      toolbarHeight:
          Platform.isAndroid ? myToolbarHeight + 10 : myToolbarHeight + 5,
      // floating: false,
      // pinned: true,
      //что эпп бар будет зафиксен после скролла
      title: GestureDetector(
        onTap: rightVoidCallback,
        child: Center(
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: FittedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FittedBox(
                      child: Text(
                        title,
                        style: myTextStyleFontUbuntu(
                          fontSize: fontSizeAppBar ?? 16,
                          context: context,
                          textColor:
                              Theme.of(context).textTheme.headline1!.color,
                          newFontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    if (subTitle != null)
                      FittedBox(
                        child: Text(
                          subTitle!.capitalizeFirst!,
                          style: myTextStyleFontUbuntu(
                            fontSize: 12,
                            textColor:
                                Theme.of(context).textTheme.headline3!.color,
                            newFontWeight: FontWeight.w300,
                            context: context,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

      actions: [
        _widgetRightAppBar(context: context),
      ],
    );
  }

  _widgetRightAppBar({
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: rightVoidCallback,
      child: (imagePath != null && imagePath != '')
          ? CircleAvatar(
              backgroundColor: Colors.transparent,
              child: isSvgImage
                  ? Padding(
                      padding: EdgeInsets.only(bottom: 6, right: 6),
                      child: FittedBox(
                        child: SvgPicture.asset(
                          "$imagePath",
                          semanticsLabel: 'addNewEvent',
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(bottom: 6, right: 6),
                      child: ContainerForPhotoFuture(
                        coverFileId: imagePath,
                        isCircular: true,
                      ),
                    ),
            )
          : FittedBox(child: Icon(Icons.person)),
    );
  }
}
