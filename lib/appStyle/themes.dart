import 'package:flutter/material.dart';

import 'colors.dart';

class myThemes {
  static ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimaryColor,
    colorScheme: ColorScheme(
      primary: lightPrimaryColor,
      background: lightBackgroundColor,
      error: Colors.red,
      brightness: Brightness.light,
      onBackground: Colors.black,
      onError: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface:Colors.black,
      secondary: doneTaskColor,
      surface:Colors.grey,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: lightPrimaryColor,
      titleTextStyle: const TextStyle(fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: lightPrimaryColor,
    ),
    scaffoldBackgroundColor: lightBackgroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: lightPrimaryColor,
      unselectedItemColor: Colors.grey,
    ),
    textTheme: TextTheme(
      subtitle2: TextStyle(fontSize:26 ,fontWeight: FontWeight.bold,color: Colors.black, ),
      subtitle1: TextStyle(fontSize:15 ,fontWeight: FontWeight.bold ,color: lightPrimaryColor),
      headline5: TextStyle(fontSize:18 ,fontWeight: FontWeight.bold ,color: Colors.black),
      headline4: TextStyle(fontSize:16 ,fontWeight: FontWeight.normal,color: Colors.black, ),
      bodyText1: TextStyle(fontSize:12 ,fontWeight: FontWeight.bold ,color: Colors.black),
      bodyText2: TextStyle(fontWeight: FontWeight.bold, fontSize: 14 ,color: Colors.black),
      headline3: TextStyle(fontSize:16 ,fontWeight: FontWeight.bold,color: Colors.black ),
      headline1: TextStyle(fontSize:16 ,fontWeight: FontWeight.bold,color: lightPrimaryColor, ),
      headline6: TextStyle(fontSize:18 ,fontWeight: FontWeight.bold ,color: Colors.black),
    )
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: darkPrimaryColor,
    colorScheme: ColorScheme(
      primary: darkPrimaryColor,
      background: darkBackgroundColor,
      error: Colors.red,
      brightness: Brightness.dark,
      onBackground: Colors.black,
      onError: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface:Colors.black,
      secondary: doneTaskColor,
      surface:Colors.black45,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: darkPrimaryColor,
      titleTextStyle: const TextStyle(fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: lightPrimaryColor,
    ),
    scaffoldBackgroundColor: darkBackgroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: darkPrimaryColor,
      unselectedItemColor: Colors.white,
    ),
      textTheme: TextTheme(
        subtitle2: TextStyle(fontSize:26 ,fontWeight: FontWeight.bold,color: Colors.white, ),
        subtitle1: TextStyle(fontSize:15 ,fontWeight: FontWeight.bold ,color: Colors.white),
        headline5: TextStyle(fontSize:18 ,fontWeight: FontWeight.bold ,color: Colors.white),
        headline4: TextStyle(fontSize:16 ,fontWeight: FontWeight.normal,color: Colors.black ),
        bodyText1: TextStyle(fontSize:12 ,fontWeight: FontWeight.bold ,color: Colors.white),
        bodyText2: TextStyle(fontWeight: FontWeight.bold, fontSize: 14 ,color: Colors.white),
        headline3: TextStyle(fontSize:16 ,fontWeight: FontWeight.bold,color: Colors.black ),
        headline1: TextStyle(fontSize:16 ,fontWeight: FontWeight.bold,color: Colors.white),
        headline6: TextStyle(fontSize:18 ,fontWeight: FontWeight.bold ,color: Colors.black),
      )
  );
}


