import 'package:flutter/material.dart';
import 'package:style_app/src/consts_app.dart';
import 'package:style_app/src/text_style.dart';

///Theme Material Dark__________________________________________________________________________________________________________________________________________
//for dark theme
const Color _myColorIsNotActiveDark = Color.fromRGBO(251, 254, 255, 1);
const Color _myCardColorDark = Color.fromRGBO(46, 46, 46, 1);
const Color _myColorTextTwoDark = Color.fromRGBO(212, 214, 219, 0.95);
const Color _myColorTextThreeDark = Color.fromRGBO(251, 254, 255, 0.5);
const Color _myColorCardContainerDark = Color.fromRGBO(82, 82, 82, 0.5);

ThemeData _themeDark = ThemeData.dark();
ThemeData themeDark = _themeDark.copyWith(
  //будут использоватьчя базовые темы и перезаписаны только те части которые нам необходимы
  primaryColor: myColorIsActive,
  cardColor: _myCardColorDark,
  scaffoldBackgroundColor: _myCardColorDark,
  backgroundColor: _myColorCardContainerDark,
  appBarTheme: AppBarTheme(
    titleTextStyle: myTextStyleFontUbuntu(fontSize: 20, context: null),
    toolbarHeight: myToolbarHeight,
    elevation: 0,
    color: Colors.transparent,
    iconTheme: IconThemeData(size: 20),
  ),

  textButtonTheme: TextButtonThemeData(
    style: const ButtonStyle().copyWith(
      // tapTargetSize: MaterialTapTargetSize.shrinkWrap,

      foregroundColor: const MaterialStatePropertyAll(myColorIsActive),
      textStyle: MaterialStateProperty.all(myTextStyleFontUbuntu(
        fontSize: 12,
        context: null,
        newFontWeight: FontWeight.w500,
      )),
      padding:
          const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      shadowColor: const MaterialStatePropertyAll(myColorIsActive),
      overlayColor: MaterialStatePropertyAll(myColorIsActive.withOpacity(0.1)),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: const ButtonStyle().copyWith(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: const MaterialStatePropertyAll(myColorIsActive),
      foregroundColor: const MaterialStatePropertyAll(_myColorIsNotActiveDark),
      padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 20, vertical: 0)),
      textStyle: MaterialStatePropertyAll(
        myTextStyleFontOswald(
          fontSize: 18,
          context: null,
          newFontWeight: FontWeight.w500,
        ),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  ),

  textTheme: _textDart(_themeDark.textTheme),
  //_themeLight.textTheme - какую базу будем перезаписывать
);

TextTheme _textDart(TextTheme baseTextThemeDark) {
  //base - нащ базовый стиль
  return baseTextThemeDark.copyWith(
    headline1: baseTextThemeDark.headline1?.copyWith(
      color: _myColorIsNotActiveDark,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Ubuntu',
    ),
    headline2: baseTextThemeDark.headline2?.copyWith(
      color: _myColorTextTwoDark,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Ubuntu',
    ),
    headline3: baseTextThemeDark.headline3?.copyWith(
      color: _myColorTextThreeDark,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Ubuntu',
    ),
    headline4: baseTextThemeDark.headline4?.copyWith(
      color: _myColorTextThreeDark,
      fontSize: 13,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Ubuntu',
    ),
    bodyText1: baseTextThemeDark.bodyText1?.copyWith(
      color: _myColorIsNotActiveDark,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Ubuntu',
    ),
    bodyText2: baseTextThemeDark.bodyText2?.copyWith(
      color: _myColorIsNotActiveDark,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Ubuntu',
    ),
  );
}
