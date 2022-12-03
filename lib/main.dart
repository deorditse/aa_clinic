import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/articles_page/pages/about_article_page/about_article_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/chat_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/add_new_dish_page/add_new_dish_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/add_new_dish_page/pages/adding_a_dish_page/adding_a_dish_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/doctors_appointment_pages/doctors_appointment_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/doctors_appointment_pages/video_chat_with_a_psychologist_page/video_chat_with_a_psychologist_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/food_pages/food_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/other_page/other_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/other_page/pages/change_password_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/other_page/pages/orders_page/orders_history_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/other_page/pages/subscriptions_page/subscriptions_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/profile_page/pages/achievements_pages/achievements_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/profile_page/pages/add_new_document_page/add_new_document_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/profile_page/pages/documents_page/documents_page.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/profile_page/pages/edit_profile_page/edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/main_bottom_menu_sceleton.dart';
import 'package:intl/intl.dart';
import 'package:style_app/style_app.dart';
import 'packages/ui_layout/pages/bottom_navigation_pages/articles_page/articles_page.dart';
import 'packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/chat_with_user_page.dart';
import 'packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/user_profile_page/user_profile_page.dart';
import 'packages/ui_layout/pages/bottom_navigation_pages/home_page/home_page.dart';
import 'packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/default_page_if_not_find_page/default_task_for_day_page.dart';
import 'packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/workout_pages/pages/workout_progress_page/workout_progress_page.dart';
import 'packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/workout_pages/pages/about_workout_progress_page.dart';
import 'packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/workout_pages/workout_page.dart';
import 'packages/ui_layout/pages/bottom_navigation_pages/home_page/widgets/task_for_the_day/notifications/bottom_sheet_сategories_of_notifications.dart';
import 'packages/ui_layout/pages/bottom_navigation_pages/other_page/pages/orders_page/about_order_page/about_order_page.dart';
import 'packages/ui_layout/pages/bottom_navigation_pages/profile_page/pages/achievements_pages/about_achievements_page.dart';
import 'packages/ui_layout/pages/bottom_navigation_pages/profile_page/pages/bottom_sheet_calendar_documents/bottom_sheet_calendar_documents.dart';
import 'packages/ui_layout/pages/bottom_navigation_pages/profile_page/profile_page.dart';
import 'packages/ui_layout/pages/other_pages/authentication_page/main_login_page.dart';
import 'package:business_layout/business_layout.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/doctors_appointment_pages/incoming_video_chat_page/incoming_video_chat_page.dart';
import 'packages/ui_layout/pages/bottom_navigation_pages/home_page/pages/doctors_appointment_pages/video_chat_with_a_psychologist_page/video_agora_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //для экрана заставки
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  Intl.defaultLocale = 'ru_RU';

  //для перевода текста календаря использую initializeDateFormatting
  initializeDateFormatting().then((_) {
    //ориентация экрана;
    SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
        .whenComplete(
      () => runApp(const MyGetApp()),
    );
  });
}

class MyGetApp extends StatelessWidget {
  const MyGetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AuthBinding(),
      theme: themeLight,
      darkTheme: themeDark,
      themeMode: ThemeMode.system,
      onInit: () async {
        ImplementAuthController.instance.initMainDataApp();
      },
      initialRoute: LoginView.id,
      getPages: [
        GetPage(
          name: MyBottomMenuSceleton.id,
          page: () => MyBottomMenuSceleton(),
          bindings: [
            AuthBinding(),
            SettingBinding(),
            RTCBinding(),
          ],
        ),

        ///для авторизации
        GetPage(
          name: LoginView.id,
          page: () => LoginView(),
          binding: AuthBinding(),
        ),

        ///для страницы профиль
        GetPage(
          name: ProfilePage.id,
          page: () => ProfilePage(),
        ),
        GetPage(
          name: DocumentsProfilePage.id,
          page: () => DocumentsProfilePage(),
        ),

        GetPage(
          name: AddNewDocumentProfilePage.id,
          page: () => AddNewDocumentProfilePage(),
        ),
        GetPage(
          name: WidgetBodyAchievementsProfilePage.id,
          page: () => WidgetBodyAchievementsProfilePage(),
        ),
        GetPage(
          name: WidgetBodyAboutAchievementsProfilePage.id,
          page: () => WidgetBodyAboutAchievementsProfilePage(),
        ),
        GetPage(
          name: BodyEditProfilePage.id,
          page: () => BodyEditProfilePage(),
        ),
        GetPage(
          name: BottomSheetCalendarDocumentsProfilePage.id,
          page: () => BottomSheetCalendarDocumentsProfilePage(),
        ),

        ///для страницы Чат
        GetPage(
          name: ChatPage.id,
          page: () => ChatPage(),
        ),
        GetPage(
          name: UserProfilePage.id,
          page: () => UserProfilePage(),
        ),
        GetPage(
          name: ChatWithUserPage.id,
          page: () => ChatWithUserPage(),
        ),

        ///для страницы Главная
        GetPage(
          name: HomePage.id,
          page: () => HomePage(),
        ),
        GetPage(
          name: AddNewEventHomePage.id,
          page: () => AddNewEventHomePage(),
        ),
        GetPage(
          name: AddNewDishHomePage.id,
          page: () => AddNewDishHomePage(),
        ),
        GetPage(
          name: BottomSheetCategoriesOfNotificationsProfilePage.id,
          page: () => BottomSheetCategoriesOfNotificationsProfilePage(),
        ),
        GetPage(
          name: FoodPage.id,
          page: () => FoodPage(),
        ),

        GetPage(
          name: WorkoutPageFromHomePage.id,
          page: () => WorkoutPageFromHomePage(),
        ),
        GetPage(
          name: WorkoutProgressPage.id,
          page: () => WorkoutProgressPage(),
        ),
        GetPage(
          name: AboutWorkoutProgressPage.id,
          page: () => AboutWorkoutProgressPage(),
        ),
        GetPage(
          name: DoctorsAppointmentPage.id,
          page: () => DoctorsAppointmentPage(),
        ),
        GetPage(
          name: VideoChatWithPsychologistPage.id,
          page: () => VideoChatWithPsychologistPage(),
          binding: RTCBinding(),
        ),

        GetPage(
          name: DefaultTaskForDayPage.id,
          page: () => DefaultTaskForDayPage(),
        ),

        ///для звонков
        GetPage(
          name: AgoraWithVideo.id,
          page: () => AgoraWithVideo(),
          binding: RTCBinding(),
        ),
        GetPage(
          name: IncomingVideoChatPage.id,
          page: () => IncomingVideoChatPage(),
          binding: RTCBinding(),
        ),

        ///для страницы статей
        GetPage(
          name: ArticlesPage.id,
          page: () => ArticlesPage(),
        ),
        GetPage(
          name: AboutArticlePage.id,
          page: () => AboutArticlePage(),
        ),

        ///для страницы Прочее
        GetPage(
          name: OtherPage.id,
          page: () => OtherPage(),
        ),
        GetPage(
          name: ChangePasswordOtherPage.id,
          page: () => ChangePasswordOtherPage(),
        ),
        GetPage(
          name: SubscriptionsOtherPage.id,
          page: () => SubscriptionsOtherPage(),
        ),
        GetPage(
          name: BodyOrdersHistoryOtherPage.id,
          page: () => BodyOrdersHistoryOtherPage(),
        ),
        GetPage(
          name: AboutOrderPage.id,
          page: () => AboutOrderPage(),
        ),
      ],
    );
  }
}
