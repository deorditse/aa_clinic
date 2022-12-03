import 'package:flutter/material.dart';
import 'package:style_app/style_app.dart';

///Theme Material Light__________________________________________________________________________________________________________________________________________

//for Light theme
const Color _myColorIsNotActiveLight = Color.fromRGBO(46, 46, 46, 1);
const Color _myCardColorLight = Color.fromRGBO(250, 250, 250, 1);
const Color _myColorTextTwoLight = Color.fromRGBO(46, 46, 46, 0.95);
const Color _myColorTextThreeLight = Color.fromRGBO(46, 46, 46, 0.5);
const Color _myColorCardContainerLight = Color.fromRGBO(212, 214, 219, 0.5);

ThemeData _themeLight = ThemeData.light();
ThemeData themeLight = _themeLight.copyWith(
  //будут использоватьчя базовые темы и перезаписаны только те части которые нам необходимы
  primaryColor: myColorIsActive,
  cardColor: _myCardColorLight,
  scaffoldBackgroundColor: _myCardColorLight,
  backgroundColor: _myColorCardContainerLight,
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

      // backgroundColor: MaterialStatePropertyAll(Colors.green),
      foregroundColor: MaterialStateProperty.all(myColorIsActive),
      textStyle: MaterialStateProperty.all(
        myTextStyleFontUbuntu(
            fontSize: 12, context: null, newFontWeight: FontWeight.w500),
      ),
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
      padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 20, vertical: 0)),
      backgroundColor: const MaterialStatePropertyAll(myColorIsActive),

      // foregroundColor: const MaterialStatePropertyAll(_myCardColorLight),
      textStyle: MaterialStatePropertyAll(
        myTextStyleFontOswald(
            fontSize: 18, context: null, newFontWeight: FontWeight.w500),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  ),

  textTheme: _textLight(_themeLight.textTheme),
  //_themeLight.textTheme - какую базу будем перезаписывать
);

TextTheme _textLight(TextTheme baseTextThemeLight) {
//base - нащ базовый стиль
  return baseTextThemeLight.copyWith(
    headline1: baseTextThemeLight.headline1?.copyWith(
      color: _myColorIsNotActiveLight,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Ubuntu',
    ),
    headline2: baseTextThemeLight.headline2?.copyWith(
      color: _myColorTextTwoLight,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Ubuntu',
    ),
    headline3: baseTextThemeLight.headline3?.copyWith(
      color: _myColorTextThreeLight,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Ubuntu',
    ),
    headline4: baseTextThemeLight.headline4?.copyWith(
      color: _myColorTextThreeLight,
      fontSize: 13,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Ubuntu',
    ),
    bodyText1: baseTextThemeLight.bodyText1?.copyWith(
      color: _myColorIsNotActiveLight,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Ubuntu',
    ),
    bodyText2: baseTextThemeLight.bodyText2?.copyWith(
      color: _myColorIsNotActiveLight,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Ubuntu',
    ),
  );
}
