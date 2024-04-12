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
      selectedRowColor: const Color.fromRGBO(206, 33, 255, 1),
      highlightColor: const Color.fromRGBO(206, 33, 255, 1),
      shadowColor: const Color.fromRGBO(206, 33, 255, 1),
      useMaterial3: true,
      colorScheme: ThemeData.light().colorScheme.copyWith(
            background: Colors.white,
            onBackground: Colors.grey,
            onPrimaryContainer: Colors.white,
            primary: Colors.white,
            onPrimary: Colors.black,
            secondary: const Color.fromARGB(255, 248, 216, 255),
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
      primaryColor: const Color.fromARGB(255, 167, 70, 180),
      indicatorColor: const Color.fromARGB(255, 167, 70, 180),
      // ignore: deprecated_member_use
      selectedRowColor: Colors.white,
      primaryColorDark: const Color.fromRGBO(32, 28, 28, 1),
      highlightColor: const Color.fromARGB(255, 167, 70, 180),
      shadowColor: const Color.fromARGB(255, 77, 57, 82),
      useMaterial3: true,
      colorScheme: ThemeData.dark().colorScheme.copyWith(
            background: const Color.fromARGB(255, 27, 27, 27),
            onPrimaryContainer: Colors.white,
            onBackground: Colors.white,
            primary: Colors.black,
            onPrimary: Colors.white,
            secondary: const Color.fromARGB(255, 77, 57, 82),
            onSecondary: Colors.white,
          ));
}
