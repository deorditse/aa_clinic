import 'package:model/model.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/app_bars/sliver_app_bar.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/app_bars/widgetsRightAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:style_app/style_app.dart';
import 'package:business_layout/business_layout.dart';

class RowWithTextFieldAndButton extends StatelessWidget {
  RowWithTextFieldAndButton({Key? key}) : super(key: key);
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
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
          child: _textFieldMessage(context: context),
        ),
        GestureDetector(
          onTap: () {
            if (_messageController.text.isNotEmpty) {
              ChatPageControllerGetx.instance.addNewMessage(
                newMessage: MessageModel(
                  id: 'test',
                  text: _messageController.text,
                  senderId:
                      ImplementAuthController.instance.userAuthorizedData!.id,
                ),
              );
              _messageController.text = "";
            }
          },
          // style: ButtonStyle(
          //     padding: MaterialStateProperty.all(EdgeInsets.zero)),
          child: SvgPicture.asset(
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
      ],
    );
  }

  _textFieldMessage({required BuildContext context}) {
    return TextField(
      keyboardType: TextInputType.text,
      autofocus: false,
      cursorColor: myColorIsActive,
      controller: _messageController,
      key: Key('addName'),
      // validator: (value) {
      //   if (value == '') {
      //     return 'Введите cообщение';
      //   }
      //   return null;
      // },
      //если нет контроллера, можно делать через initialValue
      // initialValue: dataUser?.surname,
      // maxLines: 5,
      // minLines: 1,

      onSubmitted: (message) {
        if (message.isNotEmpty) {
          ChatPageControllerGetx.instance.addNewMessage(
            newMessage: MessageModel(
              id: 'test',
              text: message,
              senderId: ImplementAuthController.instance.userAuthorizedData!.id,
            ),
          );
          _messageController.text = "";
        }
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

// class RowWithTextFieldAndButton extends StatelessWidget {
//   const RowWithTextFieldAndButton({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       maintainBottomViewPadding: true,
//       child: Row(
//         children: [
//           GestureDetector(
//             onTap: () {},
//             // style: ButtonStyle(
//             //     padding: MaterialStateProperty.all(EdgeInsets.zero)),
//             child: SvgPicture.asset(
//               'assets/icons/chats/forChatFile.svg',
//               color: Get.isDarkMode
//                   ? null
//                   : Theme.of(context).textTheme.headline1!.color,
//               semanticsLabel: 'forChatFile',
//               fit: BoxFit.contain,
//               height: 22,
//             ),
//           ),
//           Expanded(
//             // flex: 10,
//             child: _textFieldMessage(context: context),
//           ),
//           GestureDetector(
//             onTap: () {},
//             // style: ButtonStyle(
//             //     padding: MaterialStateProperty.all(EdgeInsets.zero)),
//             child: SvgPicture.asset(
//               'assets/icons/chats/messageButton.svg',
//               color: Get.isDarkMode
//                   ? null
//                   : Theme.of(context).textTheme.headline1!.color,
//               semanticsLabel: 'messageButton',
//               fit: BoxFit.contain,
//               height: 22,
//               width: Get.width,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   _textFieldMessage({required BuildContext context}) {
//     return TextField(
//       keyboardType: TextInputType.text,
//       autofocus: false,
//       cursorColor: myColorIsActive,
//       // controller: _nameController,
//       key: Key('addName'),
//       // validator: (value) {
//       //   if (value == '') {
//       //     return 'Введите cообщение';
//       //   }
//       //   return null;
//       // },
//       //если нет контроллера, можно делать через initialValue
//       // initialValue: dataUser?.surname,
//       // maxLines: 5,
//       // minLines: 1,
//
//       decoration: myStyleTextField(
//         context,
//         // labelText: 'Сообщение...',
//         hintText: 'Сообщение...',
//       ).copyWith(
//         fillColor: Colors.transparent,
//       ),
//     );
//   }
// }
