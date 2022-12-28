import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

Widget myShimmerEffectContainer({required BuildContext context, double? newHeight}) =>
    Shimmer.fromColors(
      baseColor: Theme.of(context).cardColor,
      direction: ShimmerDirection.ltr,
      highlightColor: Theme.of(context).backgroundColor,
      child: Container(
        height: newHeight,
        decoration: myStyleContainer(context: context),
      ),
    );
