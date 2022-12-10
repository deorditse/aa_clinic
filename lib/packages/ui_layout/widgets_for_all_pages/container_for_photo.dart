import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/my_shimmer_effect_container.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/material_sceleton_pages/image_view_page.dart';
import 'package:business_layout/business_layout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:model/model.dart';

//delete after test
Widget containerForPhoto(
    {required String imagePathNetwork, required BuildContext context}) {
  return Container(
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(10))),
    child: CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: imagePathNetwork,
    ),
  );
}

Widget containerForPhotoFuture({
  required String coverFileId,
  bool openView = false,
  bool isCircular = false,
}) {
  return FutureBuilder<Uint8List?>(
    future: ImplementSettingGetXController.instance
        .getStaticFilesStorageAsUTF8(coverFileId: coverFileId),
    builder: (context, AsyncSnapshot<Uint8List?> snapshot) {
      if (snapshot.hasData) {
        return GestureDetector(
          onTap: openView
              ? () {
                  imageViewBottom(
                    context: context,
                    uint8ListImage: snapshot.data!,
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
