import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/main_bottom_menu_sceleton.dart';
import 'package:intl/intl.dart';
import 'package:style_app/style_app.dart';
import 'packages/ui_layout/pages/other_pages/authentication_page/main_login_page.dart';
import 'package:business_layout/business_layout.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //для экрана заставки
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  Intl.defaultLocale = 'ru_RU';
  tz.initializeTimeZones();
  final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
  tz.setLocalLocation(
    tz.getLocation(timeZoneName!),
  ); //для перевода текста календаря использую initializeDateFormatting
  initializeDateFormatting().then(
    (_) {
      //ориентация экрана;
      SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
      ).whenComplete(
        () => runApp(MyGetApp()),
      );
    },
  );
}

class MyGetApp extends StatelessWidget {
  MyGetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AuthBinding(),
      theme: themeLight,
      darkTheme: themeDark,
      themeMode: ThemeMode.system,
      onInit: () {
        ImplementAuthController.instance.initMainDataApp();
      },
      initialRoute: LoginView.id,
      getPages: [
        GetPage(
          name: MyBottomMenuSceleton.id,
          page: () => MyBottomMenuSceleton(),
          binding: SettingBinding(),
        ),

        ///для авторизации
        GetPage(
          name: LoginView.id,
          page: () => LoginView(),
          binding: AuthBinding(),
        ),
      ],
    );
  }
}
