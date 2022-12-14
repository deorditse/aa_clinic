import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/button_alert_message.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/sceleton_show_bottomSheet.dart';
import 'package:get/get.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:business_layout/business_layout.dart';

import 'widgets/list_carts.dart';
import 'widgets/product_card_in_the_purchase_history.dart';

class AboutOrderPage extends StatefulWidget {
  static const String id = '/aboutOrderPage';

  const AboutOrderPage({Key? key, this.indexOrder}) : super(key: key);
  final int? indexOrder;

  static openAboutOrderPage(
          {required BuildContext context, required int indexOrder}) =>
      showBottomSheetContainer(
        context: context,
        backLine: true,
        onlyBack: false,
        titleAppBar:
            'Заказ ${OtherControllerGetxState.instance.orders!.docs[indexOrder]!.id.substring(0, 4)}',
        widgetBody: AboutOrderPage(indexOrder: indexOrder),
      );

  @override
  State<AboutOrderPage> createState() => _AboutOrderPageState();
}

class _AboutOrderPageState extends State<AboutOrderPage> {
  late final Order order;

  @override
  void initState() {
    super.initState();
    //получаю данные заказчика
    order = OtherControllerGetxState.instance.orders!.docs[widget.indexOrder!]!;
    ImplementSettingGetXController.instance.getFindMe();
  }

  @override
  Widget build(BuildContext context) {
    print(order);
    return SizedBox(
      height: Get.height * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          mySizedHeightBetweenContainer,
          GetBuilder<ImplementSettingGetXController>(
            builder: (controllerSetting) {
              UserDataModel? userDataModel = controllerSetting.userAllData;
              return Text(
                'Заказчик: ${userDataModel != null ? '${userDataModel.lastName ?? ''} ${userDataModel.firstName ?? ''} ${userDataModel.middleName ?? ''}' : 'загрузка...'}',
                style: myTextStyleFontUbuntu(
                  context: context,
                  newFontWeight: FontWeight.w300,
                ),
              );
            },
          ),
          mySizedHeightBetweenContainer,
          Text(
            'Адрес: ${order.address}',
            style: myTextStyleFontUbuntu(
              context: context,
              newFontWeight: FontWeight.w300,
            ),
          ),
          mySizedHeightBetweenContainer,
          Expanded(
            child: ListCarts(indexOrder: widget.indexOrder!),
          ),
          buttonAlertMessage(
            context: context,
            message: order.status == 'draft'
                ? 'Черновик'
                : order.status == 'sended'
                    ? 'Отправлено'
                    : order.status == 'payed'
                        ? 'Оплачено'
                        : 'Отклонено',
            isDone: (order.status == 'sended' || order.status == 'payed')
                ? true
                : false,
          ),
        ],
      ),
    );
  }
}
