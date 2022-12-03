import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/user_profile_page/user_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:style_app/style_app.dart';
import 'widgets/chat_widgets/alert_message.dart';
import 'widgets/app_bar_chat_with_user.dart';
import 'widgets/chat_widgets/document.dart';
import 'widgets/chat_widgets/image.dart';
import 'widgets/chat_widgets/new_basket_for_you_widget/new_basket_for_you_widget.dart';
import 'widgets/row_with_text_field_and_button.dart';
import 'widgets/chat_widgets/message.dart';

class ChatWithUserPage extends StatelessWidget {
  static const String id = '/chatWithUserPage';

  const ChatWithUserPage({
    Key? key,
    this.index,
    this.imagePathAvatar,
    this.fullName,
    this.lastMessage,
    this.lastMessageTime,
    this.noTransitionUserProfilePage = false,
    this.isSvgImage = false,
  }) : super(key: key);

  final int? index;
  final String? imagePathAvatar;
  final String? fullName;
  final String? lastMessage;
  final String? lastMessageTime;
  final bool isSvgImage;
  final bool noTransitionUserProfilePage;

  static openChatWithUserPage({
    bool noTransitionUserProfilePage = false,
    required BuildContext context,
    int? index,
    required String imagePathAvatar,
    bool isSvgImage = false,
    required String fullName,
    required String lastMessage,
    required String lastMessageTime,
  }) =>
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: RouteSettings(name: ChatWithUserPage.id),
        screen: ChatWithUserPage(
          imagePathAvatar: imagePathAvatar,
          fullName: fullName,
          isSvgImage: isSvgImage,
          noTransitionUserProfilePage: noTransitionUserProfilePage,
          lastMessage: lastMessage,
          lastMessageTime: lastMessageTime,
        ),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
  final int countUnreadChats = 12;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: ChatMaterialAppBar(
          rightVoidCallback: () {
            if (!noTransitionUserProfilePage) {
              UserProfilePage.goToUserProfilePage(
                context: context,
                imagePath: imagePathAvatar,
                isSvgImage: isSvgImage,
              );
            }
          },
          title: '$fullName',
          isSvgImage: isSvgImage,
          countUnreadChats: countUnreadChats,
          subTitle: 'Онлайн 14 мин. назад',
          imagePath: imagePathAvatar,
        ),
        body: _MainBodyChatPage(),
      ),
    );
  }
}

class _MainBodyChatPage extends StatelessWidget {
  const _MainBodyChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,

      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: myHorizontalPaddingForContainer),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SingleChildScrollView(child: _BodyChatListWithMessage()),
            ),
            RowWithTextFieldAndButton(),
          ],
        ),
      ),
    );
  }
}

class _BodyChatListWithMessage extends StatelessWidget {
  const _BodyChatListWithMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          mySizedHeightBetweenContainer,
          AlertMessageWidget(
            message:
                'В этом чате вы можете общаться с клиникой, решать системные проблемы, сообщать об ошибках и др..',
          ),
          MessageWidget(
            message: 'Why must I love a heartless one Who',
            isSendMessage: true,
          ),
          AlertMessageWidget(
            message: 'Назначен модератор',
          ),
          MessageWidget(
            message: 'Bye.',
            isSendMessage: false,
          ),
          NewBasketForYouWidget(),
          ImageWidget(
            imagePath:
                'https://www.annabelkarmel.com/wp-content/uploads/2022/04/brooke-lark-jUPOXXRNdcA-unsplash-scaled.jpg',
            isSendMessage: true,
          ),
          DocumentWidget(
            isSendMessage: false,
            nameDocument: 'Документ УЛ',
          ),
          ImageWidget(
            imagePath:
                'https://restoranto.com/wp-content/uploads/2021/04/t-d-EST2Ah4rGyI-unsplash-1536x2048.jpg',
            isSendMessage: false,
          ),
          DocumentWidget(
            isSendMessage: true,
            nameDocument: 'Документ УЛ',
          ),
        ],
      ),
    );
  }
}
