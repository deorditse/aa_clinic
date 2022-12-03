import 'package:business_layout/business_layout.dart';
import 'package:data_layout/data_layout.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

class ActiveValueControllerProfilePage extends GetxController {
  static ActiveValueControllerProfilePage instance =
      Get.find<ActiveValueControllerProfilePage>();

  final HealthSnapshotsLoaderData _services = HealthSnapshotsLoaderData();

  @override
  void onInit() {
    if (ImplementAuthController.instance.userAuthorizedData?.accessToken !=
        null) {
      _getActiveValues();
      _sendHealthDataToServer();
    }
    super.onInit();
  }

  ActiveValue? activeHealthValues;

  /// Запрос на обработку определенных данных здоровья с последующим выводом их на экран active_values
  /// Инициализируется при переходе на страницу пользователя
  Future<void> _getActiveValues() async {
    activeHealthValues = await _services.getActiveHealthValues();
    update();
  }

  /// Получение данных здоровья
  Future<void> _sendHealthDataToServer() async {
    return await _services.fetchData(
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
    );
  }
}
