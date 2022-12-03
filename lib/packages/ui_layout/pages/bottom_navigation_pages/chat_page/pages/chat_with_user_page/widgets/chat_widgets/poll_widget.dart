// import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
// import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/style/style_chat.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class PoolWidget extends StatefulWidget {
//   const PoolWidget({Key? key, required this.message}) : super(key: key);
//   final String message;
//
//   @override
//   State<PoolWidget> createState() => _PoolWidgetState();
// }
//
// class _PoolWidgetState extends State<PoolWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       constraints: BoxConstraints(maxWidth: Get.width * 0.8),
//       decoration: myStyleContainer(
//         context: context,
//         color: Get.isDarkMode
//             ? colorContainerIsDarkMode
//             : colorContainerIsLightkMode,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(left: myTopPaddingForContent),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             mySizedHeightBetweenContainer,
//             Text(
//               widget.message,
//               style: myTextStyleFontUbuntu(
//                 textColor: Theme.of(context).textTheme.headline1!.color,
//                 fontSize: 16,
//                 context: context,
//               ),
//             ),
//             TextButton(
//               onPressed: () {},
//               child: Text(
//                 'Take',
//                 style: myTextStyleFontUbuntu(
//                   textColor: myColorIsActive,
//                   fontSize: 16,
//                   context: context,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
