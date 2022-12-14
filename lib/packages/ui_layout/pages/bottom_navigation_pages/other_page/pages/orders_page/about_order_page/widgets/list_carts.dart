import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/chat_page/pages/chat_with_user_page/widgets/message_types/new_basket_for_you_widget/bottom_sheet_about_product.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/my_shimmer_effect_container.dart';

import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:business_layout/business_layout.dart';
import 'product_card_in_the_purchase_history.dart';

class ListCarts extends StatefulWidget {
  const ListCarts({Key? key, required this.indexOrder}) : super(key: key);
  final int indexOrder;

  @override
  State<ListCarts> createState() => _ListCartsState();
}

class _ListCartsState extends State<ListCarts> {
  @override
  Widget build(BuildContext context) {
    Order order =
        OtherControllerGetxState.instance.orders!.docs[widget.indexOrder]!;
    List<Cart?> listCart = order.cart;
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: listCart.length,
      itemBuilder: (BuildContext context, index) {
        Cart? cart = listCart[index];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: myTopPaddingForContent),
              child: FutureBuilder<MarketProductModel?>(
                future:
                    OtherControllerGetxState.instance.getMarketProductByOrderId(
                  idOrder: cart!.marketElementId!,
                ),
                builder:
                    (context, AsyncSnapshot<MarketProductModel?> snapshot) {
                  return snapshot.hasData
                      ? TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                          ),
                          onPressed: () {
                            BottomSheetAboutProduct.showBottomSheetAboutProduct(
                              context: context,
                              marketProductModel: snapshot.data,
                            );
                          },
                          child: ProductCardInThePurchaseHistory(
                            marketProductModel: snapshot.data,
                            countProducts: cart.count,
                          ),
                        )
                      : myShimmerEffectContainer(
                          context: context, newHeight: 80);
                },
              ),
            ),
            if (index == listCart.length - 1)
              Padding(
                padding: const EdgeInsets.only(bottom: myTopPaddingForContent),
                child: Text(
                  'Итого:   ${order.totalPrice} ${order.currency ?? ''}',
                  style: myTextStyleFontUbuntu(
                    context: context,
                    newFontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
