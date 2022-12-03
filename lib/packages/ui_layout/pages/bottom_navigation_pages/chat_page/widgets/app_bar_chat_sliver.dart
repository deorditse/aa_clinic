import 'package:business_layout/business_layout.dart';
import 'package:get/get.dart';
import 'package:style_app/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/app_bars/widgetsRightAppBar.dart';
import 'package:flutter/material.dart';

import 'search_chats_widget.dart';

class ChatSliverAppBar extends StatefulWidget {
  ChatSliverAppBar({
    Key? key,
    required this.title,
    required this.myContext,
    this.isSearchWidget,
    this.widgetRight,
    this.onlyBack = false,
    this.fontSizeAppBar,
    this.subTitle,
  }) : super(key: key);
  final bool? isSearchWidget;
  final BuildContext myContext;
  final String title;
  final Widget? widgetRight;
  final bool onlyBack;
  final double? fontSizeAppBar;
  final String? subTitle;

  @override
  State<ChatSliverAppBar> createState() => _ChatSliverAppBarState();
}

class _ChatSliverAppBarState extends State<ChatSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatPageControllerGetx>(
      builder: (controllerChat) => SliverAppBar(
        backgroundColor: Theme.of(widget.myContext).cardColor,
        leading: controllerChat.isSearchingChats ? null : Container(),
        toolbarHeight: myToolbarHeight,
        leadingWidth: 40,
        floating: false,
        pinned: true,
        //что эпп бар будет зафиксен после скролла
        title: Center(
          child: controllerChat.isSearchingChats
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: SearchChatsWidget(),
                ) //_buildSearchField()
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      widget.title,
                      style: myTextStyleFontUbuntu(
                        fontSize: widget.fontSizeAppBar ?? 20,
                        context: widget.myContext,
                        newFontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
        ),
        actions: !controllerChat.isSearchingChats
            ? [
                SizedBox(
                  width: 40,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8.0, right: 12, top: 2),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            ChatPageControllerGetx.instance
                                .changeIsSearchingChats(isSearching: true);
                          });
                        },
                        child: myIconSearchForAppBar(context: context)),
                  ),
                ),
              ]
            : null,
      ),
    );
  }
}
