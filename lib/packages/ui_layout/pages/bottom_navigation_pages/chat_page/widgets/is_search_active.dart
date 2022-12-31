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
        Set<ChatFindManyModel?>? _listChatFindManyModel =
            controllerChat.mapNameSearchAndChatFindManyModel[
                controllerChat.searchingChatsText];

        print(controllerChat.searchingChatsText);

        return _listChatFindManyModel == null
            ? Padding(
                padding: const EdgeInsets.only(top: myTopPaddingForContent),
                child: Center(
                  child: Text(
                    "Чаты не найдены",
                    style: myTextStyleFontUbuntu(
                      context: context,
                      fontSize: 20,
                      textColor: Theme.of(context).textTheme.headline3!.color,
                    ),
                  ),
                ),
              )
            : _listChatFindManyModel.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    padding: EdgeInsets.zero,
                    itemCount: _listChatFindManyModel.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            bottom: myTopPaddingForContent),
                        child: ChatPreviewOnHomepage(
                          chat: _listChatFindManyModel.elementAt(index)!,
                        ),
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
