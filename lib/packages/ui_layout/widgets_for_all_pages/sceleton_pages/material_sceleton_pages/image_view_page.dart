import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

void imageViewBottom({
  required BuildContext context,
  String? imagePathForNetworkImage,
  Uint8List? uint8ListImageForMemoryImage,
  required Object heroTag,
}) =>
    showBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return PhotoViewGestureDetectorScope(
          axis: Axis.vertical,
          child: PhotoView(
            minScale: PhotoViewComputedScale.contained * 1,
            maxScale: PhotoViewComputedScale.contained * 3,
            backgroundDecoration: BoxDecoration(
              color: Colors.black.withAlpha(200),
            ),
            imageProvider: (uint8ListImageForMemoryImage != null &&
                    imagePathForNetworkImage == null)
                ? MemoryImage(
                    uint8ListImageForMemoryImage,
                  )
                : CachedNetworkImageProvider(
                    imagePathForNetworkImage!,
                  ) as ImageProvider,
            heroAttributes: PhotoViewHeroAttributes(tag: heroTag),
          ),
        );
      },
    );
