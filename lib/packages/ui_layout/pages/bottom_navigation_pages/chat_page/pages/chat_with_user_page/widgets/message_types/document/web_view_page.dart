// import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/material_sceleton_without_borders.dart';
// import 'package:business_layout/business_layout.dart';
// import 'package:aa_clinic/packages/data_layout/lib/data_layout.dart';
// import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// // Import for Android features.
// import 'package:webview_flutter_android/webview_flutter_android.dart';
//
// // Import for iOS features.
// import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
//
// class WebViewApp extends StatefulWidget {
//   const WebViewApp({super.key, required this.idDoc});
//
//   final String idDoc;
//
//   @override
//   State<WebViewApp> createState() => _WebViewAppState();
// }
//
// class _WebViewAppState extends State<WebViewApp> {
//   late WebViewController _controller;
//   Rx<double> _progressVal = (0.0).obs;
//   late final WebViewCookieManager cookieManager = WebViewCookieManager();
//
//   Future<void> _onSetCookie() async {
//     // await cookieManager.setCookie(
//     //   WebViewCookie(
//     //     name: 'session',
//     //     value: ImplementAuthController.instance.userAuthorizedData!.accessToken,
//     //     domain: "$urlMainApiConst",
//     //     path: '/',
//     //   ),
//     // );
//     print('https://${urlMainApiConst}/api/staticFilesStorage/${widget.idDoc}');
//     await _controller.loadRequest(
//       urlMain(urlPath: 'api/staticFilesStorage/${widget.idDoc}'),
//       headers: {
//         "Authorization":
//             "Bearer ${ImplementAuthController.instance.userAuthorizedData!.accessToken}",
//         "Accept": "*/*",
//       },
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             _progressVal.value = progress.toDouble() / 100;
//           },
//           onPageStarted: (String url) {},
//           onPageFinished: (String url) {},
//           onWebResourceError: (WebResourceError error) {},
//           // onNavigationRequest: (NavigationRequest request) {
//           //   if (request.url.startsWith(
//           //       'http://aaclinic-dev.glavstudio.pro/')) {
//           //     return NavigationDecision.prevent;
//           //   }
//           //   return NavigationDecision.navigate;
//           // },
//         ),
//       );
//     _onSetCookie();
//     // ..loadRequest(Uri.parse('https://flutter.dev'));
//
//     // #docregion platform_features
//     if (_controller.platform is AndroidWebViewController) {
//       AndroidWebViewController.enableDebugging(true);
//       (_controller.platform as AndroidWebViewController)
//           .setMediaPlaybackRequiresUserGesture(false);
//     }
//
//     // #enddocregion platform_features
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MyMaterialNewPageWithoutBorder(
//       titleAppBar: 'Просмотр документа',
//       widgetBody: Column(
//         children: [
//           Obx(
//             () => _progressVal.value != 1
//                 ? LinearProgressIndicator(
//                     value: _progressVal.value,
//                     color: myColorIsActive,
//                   )
//                 : SizedBox.shrink(),
//           ),
//           Expanded(
//             child: WebViewWidget(
//               controller: _controller,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
