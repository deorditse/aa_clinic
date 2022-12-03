import 'dart:convert';

import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/other_page/pages/orders_page/about_order_page/about_order_page.dart';
import 'package:model/model.dart';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/ui_layout/pages/other_pages/authentication_page/main_login_page.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/my_shimmer_effect_container.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/sceleton_show_bottomSheet.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';

class BodyOrdersHistoryOtherPage extends StatefulWidget {
  static const String id = '/bodyOrdersHistoryOtherPage';

  const BodyOrdersHistoryOtherPage({Key? key}) : super(key: key);

  static openBodyOrdersHistoryOtherPage({required BuildContext context}) =>
      showBottomSheetContainer(
        context: context,
        backLine: true,
        onlyBack:false,
        expand: true,
        titleAppBar: 'История заказов',
        widgetBody: BodyOrdersHistoryOtherPage(),
      );

  @override
  State<BodyOrdersHistoryOtherPage> createState() =>
      _BodyOrdersHistoryOtherPageState();
}

class _BodyOrdersHistoryOtherPageState
    extends State<BodyOrdersHistoryOtherPage> {
  @override
  void initState() {
    super.initState();

    ///инициализирую список ордеров
    OtherControllerGetxState.instance.getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,

      child: GetBuilder<OtherControllerGetxState>(
        builder: (controllerOther) {
          bool isOrdersList = controllerOther.orders?.docs != null;
          return ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: isOrdersList ? controllerOther.orders!.docs.length : 10,
            itemBuilder: (BuildContext context, index) {
              if (isOrdersList) {
                return OrderList(index: index);
              } else {
                return Padding(
                  padding: EdgeInsets.only(bottom: myTopPaddingForContent),
                  child: myShimmerEffectContainer(
                    context: context,
                    newHeight: 50,
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class OrderList extends StatelessWidget {
  const OrderList({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final Order order = OtherControllerGetxState.instance.orders!.docs[index]!;
    return TextButton(
      style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
      onPressed: () {
        AboutOrderPage.openAboutOrderPage(context: context, indexOrder: index);
      },
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Order ${order.id.substring(0, 7)}',
              style: myTextStyleFontUbuntu(context: context),
              maxLines: 1,
              // overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: myHorizontalPaddingForContainer),
            child: Text(
              '${order.sendedAt != null ? DateFormat('d.M.yyyy').format(DateTime.parse(order.sendedAt!)) : '...'}',
              style: myTextStyleFontUbuntu(
                  newFontWeight: FontWeight.w300, context: context),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    '${order.totalPrice} ${order.currency ?? ''}',
                    textAlign: TextAlign.end,
                    style: myTextStyleFontUbuntu(context: context),
                  ),
                ),
                FittedBox(
                  alignment: Alignment.centerRight,
                  child: myIconForward(context: context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
