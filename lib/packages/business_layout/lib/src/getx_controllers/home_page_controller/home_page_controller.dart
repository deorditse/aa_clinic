import 'dart:core';
import 'dart:io';
import 'dart:math';
import 'package:business_layout/business_layout.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:model/model.dart';
import 'package:data_layout/data_layout.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timezone/timezone.dart' as tz;

//каждый раз при изменении запускать кодогенерацию
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs
//чтобы зарегистрировать как фабрику для GetIt и обращаться к сервис локатору через  MainSimpleStateManagement

class HomePageCalendarControllerGetxState extends GetxController {
  static HomePageCalendarControllerGetxState instance =
      Get.find<HomePageCalendarControllerGetxState>();

  final HomePageData _services = HomePageData();
  DateTime mySelectedDay = DateTime.now();

  void changeMySelectedDay({required DateTime newDateTime}) {
    mySelectedDay = newDateTime;
    update();
  }

  @override
  void onInit() {
    print('initializeProfileData HomePageCalendarControllerGetxState');

    initializeHomePageData(isUpdate: true);
    getNotification();

    super.onInit();
  }

  ///  инициaлизация данных контроллера
  Future<void> initializeHomePageData(
      {DateTime? dateMarksMouth, bool isUpdate = false}) async {
    if (ImplementAuthController.instance.userAuthorizedData?.accessToken !=
        null) {
      //инициирую марки задач в календаре
      getMonthlyCalendarMarksForMouth(
        dateMarksMouth: dateMarksMouth ?? DateTime.now(),
        isUpdate: isUpdate,
      ).whenComplete(
        () async {
          //загружаю задачи на сегодняшний день
          await getDailyCalendarEvents(
            dateDaily: dateMarksMouth ?? DateTime.now(),
            isUpdate: isUpdate,
          );
        },
      );

      //отправка данных здоровья на сервер при инициализации приложения
      await HealthSnapshotsLoaderData().safeFetchData(
        accessToken:
            ImplementAuthController.instance.userAuthorizedData!.accessToken,
      );
    }
    await _initializedHiveFromLocalStorageNotifications();
  }

  ///получение марок в календаре +
  //  чтобы сохранять в текущей сессии и не тянyть из базы если есть в мапе Map<String, Map<String, List<int>>> == год и месяц / map <дата события / количество событий>
  Map<String, Map<String, int>> marksCountForMonth = {};

  Future<void> getMonthlyCalendarMarksForMouth({
    required DateTime dateMarksMouth,
    bool isUpdate = false,
  }) async {
    //делаю запрос к серверу если нет в списке marksCountForMonth этого события
    String _formatData = '${dateMarksMouth.year}-${dateMarksMouth.month}';

    final Map<String, int>? _marksForMonth = marksCountForMonth[_formatData];

    if ((_marksForMonth == null || isUpdate) &&
        ImplementAuthController.instance.userAuthorizedData?.accessToken !=
            null) {
      marksCountForMonth[_formatData] =
          await _services.getMonthlyCalendarMarksData(
        accessToken:
            ImplementAuthController.instance.userAuthorizedData!.accessToken,
        dateMark: dateMarksMouth,
      );
      print(
          "marksCountForMonth from getMonthlyCalendarMarksForMouth $marksCountForMonth");
      update();
    }
  }

  bool isMarkForDayFun({DateTime? dateDay}) {
    DateTime dateDaily = dateDay ?? mySelectedDay;
    String _formatData =
        "${dateDaily.year}-${dateDaily.month}-${dateDaily.day}";

    //проверяю есть ли марка на этот день (+- интервал соседних месяцев)
    bool isMarkForDay =
        (marksCountForMonth['${dateDaily.year}-${dateDaily.month}']
                    ?[_formatData] !=
                null ||
            marksCountForMonth['${dateDaily.year}-${dateDaily.month + 1}']
                    ?[_formatData] !=
                null ||
            marksCountForMonth['${dateDaily.year}-${dateDaily.month - 1}']
                    ?[_formatData] !=
                null);

    return isMarkForDay;
  }

