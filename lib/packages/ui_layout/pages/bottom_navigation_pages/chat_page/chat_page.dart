import 'dart:convert';
import 'dart:developer';

import 'package:aa_clinic/packages/data_layout/lib/data_layout.dart';
import 'package:model/model.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/app_bars/sliver_app_bar.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/app_bars/widgetsRightAppBar.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/my_shimmer_effect_container.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/sliver_sceleton_pages/sliver_sceleton_without_borders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_app/style_app.dart';
import 'package:business_layout/business_layout.dart';
import 'pages/chat_with_user_page/chat_with_user_page.dart';
import 'widgets/app_bar_chat_sliver.dart';
import 'widgets/chat_preview_on_homepage.dart';
import 'package:http/http.dart' as http;

import 'widgets/oficcial_chat_preview_on_homepage.dart';

class ChatPage extends StatelessWidget {
  static const String id = '/сhatPage';

  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MySliverNewPageWithoutBorder(
      primary: true,
      titleAppBar: 'Чаты',
      callbackTopRefreshIndicator: _updateDataPage,
      widgetBody: _MainBodyChatPage(),
      myNewSliverAppBar: ChatSliverAppBar(title: 'Чаты', myContext: context),
      widgetRightAppBar: myIconSearchForAppBar(context: context),
    );
  }

  Future<void> _updateDataPage() async {
    await ChatPageControllerGetx.instance.initialChatController();
  }
}

class _MainBodyChatPage extends StatelessWidget {
  const _MainBodyChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatPageControllerGetx>(
      builder: (controllerChatPage) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mySizedHeightBetweenContainer,
            OfficialChatPreviewOnHomepage(),
            mySizedHeightBetweenContainer,
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.zero,
              itemCount: controllerChatPage.listChats.isNotEmpty
                  ? controllerChatPage.listChats.length
                  : 12,
              itemBuilder: (context, index) {
                if (controllerChatPage.listChats.isNotEmpty) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: myTopPaddingForContent),
                    child: ChatPreviewOnHomepage(index: index),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(top: myTopPaddingForContent),
                    child: myShimmerEffectContainer(
                      context: context,
                      newHeight: 60,
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}

//test delete
