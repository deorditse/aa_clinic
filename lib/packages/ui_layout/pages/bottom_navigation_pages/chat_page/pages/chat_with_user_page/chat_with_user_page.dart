import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/user_profile_page/user_profile_page.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/material_sceleton_without_borders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'widgets/app_bar_chat_with_user.dart';
import 'main_body_chat.dart';
import 'widgets/row_with_text_field_and_button.dart';
import 'package:model/model.dart';

class ChatWithUserPage extends StatelessWidget {
  static const String id = '/chatWithUserPage';

  const ChatWithUserPage({
    Key? key,
    this.index,
    this.isOfficialChat = false,
    this.isSvgImage = false,
    this.chatId,
    this.userMinified,
  }) : super(key: key);

  final String? chatId;
  final int? index;
  final bool isSvgImage;
  final bool isOfficialChat;
  final UserMinifiedDataIdModel? userMinified;

  static openChatWithUserPage({
    bool isOfficialChat = false,
    required BuildContext context,
    required UserMinifiedDataIdModel? userMinified,
    int? index,
    bool isSvgImage = false,
    required String chatId,
  }) =>
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: RouteSettings(name: ChatWithUserPage.id),
        screen: ChatWithUserPage(
          chatId: chatId,
          isSvgImage: isSvgImage,
          userMinified: userMinified,
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
          RowWithTextFieldAndButton(
            recipientId: userMinified?.id,
            isOfficialChat: isOfficialChat,
            chatId: chatId!,
          ),
        ],
      ),
      myNewMaterialAppBar: ChatMaterialAppBar(
        rightVoidCallback: () {
          if (!isOfficialChat) {
            UserProfilePage.goToUserProfilePage(
              context: context,
              userMinified: userMinified,
            );
          }
        },
        title:
            "${userMinified?.lastName?.capitalizeFirst ?? ""} ${userMinified?.middleName?.capitalizeFirst ?? ""} ${userMinified?.firstName?.capitalizeFirst ?? ""}",
        isSvgImage: isSvgImage,
        countUnreadChats: countUnreadChats,

        ///todo
        subTitle: 'Онлайн 14 мин. назад',
        imagePath: userMinified?.avatar,
      ),
    );
  }
}
