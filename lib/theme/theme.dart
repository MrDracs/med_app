import 'package:flutter/material.dart';

class PTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Baloo Da',
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.black),
      displayLarge: TextStyle(color: Colors.black),
      displayMedium: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
      bodySmall: TextStyle(color: Colors.black),
    ),
  ).copyWith(
      primaryColor: Color.fromARGB(255, 41, 156, 244),
      brightness: Brightness.light,
      primaryColorLight: Colors.white,
      indicatorColor: Colors.grey[100],
      // ignore: deprecated_member_use
      selectedRowColor: Color.fromARGB(255, 33, 170, 255),
      highlightColor: Color.fromARGB(255, 33, 148, 255),
      shadowColor: Color.fromARGB(255, 33, 118, 255),
      useMaterial3: true,
      colorScheme: ThemeData.light().colorScheme.copyWith(
            background: Colors.white,
            onBackground: Colors.grey,
            onPrimaryContainer: Colors.white,
            primary: Colors.white,
            onPrimary: Colors.black,
            secondary: Color.fromARGB(255, 216, 244, 255),
            onSecondary: Colors.black,
          ));

  static ThemeData darkTheme = ThemeData(
      fontFamily: 'Baloo Da',
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.white),
        displayLarge: TextStyle(color: Colors.white),
        displayMedium: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white),
      )).copyWith(
      brightness: Brightness.dark,
      primaryColor: Color.fromARGB(255, 70, 136, 180),
      indicatorColor: Color.fromARGB(255, 70, 120, 180),
      // ignore: deprecated_member_use
      selectedRowColor: Colors.white,
      primaryColorDark: const Color.fromRGBO(32, 28, 28, 1),
      highlightColor: Color.fromARGB(255, 54, 157, 225),
      shadowColor: Color.fromARGB(255, 57, 70, 82),
      useMaterial3: true,
      colorScheme: ThemeData.dark().colorScheme.copyWith(
            background: const Color.fromARGB(255, 27, 27, 27),
            onPrimaryContainer: Colors.white,
            onBackground: Colors.white,
            primary: Colors.black,
            onPrimary: Colors.white,
            secondary: Color.fromARGB(255, 64, 90, 98),
            onSecondary: Colors.white,
          ));
}
