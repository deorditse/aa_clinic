import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/my_shimmer_effect_container.dart';
import 'package:business_layout/business_layout.dart';
import 'package:flutter/services.dart';
import 'package:model/model.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/container_for_photo.dart';

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

gridWithPhoto({required int indexDocument}) {
  final document =
      ProfileControllerGetxState.instance.documentList!.docs[indexDocument];

  return SliverGrid(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      mainAxisSpacing: myHorizontalPaddingForContainer,
      crossAxisSpacing: myHorizontalPaddingForContainer,
      childAspectRatio: 1,
    ),
    delegate: SliverChildBuilderDelegate(
      childCount: document.attachments.length,
      (BuildContext context, int index) {
        return Container(
          decoration: myStyleContainer(context: context),
          clipBehavior: Clip.hardEdge,
          child: containerForPhotoFuture(
            coverFileId: document.attachments[index]!.thumbnailFileId!,
            openView: true,
          ),
        );
      },
    ),
  );
}
