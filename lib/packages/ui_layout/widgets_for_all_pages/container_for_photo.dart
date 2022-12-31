import 'dart:io';

import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/my_shimmer_effect_container.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/image_view_page.dart';
import 'package:business_layout/business_layout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ContainerForPhotoFuture extends StatelessWidget {
  const ContainerForPhotoFuture(
      {Key? key,
      required this.coverFileId,
      this.openView = false,
      this.isCircular = false,
      this.borderRadius,
      this.imageFromNetwork})
      : super(key: key);
  final double? borderRadius;
  final String? coverFileId;
  final bool openView;
  final bool isCircular;
  final String? imageFromNetwork;

  @override
  Widget build(BuildContext context) {
    if (coverFileId != null) {
      return FutureBuilder<Map<int, Uint8List?>?>(
        future: ImplementSettingGetXController.instance
            .getStaticFilesStorageAsUTF8(coverFileId: coverFileId!),
        builder: (context, AsyncSnapshot<Map<int, Uint8List?>?> snapshot) {
          if (snapshot.hasData && snapshot.data!.keys.first == 200) {
            return GestureDetector(
              onTap: openView
                  ? () {
                      imageViewBottom(
                        context: context,
                        uint8ListImageForMemoryImage:
                            snapshot.data!.values.first,
                        heroTag: 'null',
                      );
                    }
                  : null,
              child: Container(
                clipBehavior: Clip.hardEdge,
                height: MediaQuery.of(context).size.height / 3.3,
                width: double.infinity,
                decoration: myStyleContainer(context: context)
                    .copyWith(
                      color: isCircular
                          ? Colors.transparent
                          : Theme.of(context).backgroundColor,
                    )
                    .copyWith(
                      borderRadius: BorderRadius.circular(
                        isCircular ? 200 : borderRadius ?? 0,
                      ),
                    ),
                child: Image.memory(
                  snapshot.data!.values.first!,
                  fit: BoxFit.cover,
                ),
              ),
            );
          } else if (snapshot.hasData &&
              (snapshot.data!.keys.first == 404 ||
                  snapshot.data!.keys.first == 500)) {
            return containerIfNotPhoto(context: context);
          } else {
            return myShimmerEffectContainer(context: context);
          }
        },
      );
    } else if (imageFromNetwork != null && coverFileId == null) {
      return GestureDetector(
        onTap: openView
            ? () {
                imageViewBottom(
                  context: Get.context!,
                  imagePathForNetworkImage: imageFromNetwork,
                  heroTag: 'null',
                );
              }
            : null,
        child: Container(
          clipBehavior: Clip.hardEdge,
          width: double.infinity,
          decoration: myStyleContainer(context: context).copyWith(
            color: isCircular
                ? Colors.transparent
                : Theme.of(context).backgroundColor,
          ),
          child: CachedNetworkImage(
            imageUrl: imageFromNetwork!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return containerIfNotPhoto(context: context);
    }
  }
}

Container containerIfNotPhoto({required BuildContext context}) => Container(
      clipBehavior: Clip.antiAlias,
      height: 40,
      width: double.infinity,
      decoration: myStyleContainer(context: context).copyWith(
        color: Theme.of(context).backgroundColor,
      ),
      child: Center(
          child: Icon(
        Icons.image_not_supported_outlined,
        color: Theme.of(context).textTheme.headline3!.color!.withOpacity(0.2),
      )),
    );
