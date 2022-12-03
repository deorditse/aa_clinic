import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/user_profile_page/user_profile_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/profile_page/pages/achievements_pages/achievements_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/profile_page/pages/edit_profile_page/edit_profile_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';
import 'package:business_layout/business_layout.dart';
import 'package:flutter/material.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';

class ChatPreviewOnHomepage extends StatelessWidget {
  const ChatPreviewOnHomepage({
    Key? key,
    this.index,
    this.isSvgImage = false,
    required this.imagePathAvatar,
    required this.fullName,
    required this.countMessage,
    required this.lastMessage,
    this.noTransitionUserProfilePage = false,
    required this.lastMessageTime,
  }) : super(key: key);
  final int? index;
  final String imagePathAvatar;
  final bool noTransitionUserProfilePage;
  final String fullName;
  final int countMessage;
  final String lastMessage;
  final bool isSvgImage;
  final String lastMessageTime;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: photoAndMarker(
                context: context,
                imagePathAvatar: imagePathAvatar,
                isSvgImage: isSvgImage,
                noTransitionUserProfilePage: noTransitionUserProfilePage),
          ),
          Expanded(
            flex: 6,
            child: _columnWithFioAndMessage(context: context),
          ),
          Expanded(
            child: _columnWithTimeAndValue(context: context),
          ),
        ],
      ),
    );
  }

  _columnWithTimeAndValue({required BuildContext context}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '$lastMessageTime',
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
              '$countMessage...',
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

  _columnWithFioAndMessage({required BuildContext context}) {
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
            '$lastMessage',
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

  photoAndMarker({
    required BuildContext context,
    required String? imagePathAvatar,
    bool noTransitionUserProfilePage = false,
    bool isSvgImage = false,
  }) {
    return GestureDetector(
      onTap: () {
        if (!noTransitionUserProfilePage) {
          UserProfilePage.goToUserProfilePage(
            context: context,
            imagePath: imagePathAvatar,
            isSvgImage: isSvgImage,
          );
        }
      },
      child: FittedBox(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                child: (imagePathAvatar != null && imagePathAvatar != '')
                    ? isSvgImage
                        ? CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: SvgPicture.asset(
                              "$imagePathAvatar",
                              semanticsLabel: 'addNewEvent',
                              fit: BoxFit.contain,
                            ),
                          )
                        : CircleAvatar(
                            backgroundColor: Theme.of(context).backgroundColor,
                            backgroundImage: NetworkImage(
                              "$imagePathAvatar",
                            ),
                            child: Text(''),
                          )
                    : CircleAvatar(
                        backgroundColor: Theme.of(context).backgroundColor),
              ),
            ),
            Positioned(
              right: 0,
              child: Icon(
                Icons.circle,
                size: 10,
                color: Color.fromRGBO(14, 214, 166, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
