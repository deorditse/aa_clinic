import 'package:model/model.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/my_shimmer_effect_container.dart';
import 'package:business_layout/business_layout.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:style_app/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/chat_with_user_page.dart';
import 'package:intl/intl.dart';
import 'chat_preview_on_homepage.dart';
import 'column_with_fio_and_message.dart';

class ListViewIfSearchActiveFromChats extends StatelessWidget {
  const ListViewIfSearchActiveFromChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatPageControllerGetx>(
      builder: (controllerChat) {
        List<ChatFindManyModel?> _listChatFindManyModel =
            controllerChat.mapNameSearchAndChatFindManyModel[
                    controllerChat.searchingChatsText] ??
                [];
        return _listChatFindManyModel.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.zero,
                itemCount: _listChatFindManyModel.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: myTopPaddingForContent),
                    child: _ChatPreviewOnHomepageForSearch(index: index),
                  );
                },
              )
            : Padding(
                padding: const EdgeInsets.only(top: myTopPaddingForContent),
                child: myShimmerEffectContainer(
                  context: context,
                  newHeight: 60,
                ),
              );
      },
    );
  }
}

class _ChatPreviewOnHomepageForSearch extends StatelessWidget {
  const _ChatPreviewOnHomepageForSearch({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    //if listChats isNotEmpty == true all for this
    ChatFindManyModel chat = ChatPageControllerGetx.instance.listChats![index]!;
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
              ChatPageControllerGetx.instance.getMessagesInChat(
                isOfficialChat: false,
                chatId: chat.id,
              );
              ChatWithUserPage.openChatWithUserPage(
                isSpecialistOnline: chat.isSpecialistOnline,
                context: context,
                chatId: chat.id,
                unreadedMessages: chat.unreadedMessages,
                userMinified: snapshot.data,
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
                    userMinified: snapshot.data,
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
                                "${snapshot.data?.lastName?.capitalizeFirst ?? " "} ${snapshot.data?.middleName?.capitalizeFirst ?? " "} ${snapshot.data?.firstName?.capitalizeFirst ?? ""}",
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
}
