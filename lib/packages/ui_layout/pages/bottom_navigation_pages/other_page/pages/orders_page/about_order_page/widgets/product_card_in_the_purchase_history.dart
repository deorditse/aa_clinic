import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/container_for_photo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:business_layout/business_layout.dart';

class ProductCardInThePurchaseHistory extends StatelessWidget {
  const ProductCardInThePurchaseHistory({
    Key? key,
    this.colorIsDark,
    this.colorIsLight,
    required this.marketProductModel,
    required this.countProducts,
  }) : super(key: key);

  final MarketProductModel? marketProductModel;
  final Color? colorIsDark;
  final Color? colorIsLight;
  final int? countProducts;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: myStyleContainer(
          color: (colorIsDark != null && colorIsLight != null)
              ? Get.isDarkMode
                  ? colorIsDark
                  : colorIsLight
              : Theme.of(context).backgroundColor,
          context: context),
      clipBehavior: Clip.antiAlias,
      height: Get.size.height / 11,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              child: marketProductModel!.imagesFileIds.first != null
                  ? ContainerForPhotoFuture(
                      coverFileId: marketProductModel!.imagesFileIds.first!,
                    )
                  : Container(),
            ),
          ),
          Flexible(
            flex: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: myHorizontalPaddingForContainer),
                Flexible(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${marketProductModel?.title ?? ''}',
                      overflow: TextOverflow.ellipsis,
                      style: myTextStyleFontUbuntu(
                        context: context,
                        textColor: colorIsDark != null ? Colors.white : null,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      ' ${countProducts ?? '1'}x${marketProductModel?.volume ?? ''} ${marketProductModel?.volumeUnits ?? ''}',
                      style: myTextStyleFontUbuntu(
                        context: context,
                        newFontWeight: FontWeight.w300,
                        textColor: colorIsDark != null ? Colors.white : null,
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        '${marketProductModel?.price ?? ''} ${marketProductModel?.currency ?? ''}',
                        style: myTextStyleFontUbuntu(
                          context: context,
                          textColor: colorIsDark != null ? Colors.white : null,
                        ),
                      ),
                    ),
                    SizedBox(width: myHorizontalPaddingForContainer),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