  ///получение событий выбранной даты +
  //  чтобы сохранять в текущей сессии и не тянyть из базы если есть в мапе Map<String, DailyCalendarEventsModel> == год и месяц / DailyCalendarEventsModel
  Map<String, List<DailyCalendarEventsModel?>> eventsForDay = {};

  Future<List<DailyCalendarEventsModel?>> getDailyCalendarEvents(
      {required DateTime dateDaily, bool isUpdate = false}) async {
    String _formatData =
        "${dateDaily.year}-${dateDaily.month}-${dateDaily.day}";

    if (isMarkForDayFun(dateDay: dateDaily)) {
      ///проверяю есть ли такой лист eventsForDay в контроллере

      if (isUpdate ||
          ((eventsForDay[_formatData] == null) &&
              ImplementAuthController.instance.userAuthorizedData != null)) {
        List<DailyCalendarEventsModel?> _res =
            await _services.getDailyCalendarEventsData(
          accessToken:
              ImplementAuthController.instance.userAuthorizedData!.accessToken,
          dateDaily: dateDaily,
        );
        eventsForDay[_formatData] = _res;
        update();
        _initProgressValue(listDailyCalendarEvents: _res);
        return _res;
      } else {
        _initProgressValue(listDailyCalendarEvents: eventsForDay[_formatData]!);
        return eventsForDay[_formatData]!;
      }
    } else {
      //обнуление рейтинга на этот день так как нет марок
      _initProgressValue(listDailyCalendarEvents: []);

      return [];
    }
  }

  ///Для событий календаря апи
  //  чтобы сохранять в текущей сессии и не тянyть из базы если есть в мапе Map<String, CalendarActionsWithIdModel> == targetId :  CalendarActionsWithIdModel
  Map<String, CalendarActionsWithIdModel?> mapTargetIdAndCalendarActionsWithId =
      {};

  ///СТРАНИЦА ПО ДЕФОЛТУ для получения данных на странице задачи на день +

  Future<void> getCalendarActionsWithId(
      {required String targetId, bool isUpdate = false}) async {
    if (mapTargetIdAndCalendarActionsWithId[targetId] == null || isUpdate) {
      mapTargetIdAndCalendarActionsWithId[targetId] =
          await _services.getCalendarActionsWithIdData(
        accessToken:
            ImplementAuthController.instance.userAuthorizedData!.accessToken,
        targetId: targetId,
      );

      update();
    }
  }

  ///СТРАНИЦА Nutri Meal для получения данных на странице задачи на день +
  //  чтобы сохранять в текущей сессии и не тянyть из базы если есть в мапе Map<String, NutriMealsModel> == targetId :  NutriMealsModel

  Map<String, NutriMealsModel?> mapTargetIdAndNutriMealsWithId = {};

  Future<void> getNutriMealsWithId(
      {required String targetId, bool isUpdate = false}) async {
    if (mapTargetIdAndNutriMealsWithId[targetId] == null || isUpdate) {
      final result = await _services.getNutriMealsWithIdData(
        accessToken:
            ImplementAuthController.instance.userAuthorizedData!.accessToken,
        targetId: targetId,
      );
      mapTargetIdAndNutriMealsWithId[targetId] = result;
      update();
    }
  }

  ///СТРАНИЦА Appointment для получения данных на странице задачи на день +
  //  чтобы сохранять в текущей сессии и не тянyть из базы если есть в мапе Map<String, AppointmentsModel> == targetId :  AppointmentsModel

  Map<String, AppointmentsModel?> mapTargetIdAndAppointmentsWithId = {};

  Future<void> getAppointmentsWithId(
      {required String targetId, bool isUpdate = false}) async {
    if (mapTargetIdAndAppointmentsWithId[targetId] == null || isUpdate) {
      final result = await _services.getAppointmentsWithIdData(
        accessToken:
            ImplementAuthController.instance.userAuthorizedData!.accessToken,
        targetId: targetId,
      );
      mapTargetIdAndAppointmentsWithId[targetId] = result;
      update();
    }
  }

  ///Роут для получения оценки показателя здоровья (Значение показателя здоровья от 1 до 100) +
  Future<int?> getHealthRates() async {
    return await _services.getHealthRatesData(
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
    );
  }

