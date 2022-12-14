import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/container_for_photo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';

class BottomSheetAboutProduct extends StatelessWidget {
  BottomSheetAboutProduct({
    Key? key,
    required this.marketProductModel,
  }) : super(key: key);
  final MarketProductModel? marketProductModel;

  static showBottomSheetAboutProduct({
    required MarketProductModel? marketProductModel,
    required context,
  }) {
    if (marketProductModel != null) {
      _myShowMaterialModalBottomSheet(
        marketProductModel: marketProductModel,
        context: context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          constraints: BoxConstraints(
            maxHeight: Get.size.height / 4,
          ),
          child: marketProductModel!.imagesFileIds.first != null
              ? ContainerForPhotoFuture(
                  coverFileId: marketProductModel!.imagesFileIds.first!,
                )
              : Container(),
        ),
        Flexible(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: myTopPaddingForContent),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  mySizedHeightBetweenContainer,
                  Text(
                    '${marketProductModel?.title ?? ''}',
                    style: myTextStyleFontUbuntu(
                      context: context,
                      newFontWeight: FontWeight.w500,
                    ),
                  ),
                  mySizedHeightBetweenContainer,
                  Text(
                    '${marketProductModel?.description ?? ''}',
                    style: myTextStyleFontUbuntu(
                      context: context,
                      newFontWeight: FontWeight.w300,
                      textColor: Theme.of(context)
                          .textTheme
                          .headline1!
                          .color!
                          .withOpacity(0.75),
                    ),
                  ),
                  mySizedHeightBetweenContainer,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${marketProductModel?.volume ?? ''} ${marketProductModel?.volumeUnits ?? ''} / ${marketProductModel?.price ?? ''} ${marketProductModel?.currency ?? ''}',
                        style: myTextStyleFontUbuntu(
                          context: context,
                          newFontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  mySizedHeightBetweenContainer,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  static void _myShowMaterialModalBottomSheet({
    required MarketProductModel? marketProductModel,
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
     // useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      // expand: false,
      // animationCurve: Curves.fastLinearToSlowEaseIn,
      builder: (_) => SafeArea(
        maintainBottomViewPadding: true,

        child: Padding(
          padding: EdgeInsets.only(
            left: myHorizontalPaddingForContainer,
            right: myHorizontalPaddingForContainer,
          ),
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            ),
            child:
                BottomSheetAboutProduct(marketProductModel: marketProductModel),
          ),
        ),
      ),
    );
  }
}
