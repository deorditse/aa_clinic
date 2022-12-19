import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:style_app/style_app.dart';

const SizedBox mySizedHeightBetweenContainer = SizedBox(height: 13);
const double myHorizontalPaddingForContainer = 9;
const double myTopPaddingForContent = 15;
const double myToolbarHeight = 35;
const Color myColorIsActive = Color.fromRGBO(14, 201, 214, 1);

BoxDecoration myDecorationBackgroundImageContainer({
  String? imageNewPath,
}) {
  return BoxDecoration(
    image: DecorationImage(
      image: AssetImage(
        imageNewPath != null
            ? 'assets/images/$imageNewPath'
            : Get.isDarkMode
                ? 'assets/images/fon_1.png'
                : 'assets/images/light_theme/fon_1_light.png',
      ),
      fit: BoxFit.cover,
    ),
  );
}

Widget myIconBackAppBar({required BuildContext context, double? sizeIcon}) =>
    SizedBox(
      // width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 10.0,
          // left: myHorizontalPaddingForContainer,
        ),
        child: Icon(
          Icons.arrow_back_ios_new_sharp,
          size: sizeIcon ?? 30,
        ),
      ),
    );

Icon myIconForward({Color? color, required BuildContext context}) => Icon(
      Icons.arrow_forward_ios,
      color: color ?? Theme.of(context).textTheme.headline1!.color,
      // weight: 1,
    );

String abbreviatedTitleDateAppBar(
        {required DateTime mySelectedDay, bool isShort = false}) =>
    '${isShort ? DateFormat('EE').format(mySelectedDay).capitalizeFirst : DateFormat('EEEE').format(mySelectedDay).capitalizeFirst}, ${DateFormat('d MMM').format(mySelectedDay)}';