  ///Роут для отмены приёма по его id +
  Future<void> calendarAppointmentsCancel({
    required String targetId,
    required String? cancelReason,
  }) async {
    await _services
        .calendarAppointmentsCancelData(
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
      targetId: targetId,
      cancelReason: cancelReason ?? 'Причина отмены не указана',
    )
        .whenComplete(() async {
      //обновляю данные на этот день чтобы поменять статусы
      if (mapTargetIdAndAppointmentsWithId[targetId]?.startedAt != null) {
        await getDailyCalendarEvents(
          isUpdate: true,
          dateDaily: DateTime.parse(
            mapTargetIdAndAppointmentsWithId[targetId]!.startedAt!,
          ),
        ).whenComplete(() async {
          //обновляю это событие
          await getAppointmentsWithId(targetId: targetId, isUpdate: true);
        });
      }
    });
  }

  ///Роут для отмены календарного события и изменение его на статуса cancel +
  Future<void> calendarActionCancel({
    required String targetId,
    required String? cancelReason,
  }) async {
    await _services
        .calendarActionCancelData(
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
      targetId: targetId,
      cancelReason: cancelReason ?? '',
    )
        .whenComplete(
      () async {
        //обновляю данные на этот день
        if (mapTargetIdAndCalendarActionsWithId[targetId]?.startedAt != null) {
          getDailyCalendarEvents(
            isUpdate: true,
            dateDaily: DateTime.parse(
              mapTargetIdAndCalendarActionsWithId[targetId]!.startedAt!,
            ),
          ).whenComplete(() async {
            //обновляю это событие
            await getCalendarActionsWithId(targetId: targetId, isUpdate: true);
          });
        }
      },
    );
  }

  ///Роут для завершения календарного события и изменение его на статуса done +
  Future<void> calendarActionDone({required String targetId}) async {
    await _services
        .calendarActionDoneData(
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
      targetId: targetId,
    )
        .whenComplete(
      () async {
        //обновляю данные на этот день
        if (mapTargetIdAndCalendarActionsWithId[targetId]?.startedAt != null) {
          getDailyCalendarEvents(
            isUpdate: true,
            dateDaily: DateTime.parse(
              mapTargetIdAndCalendarActionsWithId[targetId]!.startedAt!,
            ),
          ).whenComplete(() async {
            //обновляю это событие
            await getCalendarActionsWithId(targetId: targetId, isUpdate: true);
          });
        }
      },
    );
  }

  ///для подсчета прогресса
  double progressValue = 1.0;

  void _initProgressValue(
      {required List<DailyCalendarEventsModel?> listDailyCalendarEvents}) {
    final int allEventForDay = listDailyCalendarEvents.length;
    if (allEventForDay != 0) {
      int countEventsIsDone = 0;
      for (var dayEvent in listDailyCalendarEvents) {
        if (dayEvent!.isDone) {
          countEventsIsDone++;
        }
      }

      progressValue = countEventsIsDone / allEventForDay;
      update();
    } else {
      progressValue = 1;
      update();
    }
  }

  ///добавление фото еды в карточку на странице еда
  File? photoFood;

