import 'package:flutter/material.dart';

const Color colorContainerIsDarkMode = Color.fromRGBO(82, 82, 82, 0.75);
const Color colorContainerIsLightkMode = Color.fromRGBO(46, 46, 46, 0.5);

BorderRadius borderRadiusReceivedMessage() => const BorderRadius.only(
      bottomLeft: Radius.zero,
      bottomRight: Radius.circular(20),
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    );

BorderRadius borderRadiusSendMessage() => const BorderRadius.only(
      bottomLeft: Radius.circular(20),
      bottomRight: Radius.zero,
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    );
