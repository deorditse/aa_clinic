import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/chat_with_user_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/user_profile_page/user_profile_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/profile_page/pages/achievements_pages/achievements_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/profile_page/pages/edit_profile_page/edit_profile_page.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/container_for_photo.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/my_shimmer_effect_container.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:business_layout/business_layout.dart';
import 'package:flutter/material.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:model/model.dart';

import 'column_with_fio_and_message.dart';

class ChatPreviewOnHomepage extends StatelessWidget {
  const ChatPreviewOnHomepage({
    Key? key,
    String? imagePathAvatar,
    required this.chat,
  }) : super(key: key);
  final ChatFindManyModel chat;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
        ),
        onPressed: () {
          ChatPageControllerGetx.instance.getMessagesInChat(
            isOfficialChat: false,
            chatId: chat.id,
          );
          ChatWithUserPage.openChatWithUserPage(
            isSpecialistOnline: chat.isSpecialistOnline,
            context: context,
            chatId: chat.id,
            unreadedMessages: chat.unreadedMessages,
            userMinified: chat.userMinifiedData,
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: photoAndMarker(
                isSpecialistOnline: chat.isSpecialistOnline,
                context: context,
                userMinified: chat.userMinifiedData,
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: myTopPaddingForContent / 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 6,
                      child: ColumnWithFioAndMessage(
                        fullName:
                            "${chat.userMinifiedData?.lastName?.capitalizeFirst ?? " "} ${chat.userMinifiedData?.middleName?.capitalizeFirst ?? " "} ${chat.userMinifiedData?.firstName?.capitalizeFirst ?? ""}",
                        lastMessageDate: chat.lastMessage,
                      ),
                    ),
                    Expanded(
                      child: _columnWithTimeAndValue(
                        context: context,
                        lastMessageDate: chat.lastMessageDate,
                        unreadedMessages: chat.unreadedMessages,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _columnWithTimeAndValue(
      {required BuildContext context,
      required String? lastMessageDate,
      required int? unreadedMessages}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          lastMessageDate != null
              ? '${DateFormat.Hm().format(DateTime.parse(lastMessageDate))}'
              : "...",
          overflow: TextOverflow.ellipsis,
          style: myTextStyleFontUbuntu(
              fontSize: 14,
              textColor: Theme.of(context).textTheme.headline3!.color,
              newFontWeight: FontWeight.w300,
              context: context),
        ),
        if (unreadedMessages != null && unreadedMessages != 0)
          Container(
            decoration: myStyleContainer(
                color: myColorIsActive, borderRadius: 6.0, context: context),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: myTopPaddingForContent / 2),
              child: Text(
                ' $unreadedMessages ',
                overflow: TextOverflow.ellipsis,
                style: myTextStyleFontUbuntu(
                  newFontWeight: FontWeight.w500,
                  fontSize: 14,
                  context: context,
                  textColor:
                      Get.isDarkMode ? null : Theme.of(context).cardColor,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

Widget photoAndMarker({
  required BuildContext context,
  required UserMinifiedDataIdModel? userMinified,
  required bool isSpecialistOnline,
}) {
  return GestureDetector(
    onTap: () {
      if (userMinified != null) {
        UserProfilePage.goToUserProfilePage(
          context: context,
          userMinified: userMinified,
        );
      }
    },
    child: FittedBox(
      child: Stack(
        children: [
          CircleAvatar(
            backgroundColor:
                Theme.of(context).textTheme.headline3!.color!.withOpacity(0.1),
            child: ContainerForPhotoFuture(
              isCircular: true,
              coverFileId: userMinified?.avatar,
            ),
          ),
          Positioned(
            right: 0,
            child: Icon(
              Icons.circle,
              size: 10,
              color: isSpecialistOnline
                  ? Color.fromRGBO(14, 214, 166, 1)
                  : Colors.grey,
            ),
          ),
        ],
      ),
    ),
  );
}