  ///добавление фото еды в карточку / удаление
  //обновление lifeImage еды чтобы закрыть прием пищи +
  Future<void> changePhotoFood({
    File? file,
    bool isDeletePhoto = false,
    required int indexDish,
    required String targetId,
    bool isDeletePhotoFoodFile = false,
  }) async {
    if (isDeletePhotoFoodFile) {
      photoFood = null;
      update();
      return;
    }
    if (file != null) {
      photoFood = file;
      update();
      //сохраняю фото еды на сервер
      //сначала получим coverId

      await ImplementSettingGetXController.instance
          .postStaticFilesAndGetIdImage(
        filePath: file.path,
        isAttachmentsRoute: false,
      )
          .then(
        (coverId) async {
          //теперь записываю в базу

          if (coverId != null) {
            mapTargetIdAndNutriMealsWithId[targetId]!
                .dishes[indexDish]!
                .lifeImage = coverId;
            update();
          }

          await _services
              .updateNutriMealsData(
            targetId: targetId,
            dataNutriMeal: mapTargetIdAndNutriMealsWithId[targetId]!,
            accessToken: ImplementAuthController
                .instance.userAuthorizedData!.accessToken,
          )
              .whenComplete(
            () async {
              await getDailyCalendarEvents(
                dateDaily: mySelectedDay,
                isUpdate: true,
              );
            },
          );
        },
      );
    } else {
      NutriDishModel? dish =
          mapTargetIdAndNutriMealsWithId[targetId]!.dishes[indexDish];
      if (isDeletePhoto) {
        photoFood = null;
        update();

        if (dish?.image != dish?.lifeImage) {
          //if image != lifeImage то могу удалить lifeImage
          if (dish?.lifeImage != null) {
            await ImplementSettingGetXController.instance
                .deleteStaticFilesAndGetIdImage(
              coverId: dish!.lifeImage!,
            )
                .whenComplete(
              () async {
                mapTargetIdAndNutriMealsWithId[targetId]!
                    .dishes[indexDish]!
                    .lifeImage = null;
                update();

                await _services
                    .updateNutriMealsData(
                  targetId: targetId,
                  dataNutriMeal: mapTargetIdAndNutriMealsWithId[targetId]!,
                  accessToken: ImplementAuthController
                      .instance.userAuthorizedData!.accessToken,
                )
                    .whenComplete(
                  () async {
                    await getDailyCalendarEvents(
                      dateDaily: mySelectedDay,
                      isUpdate: true,
                    );
                  },
                );
              },
            );
          }
        } else {
          //if image == lifeImage то могу удалить lifeImage
          mapTargetIdAndNutriMealsWithId[targetId]!
              .dishes[indexDish]!
              .lifeImage = null;
          update();
          await _services
              .updateNutriMealsData(
            targetId: targetId,
            dataNutriMeal: mapTargetIdAndNutriMealsWithId[targetId]!,
            accessToken: ImplementAuthController
                .instance.userAuthorizedData!.accessToken,
          )
              .whenComplete(
            () async {
              await getDailyCalendarEvents(
                dateDaily: mySelectedDay,
                isUpdate: true,
              );
            },
          );
        }
      }
    }
  }

  ///новое создание приема еды NutriMeals +

  Future<void> postNutriMeals({
    required String title,
    required String? description,
    required List<NutriDishModel> listDishes,
  }) async {
    await _services.postNutriMealsData(
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
      title: title,
      description: description,
      listDishes: listDishes,
    );

    initializeHomePageData(
      isUpdate: true,
      dateMarksMouth: mySelectedDay,
    );
  }

  ///для уведомлений
  ///для уведомлений после календаря
  Box?
      _boxNotifications; //перенести на слой данных создав отелбную модель для этого
  //Таймер уведомлений

  ///инициализация данных из хранилища
  Future<void> _initializedHiveFromLocalStorageNotifications() async {
    await Hive.initFlutter(); //иннициализируем Hive

    _boxNotifications = await Hive.openBox('Notifications');
    update();
    //отключить уведомления
    isDisableNotifications =
        _boxNotifications!.get('isDisableNotifications') ?? false;
    update();
    //Таймер уведомлений
    isRemindTimeNotifications =
        _boxNotifications!.get('isRemindTimeNotifications') ?? 5;
    update();
    //Категории уведомлений
    isWorkoutNotifications =
        _boxNotifications!.get('isWorkoutNotifications') ?? true;
    isConsultationsNotifications =
        _boxNotifications!.get('isConsultationsNotifications') ?? true;
    isFoodNotifications = _boxNotifications!.get('isFoodNotifications') ?? true;
    isDeliveryNotifications =
        _boxNotifications!.get('isDeliveryNotifications') ?? true;
    update();
  }

  void _saveNotificationsInLocalStorage(
      {required String notifications, required valueNotification}) {
    if (_boxNotifications != null) {
      _boxNotifications!.put(notifications, valueNotification);
    }
  }

  //отключить уведомления
  bool isDisableNotifications = false;

  void changeDisableNotifications({required bool newIsDisableNotifications}) {
    isDisableNotifications = newIsDisableNotifications;
    update();
    //save in local storage
    _saveNotificationsInLocalStorage(
      notifications: 'isDisableNotifications',
      valueNotification: newIsDisableNotifications,
    );
  }

