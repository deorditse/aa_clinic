import 'dart:io';

import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/app_bars/material_app_bar.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/search_widget.dart';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/app_bars/sliver_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';

class MyMaterialNewPageWithoutBorder extends StatelessWidget {
  const MyMaterialNewPageWithoutBorder({
    Key? key,
    required this.titleAppBar,
    required this.widgetBody,
    this.onlyBack = true,
    this.bodyScreensToGo,
    this.widgetRightAppBar,
    this.widgetTitleAppBar,
    this.backgroundColor,
    this.imageBackgroundName,
    this.widgetAfterBody,
    this.deleteAppBar = false,
    this.paddingHorizontalContent,
    this.fontSizeAppBar,
    this.primary,
    this.subTitle,
    this.myNewMaterialAppBar,
    this.callbackTopRefreshIndicator,
    this.isSafeArea = true,
  }) : super(key: key);
  final bool isSafeArea;
  final Widget? myNewMaterialAppBar;
  final double? paddingHorizontalContent;
  final String titleAppBar;
  final Widget widgetBody;
  final Widget? widgetAfterBody;
  final bool onlyBack;
  final BodyScreens? bodyScreensToGo;
  final Widget? widgetTitleAppBar;
  final Widget? widgetRightAppBar;
  final Color? backgroundColor;
  final String? imageBackgroundName;
  final bool deleteAppBar;
  final double? fontSizeAppBar;
  final bool? primary;
  final String? subTitle;
  final Future Function()? callbackTopRefreshIndicator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Container(
          decoration: imageBackgroundName != null
              ? myDecorationBackgroundImageContainer(
                  imageNewPath:
                      //чтобы картинка по умолчанию
                      imageBackgroundName == '' ? null : imageBackgroundName)
              : BoxDecoration(
                  color: backgroundColor ?? Theme.of(context).cardColor),
          child: SafeArea(
            maintainBottomViewPadding: true,
            top: isSafeArea,
            bottom: isSafeArea,
            child: Column(
              children: [
                if (myNewMaterialAppBar == null && !deleteAppBar)
                  MyAppBar(
                    myContext: context,
                    subTitle: subTitle,
                    title: titleAppBar,
                    onlyBack: onlyBack,
                    bodyScreens: bodyScreensToGo,
                    widgetRight: widgetRightAppBar,
                    fontSizeAppBar: fontSizeAppBar,
                  ),
                if (myNewMaterialAppBar != null) myNewMaterialAppBar!,
                if (callbackTopRefreshIndicator != null)
                  CupertinoSliverRefreshControl(
                      onRefresh: callbackTopRefreshIndicator!),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: _widgetBody(padding: paddingHorizontalContent),
                      ),
                      if (widgetAfterBody != null)
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: myTopPaddingForContent),
                          child: widgetAfterBody!,
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _widgetBody({required double? padding}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: padding ?? myHorizontalPaddingForContainer),
      child: widgetBody,
    );
  }
}
