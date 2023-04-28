import 'package:flutter/material.dart';

ThemeData appTheme({bool darkMode = false}) => ThemeData(
      brightness: darkMode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: const Color(0xFFE21833),
    );
