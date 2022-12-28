import 'package:business_layout/business_layout.dart';
import 'package:get/get.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';

class MySliverAppBar extends StatelessWidget with PreferredSizeWidget {
  MySliverAppBar({
    Key? key,
    required this.title,
    required this.myContext,
    this.isSearchWidget,
    this.widgetRight,
    this.bodyScreens,
    this.onlyBack = true,
    this.fontSizeAppBar,
    this.backLine = false,
    this.subTitle,
  }) : super(key: key);
  final bool? isSearchWidget;
  final bool backLine;

  final BuildContext myContext;
  final String title;
  final Widget? widgetRight;
  final BodyScreens? bodyScreens;
  final bool onlyBack;
  final double? fontSizeAppBar;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(myContext).cardColor,
      leadingWidth: 40,
      leading: onlyBack
          ? GestureDetector(
              onTap: () {
                if (bodyScreens != null) //меняю индекс для таб бара
                  ImplementSettingGetXController.instance.goToScreenBody(
                    bodyScreens: bodyScreens!,
                  );
                if (onlyBack) Navigator.of(context).pop();
              },
              child: Container(
                width: 40,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: myIconBackAppBar(context: myContext)),
              ),
            )
          : Container(),

      toolbarHeight: myToolbarHeight,
      floating: false,
      pinned: true,

      //что эпп бар будет зафиксен после скролла
      title: Column(
        children: [
          if (backLine) myBackLineInAppBar(context: context),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: myTextStyleFontUbuntu(
                      fontSize: fontSizeAppBar ?? 20,
                      newFontWeight: FontWeight.w500,
                      context: myContext,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  if (subTitle != null)
                    FittedBox(
                      child: Text(
                        subTitle!,
                        style: myTextStyleFontUbuntu(
                          fontSize: 10,
                          newFontWeight: FontWeight.w300,
                          context: myContext,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
      actions: widgetRight != null
          ? [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, right: 12),
                child: widgetRight,
              )
            ]
          : [
              Container(width: 40),
            ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
