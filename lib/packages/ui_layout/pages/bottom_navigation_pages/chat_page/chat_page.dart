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

class ChatPage extends StatelessWidget {
  static const String id = '/сhatPage';

  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MySliverNewPageWithoutBorder(
      titleAppBar: 'Чаты',
      widgetBody: _MainBodyChatPage(),
      myNewSliverAppBar: ChatSliverAppBar(title: 'Чаты', myContext: context),
      widgetRightAppBar: myIconSearchForAppBar(context: context),
    );
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
            Padding(
              padding: const EdgeInsets.only(bottom: myTopPaddingForContent),
              child: TextButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero)),
                child: ChatPreviewOnHomepage(
                  imagePathAvatar: Get.isDarkMode
                      ? 'assets/icons/mainLogo.svg'
                      : 'assets/icons/for_light_theme/main_logo_light.svg',
                  fullName: 'AA Clinic',
                  noTransitionUserProfilePage: true,
                  isSvgImage: true,
                  countMessage: 123,
                  lastMessage: 'Hello!',
                  lastMessageTime: '12:30',
                ),
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();

                  ChatWithUserPage.openChatWithUserPage(
                    imagePathAvatar: Get.isDarkMode
                        ? 'assets/icons/mainLogo.svg'
                        : 'assets/icons/for_light_theme/main_logo_light.svg',
                    isSvgImage: true,
                    noTransitionUserProfilePage: true,
                    context: context,
                    fullName: 'AA Clinic',
                    lastMessage: 'Hello!',
                    lastMessageTime: '12:30',
                  );
                },
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.zero,
              itemCount: controllerChatPage.listDataUsers.isNotEmpty
                  ? controllerChatPage.listDataUsers.length
                  : 12,
              itemBuilder: (context, index) {
                return controllerChatPage.listDataUsers.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(
                            bottom: myTopPaddingForContent),
                        child: TextButton(
                          style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.zero)),
                          child: ChatPreviewOnHomepage(
                            index: index,
                            imagePathAvatar:
                                'https://miro.medium.com/max/1400/0*vzeerCL0vZVofMs9.jpeg',
                            fullName: 'Yalublutanki Igor Andreevich',
                            countMessage: 123,
                            lastMessage: 'Hello! Is this Jmishenko Valeriy?',
                            lastMessageTime: '12:30',
                          ),
                          onPressed: () {
                            ChatWithUserPage.openChatWithUserPage(
                              context: context,
                              imagePathAvatar:
                                  'https://miro.medium.com/max/1400/0*vzeerCL0vZVofMs9.jpeg',
                              fullName: 'Yalublutanki Igor Andreevich',
                              lastMessage: 'Hello! Is this Jmishenko Valeriy?',
                              lastMessageTime: '12:30',
                            );
                          },
                        ),
                      )
                    : myShimmerEffectContainer(context: context, newHeight: 40);
              },
            ),
          ],
        );
      },
    );
  }
}
