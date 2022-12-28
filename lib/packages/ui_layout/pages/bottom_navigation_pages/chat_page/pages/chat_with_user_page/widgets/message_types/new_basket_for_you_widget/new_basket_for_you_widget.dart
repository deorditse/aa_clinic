import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/style/style_chat.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/other_page/pages/orders_page/about_order_page/widgets/product_card_in_the_purchase_history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottom_sheet_about_product.dart';

class NewBasketForYouWidget extends StatefulWidget {
  const NewBasketForYouWidget({Key? key}) : super(key: key);

  @override
  State<NewBasketForYouWidget> createState() => _NewBasketForYouWidgetState();
}

class _NewBasketForYouWidgetState extends State<NewBasketForYouWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: myTopPaddingForContent),
      child: Container(
        constraints: BoxConstraints(maxWidth: Get.width * 0.85),
        decoration: myStyleContainer(
          context: context,
          color: Get.isDarkMode
              ? colorContainerIsDarkMode
              : colorContainerIsLightkMode,

          //Theme.of(context).backgroundColor,
        ),
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: myTopPaddingForContent),
          child: Column(
            children: [
              mySizedHeightBetweenContainer,
              Text(
                'Для Вас новая корзина',
                style: myTextStyleFontUbuntu(
                  textColor: Colors.white,
                  fontSize: 17,
                  context: context,
                ),
              ),
              mySizedHeightBetweenContainer,
              _listWithProducts(),
              ElevatedButton(
                style: ButtonStyle().copyWith(
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 20))),
                onPressed: () {},
                child: Text('КУПИТЬ'),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }

  _listWithProducts() {
    return ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        primary: false,
        itemCount: 0,///todo
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.only(bottom: myHorizontalPaddingForContainer),
            child: TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero),
              ),
              onPressed: () {
                BottomSheetAboutProduct.showBottomSheetAboutProduct(
                  context: context,
                  marketProductModel: null,
                );
              },
              child: ProductCardInThePurchaseHistory(
                colorIsDark: Color.fromRGBO(134, 134, 134, 0.5),
                colorIsLight: Color.fromRGBO(212, 214, 219, 0.5),
                marketProductModel: null,
                countProducts: null,
              ),
            ),
          );
        });
  }
}
