import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

void imageViewBottom({
  required BuildContext context,
  String? imagePath,
  Uint8List? uint8ListImage,
  required Object heroTag,
}) =>
    showBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      // shape: const ContinuousRectangleBorder(),
      builder: (BuildContext context) {
        return PhotoViewGestureDetectorScope(
          axis: Axis.vertical,
          child: PhotoView(
            // disableGestures: true,
            // enablePanAlways: true,
            minScale: PhotoViewComputedScale.contained * 1,
            maxScale: PhotoViewComputedScale.contained * 3,
            backgroundDecoration: BoxDecoration(
              color: Colors.black.withAlpha(200),
            ),
            imageProvider: (uint8ListImage != null && imagePath == null)
                ? MemoryImage(
                    uint8ListImage,
                  )
                : CachedNetworkImage(
                    imageUrl: imagePath!,
                  ) as ImageProvider,
            heroAttributes: PhotoViewHeroAttributes(tag: heroTag),
          ),
        );
      },
    );
