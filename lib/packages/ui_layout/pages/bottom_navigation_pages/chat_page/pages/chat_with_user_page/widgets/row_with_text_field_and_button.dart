import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:style_app/style_app.dart';
import 'package:business_layout/business_layout.dart';
import 'package:flutter_svg/svg.dart';

import 'package:intl/intl.dart';
import 'add_file_bottom_sheet_widget/add_file_bottom_sheet_widget.dart';

class RowWithTextFieldAndButton extends StatelessWidget {
  RowWithTextFieldAndButton({
    Key? key,
    required this.recipientId,
    required this.isOfficialChat,
    required this.chatId,
  }) : super(key: key);
  final TextEditingController _messageController = TextEditingController();
  final String? recipientId;
  final bool isOfficialChat;
  final String chatId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<ChatPageControllerGetx>(
          builder: (controllerChatPage) {
            return Column(
              children: [
                if (controllerChatPage.listWithPhotoImage.isNotEmpty)
                  Container(
                    height: 90,
                    width: double.maxFinite,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      primary: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controllerChatPage.listWithPhotoImage.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            width: 120,
                            decoration: myStyleContainer(context: context),
                            clipBehavior: Clip.hardEdge,
                            child: Stack(
                              children: [
                                Image.file(
                                  controllerChatPage.listWithPhotoImage[index]!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controllerChatPage.changeListWithPhotoImage(
                                        index: index);
                                  },
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.red,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                if (controllerChatPage.listDocuments.isNotEmpty)
                  Padding(
                    padding:
                        const EdgeInsets.only(top: myTopPaddingForContent / 2),
                    child: Container(
                      height: 50,
                      width: double.maxFinite,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        primary: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controllerChatPage.listDocuments.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              width: 180,
                              decoration: myStyleContainer(context: context),
                              clipBehavior: Clip.hardEdge,
                              child: Stack(
                                children: [
                                  FileDownloaded(
                                    name: controllerChatPage
                                        .listDocuments[index].name,
                                    dateTime: null,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      controllerChatPage.uploadDocument(
                                        indexForDelete: index,
                                      );
                                    },
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.red,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
                showAddFileBottomSheetWidgetInChatPage(context: context);
              },
              // style: ButtonStyle(
              //     padding: MaterialStateProperty.all(EdgeInsets.zero)),
              child: SvgPicture.asset(
                'assets/icons/chats/forChatFile.svg',
                color: Get.isDarkMode
                    ? null
                    : Theme.of(context).textTheme.headline1!.color,
                semanticsLabel: 'forChatFile',
                fit: BoxFit.contain,
                height: 22,
              ),
            ),
            Expanded(
              // flex: 10,
              child: _textFieldMessage(
                context: context,
                recipientId: recipientId,
              ),
            ),
            GetBuilder<ChatPageControllerGetx>(
              builder: (controllerChat) => GestureDetector(
                onTap: () async {
                  if (!controllerChat.isSendMessageLoading) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    await controllerChat.addNewMessage(
                      accessToken: ImplementAuthController
                          .instance.userAuthorizedData!.accessToken,
                      isOfficialChat: isOfficialChat,
                      recipientId: recipientId,
                      text: _messageController.text,
                      chatId: chatId,
                    );
                    _messageController.text = "";
                  }
                },
                child: controllerChat.isSendMessageLoading
                    ? Container(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: myColorIsActive,
                          strokeWidth: 3,
                        ),
                      )
                    : SvgPicture.asset(
                        'assets/icons/chats/messageButton.svg',
                        color: Get.isDarkMode
                            ? null
                            : Theme.of(context).textTheme.headline1!.color,
                        semanticsLabel: 'messageButton',
                        fit: BoxFit.contain,
                        height: 22,
                        width: Get.width,
                      ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _textFieldMessage(
      {required BuildContext context, required String? recipientId}) {
    return TextField(
      keyboardType: TextInputType.text,
      autofocus: false,
      cursorColor: myColorIsActive,
      controller: _messageController,
      key: Key('addMessage'),
      onSubmitted: (message) async {
        await ChatPageControllerGetx.instance.addNewMessage(
          chatId: chatId,
          accessToken:
              ImplementAuthController.instance.userAuthorizedData!.accessToken,
          isOfficialChat: isOfficialChat,
          recipientId: recipientId,
          text: message,
        );

        _messageController.text = "";
      },
      decoration: myStyleTextField(
        context,
        // labelText: 'Сообщение...',
        hintText: 'Сообщение...',
      ).copyWith(
        fillColor: Colors.transparent,
      ),
    );
  }
}

class FileDownloaded extends StatelessWidget {
  const FileDownloaded({
    Key? key,
    required this.name,
    required this.dateTime,
  }) : super(key: key);
  final String? name;
  final DateTime? dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: const Color.fromRGBO(38, 38, 38, 0.1),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            SizedBox(width: myTopPaddingForContent / 2),
            SvgPicture.asset(
              'assets/icons/chats/document_icon.svg',
              semanticsLabel: 'document_done',
              fit: BoxFit.contain,
              width: 20,
            ),
            SizedBox(width: myTopPaddingForContent / 2),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    (name ?? 'Документ').capitalizeFirst!,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Flexible(
                    child: Text(
                      DateFormat('d.M.yyyy').format(dateTime ?? DateTime.now()),
                      style: myTextStyleFontUbuntu(
                        context: context,
                        textColor: Theme.of(context).textTheme.headline3!.color,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
