import 'dart:io';

import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/search_widget.dart';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/app_bars/sliver_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';

class MySliverNewPageWithoutBorder extends StatelessWidget {
  const MySliverNewPageWithoutBorder({
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
    this.myNewSliverAppBar,
    this.callbackTopRefreshIndicator,
    this.resizeToAvoidBottomInset = false,
  }) : super(key: key);
  final Widget? myNewSliverAppBar;
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
  final bool resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
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
          child: CustomScrollView(
            primary: primary ?? false,
            slivers: [
              if (myNewSliverAppBar == null && !deleteAppBar)
                MySliverAppBar(
                  myContext: context,
                  subTitle: subTitle,
                  title: titleAppBar,
                  onlyBack: onlyBack,
                  bodyScreens: bodyScreensToGo,
                  widgetRight: widgetRightAppBar,
                  fontSizeAppBar: fontSizeAppBar,
                ),
              if (myNewSliverAppBar != null) myNewSliverAppBar!,
              if (callbackTopRefreshIndicator != null)
                CupertinoSliverRefreshControl(
                    onRefresh: callbackTopRefreshIndicator!),
              deleteAppBar
                  ? SliverToBoxAdapter(
                      child: SafeArea(
                        maintainBottomViewPadding: true,
                        child: _sliverToBoxAdapter(
                            padding: paddingHorizontalContent),
                      ),
                    )
                  : SliverToBoxAdapter(
                      child: _sliverToBoxAdapter(
                          padding: paddingHorizontalContent),
                    ),
              if (widgetAfterBody != null)
                SliverPadding(
                  padding:
                      const EdgeInsets.only(bottom: myTopPaddingForContent),
                  sliver: widgetAfterBody!,
                )
            ],
          ),
        ),
      ),
    );
  }

  _sliverToBoxAdapter({required double? padding}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: padding ?? myHorizontalPaddingForContainer),
      child: widgetBody,
    );
  }
}
