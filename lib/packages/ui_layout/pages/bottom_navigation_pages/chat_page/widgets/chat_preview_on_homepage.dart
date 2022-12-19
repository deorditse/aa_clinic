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

class ChatPreviewOnHomepage extends StatelessWidget {
  const ChatPreviewOnHomepage({
    Key? key,
    String? imagePathAvatar,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    //if listChats isNotEmpty == true all for this
    ChatFindManyModel chat = ChatPageControllerGetx.instance.listChats[index]!;
    return SizedBox(
      height: 50,
      child: FutureBuilder<UserMinifiedDataIdModel?>(
        future: ImplementSettingGetXController.instance
            .getDataUserMinified(idUser: chat.specialistId!),
        builder: (context, AsyncSnapshot<UserMinifiedDataIdModel?> snapshot) {
          return TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
            ),
            onPressed: () {
              ChatWithUserPage.openChatWithUserPage(
                context: context,
                chatId: chat.id,
                userMinified: snapshot.data,
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: photoAndMarker(
                    isHidden: chat.isHidden,
                    context: context,
                    userMinified: snapshot.data,
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: _columnWithFioAndMessage(
                    context: context,
                    fullName:
                        "${snapshot.data?.lastName?.capitalizeFirst ?? " "} ${snapshot.data?.middleName?.capitalizeFirst ?? " "} ${snapshot.data?.firstName?.capitalizeFirst ?? ""}",
                    lastMessageDate: chat.lastMessageDate,
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
          );
        },
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
        Container(
          decoration: myStyleContainer(
              color: myColorIsActive, borderRadius: 6.0, context: context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              unreadedMessages != null ? ' $unreadedMessages... ' : " 0... ",
              overflow: TextOverflow.ellipsis,
              style: myTextStyleFontUbuntu(
                newFontWeight: FontWeight.w500,
                fontSize: 14,
                context: context,
                textColor: Get.isDarkMode ? null : Theme.of(context).cardColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _columnWithFioAndMessage({
    required BuildContext context,
    required String fullName,
    required String? lastMessageDate,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: myHorizontalPaddingForContainer),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$fullName',
            overflow: TextOverflow.ellipsis,
            style: myTextStyleFontUbuntu(context: context),
          ),
          Text(
            lastMessageDate != null ? '$lastMessageDate' : "...",
            overflow: TextOverflow.ellipsis,
            style: myTextStyleFontUbuntu(
                fontSize: 14,
                textColor: Theme.of(context).textTheme.headline3!.color,
                newFontWeight: FontWeight.w300,
                context: context),
          ),
        ],
      ),
    );
  }

  Widget photoAndMarker({
    required BuildContext context,
    required UserMinifiedDataIdModel? userMinified,
    bool? isHidden = false,
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
              backgroundColor: Theme.of(context)
                  .textTheme
                  .headline3!
                  .color!
                  .withOpacity(0.1),
              child: userMinified?.avatar != null
                  ? ContainerForPhotoFuture(
                      isCircular: true,
                      coverFileId: userMinified!.avatar,
                    )
                  : Icon(
                      Icons.person,
                      color: Theme.of(context).textTheme.headline3!.color,
                    ),
            ),
            Positioned(
              right: 0,
              child: Icon(
                Icons.circle,
                size: 10,
                color: isHidden != null && isHidden
                    ? Color.fromRGBO(14, 214, 166, 1)
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
