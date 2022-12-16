import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/user_profile_page/user_profile_page.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/material_sceleton_without_borders.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/sliver_sceleton_pages/sliver_sceleton_without_borders.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'widgets/app_bar_chat_with_user.dart';
import 'widgets/main_body_chat.dart';
import 'widgets/row_with_text_field_and_button.dart';

class ChatWithUserPage extends StatelessWidget {
  static const String id = '/chatWithUserPage';

  const ChatWithUserPage({
    Key? key,
    this.index,
    this.specialistId,
    this.imagePathAvatar,
    this.fullName,
    this.isOfficialChat = false,
    this.isSvgImage = false,
    this.chatId,
  }) : super(key: key);

  final String? chatId;
  final String? specialistId;
  final int? index;
  final String? imagePathAvatar;
  final String? fullName;
  final bool isSvgImage;
  final bool isOfficialChat;

  static openChatWithUserPage({
    bool isOfficialChat = false,
    required BuildContext context,
    int? index,
    required String specialistId,
    required String? avatarId,
    bool isSvgImage = false,
    required String fullName,
    required String chatId,
  }) =>
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: RouteSettings(name: ChatWithUserPage.id),
        screen: ChatWithUserPage(
          specialistId: specialistId,
          chatId: chatId,
          imagePathAvatar: avatarId,
          fullName: fullName,
          isSvgImage: isSvgImage,
          isOfficialChat: isOfficialChat,
        ),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
  final int countUnreadChats = 12;

  @override
  Widget build(BuildContext context) {
    return MyMaterialNewPageWithoutBorder(
      resizeToAvoidBottomInset: true,
      primary: true,
      titleAppBar: 'Чат',
      widgetBody: Column(
        children: [
          Expanded(
            child: MainBodyChatPage(
              chatId: chatId!,
              isOfficialChat: isOfficialChat,
            ),
          ),
          RowWithTextFieldAndButton(),
        ],
      ),
      myNewMaterialAppBar: ChatMaterialAppBar(
        rightVoidCallback: () {
          if (!isOfficialChat) {
            UserProfilePage.goToUserProfilePage(
              context: context,
              avatar: imagePathAvatar,
              specialistId: specialistId!,
            );
          }
        },
        title: '$fullName',
        isSvgImage: isSvgImage,
        countUnreadChats: countUnreadChats,
        subTitle: 'Онлайн 14 мин. назад',
        imagePath: imagePathAvatar,
      ),
    );
  }
}