  //Категории уведомлений
  //Тренировки
  bool isWorkoutNotifications = true;

  void changeWorkoutNotifications({required bool newIsWorkoutNotifications}) {
    isWorkoutNotifications = newIsWorkoutNotifications;
    update();
    //save in local storage
    _saveNotificationsInLocalStorage(
      notifications: 'isWorkoutNotifications',
      valueNotification: newIsWorkoutNotifications,
    );
  }

  //Консультации
  bool isConsultationsNotifications = true;

  void changeConsultationsNotifications(
      {required bool newIsConsultationsNotifications}) {
    isConsultationsNotifications = newIsConsultationsNotifications;
    update();
    //save in local storage
    _saveNotificationsInLocalStorage(
      notifications: 'isConsultationsNotifications',
      valueNotification: newIsConsultationsNotifications,
    );
  }

//Пища
  bool isFoodNotifications = true;

  void changeFoodNotifications({required bool newIsFoodNotifications}) {
    isFoodNotifications = newIsFoodNotifications;
    update();
    //save in local storage
    _saveNotificationsInLocalStorage(
      notifications: 'isFoodNotifications',
      valueNotification: newIsFoodNotifications,
    );
  }

//Доставка
  bool isDeliveryNotifications = true;

  void changeDeliveryNotifications({required bool newIsDeliveryNotifications}) {
    isDeliveryNotifications = newIsDeliveryNotifications;
    update();
    //save in local storage
    _saveNotificationsInLocalStorage(
      notifications: 'isDeliveryNotifications',
      valueNotification: newIsDeliveryNotifications,
    );
  }

  //Таймер уведомлений
  int isRemindTimeNotifications = 5;

  void changeRemindTimeNotifications(
      {required int newIsRemindTimeNotification}) {
    isRemindTimeNotifications = newIsRemindTimeNotification;
    update();
    //save in local storage
    _saveNotificationsInLocalStorage(
      notifications: 'isRemindTimeNotifications',
      valueNotification: newIsRemindTimeNotification,
    );
  }

  FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  DailyCalendarEventsModel? dailySheet;

  ///Метод для отправки уведомлений пользователю с тайтлом таски
  Future<void> scheduleNotification(
      {required int hour, required int minutes}) async {
    //Переменная с методом случайных значений нужна для привязки уникального id уведомлению
    Random random = Random();
    int idNotification = random.nextInt(100);
    //Инициализирую переменную, которая хранит в себе значение таймера уведомлений(Hive)
    final remindNotifications = isRemindTimeNotifications;
    //Метод для отправки запланированных уведомлений
    await notificationsPlugin.zonedSchedule(
      //Id уведомления (если не указывать каждому уведомлению свой id, будет приходить только последнее записанное уведомление)
      idNotification,
      'Необходимо выполнить!',
      //Вывод тайтла таски в сообщение уведомления
      '${dailySheet?.title != null ? dailySheet?.title : ' '}',
      //Метод для отправки уведомлений по времени с вычитанием минут из таймера уведомлений, чтобы сообщения приходили заранее (по выбору пользователя)
      await convertTime(
        hour: hour,
        minutes: minutes - remindNotifications,
      ),
      NotificationDetails(
        android: AndroidNotificationDetails(
            '${dailySheet?.targetId}', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            enableVibration: true),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: 'go',
    );
  }

  Future<tz.TZDateTime> convertTime(
      {required int hour, required int minutes}) async {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate = await tz.TZDateTime(
        tz.local, now.year, now.month, now.day, hour, minutes);
    print("scheduleDate $scheduleDate");
    return scheduleDate;
  }

  /// Инициализирую уведомления
  Future getNotification() async {
    AndroidInitializationSettings androidSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    DarwinInitializationSettings iosSettings =
        const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestCriticalPermission: true,
      requestSoundPermission: true,
    );
    FlutterLocalNotificationsPlugin notificationsPlugin =
        FlutterLocalNotificationsPlugin();
    notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
    InitializationSettings initializationSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );
    bool? initialized = await notificationsPlugin.initialize(
        initializationSettings, onDidReceiveNotificationResponse: (response) {
      print(response.payload.toString());
    });
    print('notification: $initialized');
  }
}
