import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../src.dart';

@WidgetbookApp.material(
  devices: [
    Apple.iPhone13,
    Apple.iPad9Inch,
    Desktop.desktop1080p,
    Apple.iPadMini,
    Apple.iPhone13Mini
  ],
  textScaleFactors: [1.0, 1.25, 1.5, 2],
  foldersExpanded: true,
  widgetsExpanded: true,
)
@WidgetbookTheme(name: 'Light', isDefault: true)
ThemeData getLightTheme() => appTheme();

@WidgetbookTheme(name: 'Dark')
ThemeData getDarkTheme() => appTheme(darkMode: true);
