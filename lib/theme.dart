import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
      background: Color.fromRGBO(255, 253, 248, 1),
      primary: Color.fromRGBO(187, 80, 4, 1),
      surface: Color.fromRGBO(255, 244, 236, 1),
      secondary: Color.fromRGBO(255, 242, 208, 1),
      onBackground: Color.fromRGBO(26, 11, 0, 1)),
  useMaterial3: true,
);

ColorScheme colorScheme = lightMode.colorScheme;
