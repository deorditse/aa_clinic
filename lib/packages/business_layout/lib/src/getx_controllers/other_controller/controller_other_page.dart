import 'dart:ffi';

import 'package:business_layout/business_layout.dart';
import 'package:data_layout/data_layout.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

//каждый раз при изменении запускать кодогенерацию
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs
//чтобы зарегистрировать как фабрику для GetIt и обращаться к сервис локатору через  MainSimpleStateManagement

class OtherControllerGetxState extends GetxController {
  static OtherControllerGetxState instance =
  Get.find<OtherControllerGetxState>();
  final OtherPageData _services = OtherPageData();


  ///Роут для обновления пароля пользователя этого сеанса+
  Future<void> updatePassword(
      {required String newPassword, required String lastPassword}) async {
    await _services.updatePasswordData(
      newPassword: newPassword,
      lastPassword: lastPassword,
      accessToken:
      ImplementAuthController.instance.userAuthorizedData!.accessToken,
    );
  }

  ///Роут для получения списка подписок на маркет +
  SubscriptionsModel? subscriptions;

  Future<void> getMarketSubscriptions() async {
    if (subscriptions == null) {
      subscriptions = await _services.getMarketSubscriptionsData(
        accessToken:
        ImplementAuthController.instance.userAuthorizedData!.accessToken,
      );
      update();
    }
  }

  ///Роут для получения списка заказов +
  OrdersModel? orders;

  Future<void> getOrders() async {
    // if (orders == null) {
    orders = await _services.getOrdersData(
      accessToken:
      ImplementAuthController.instance.userAuthorizedData!.accessToken,
    );
    update();
    // }
  }

  ///Роут для получения продукта маркета по его id
  Future<MarketProductModel?> getMarketProductByOrderId(
      {required String idOrder}) async {
    return await _services.getMarketProductByOrderIdData(
      accessToken:
      ImplementAuthController.instance.userAuthorizedData!.accessToken,
      idOrder: idOrder,
    );
  }
}
