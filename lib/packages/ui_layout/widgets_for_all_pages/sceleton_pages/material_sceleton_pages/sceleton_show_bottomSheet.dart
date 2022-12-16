import 'dart:io';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/app_bars/material_app_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';

Future<void> showBottomSheetContainer({
  required BuildContext context,
  required final String titleAppBar,
  required final Widget widgetBody,
  final bool onlyBack = true,
  final Widget? widgetRightAppBar,
  final enableDrag = true,
  final Color? backgroundColor,
  final bool deleteAppBar = false,
  final bool bottomBorderRadius = false,
  final bool backLine = false,
  final bool expand = false,
}) async {
  await showModalBottomSheet(
    context: context,
    enableDrag: enableDrag,
    elevation: 100,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    useRootNavigator: false,
    isScrollControlled: true,
    builder: (_) => GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        maintainBottomViewPadding: true,
        child: Padding(
          padding: EdgeInsets.only(
            top: Platform.isAndroid
                ? (mySizedHeightBetweenContainer.height!.toDouble())
                : 0,
            left: myHorizontalPaddingForContainer,
            right: myHorizontalPaddingForContainer,
            bottom:
                bottomBorderRadius ? myHorizontalPaddingForContainer * 1.5 : 0,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor ?? Theme.of(context).cardColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(15),
                bottom: Radius.circular(bottomBorderRadius ? 22 : 0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: myTopPaddingForContent),
              child: Column(
                mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
                children: [
                  if (!deleteAppBar)
                    MyAppBar(
                      backLine: backLine,
                      myContext: context,
                      title: titleAppBar,
                      onlyBack: onlyBack,
                      widgetRight: widgetRightAppBar,
                    ),
                  Flexible(
                    child: SingleChildScrollView(
                      primary: true,
                      child: _widgetBodyContent(
                          context: context, widgetBody: widgetBody),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

_widgetBodyContent(
    {required BuildContext context, required Widget widgetBody}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: myTopPaddingForContent),
    child: Padding(
      padding: const EdgeInsets.only(bottom: myTopPaddingForContent / 2),
      child: widgetBody,
    ),
  );
}
