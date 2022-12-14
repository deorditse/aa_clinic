import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/my_shimmer_effect_container.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/image_view_page.dart';
import 'package:business_layout/business_layout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

class ContainerForPhotoFuture extends StatelessWidget {
  const ContainerForPhotoFuture(
      {Key? key,
      required this.coverFileId,
      this.openView = false,
      this.isCircular = false,
      this.imageFromNetwork})
      : super(key: key);
  final String? coverFileId;
  final bool openView;
  final bool isCircular;
  final String? imageFromNetwork;

  @override
  Widget build(BuildContext context) {
    return imageFromNetwork != null && coverFileId == null
        ? GestureDetector(
            onTap: openView
                ? () {
                    imageViewBottom(
                      context: context,
                      imagePathForNetworkImage: imageFromNetwork,
                      heroTag: 'null',
                    );
                  }
                : null,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
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
          )
        : FutureBuilder<Uint8List?>(
            future: ImplementSettingGetXController.instance
                .getStaticFilesStorageAsUTF8(coverFileId: coverFileId!),
            builder: (context, AsyncSnapshot<Uint8List?> snapshot) {
              if (snapshot.hasData) {
                return GestureDetector(
                  onTap: openView
                      ? () {
                          imageViewBottom(
                            context: context,
                            uint8ListImageForMemoryImage: snapshot.data!,
                            heroTag: 'null',
                          );
                        }
                      : null,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(isCircular ? 200 : 0),
                    ),
                    child: Image.memory(
                      snapshot.data!,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              } else {
                return myShimmerEffectContainer(context: context);
              }
            },
          );
  }
}
