import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Widget myIconSearchForAppBar({required BuildContext context}) =>
    SvgPicture.asset(
      'assets/icons/search.svg',
      semanticsLabel: 'search',
      color:
          Get.isDarkMode ? null : Theme.of(context).textTheme.headline1!.color,
      fit: BoxFit.contain,
    );
