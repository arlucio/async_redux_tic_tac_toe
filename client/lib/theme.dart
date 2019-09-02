import 'package:flutter/material.dart';

final ThemeData defaultTheme = _buildDefaultTheme();

ThemeData _buildDefaultTheme() {
  final base = ThemeData.light();
  return base.copyWith(
    backgroundColor: Colors.cyan.shade50,
    primaryColor: Colors.indigo.shade700,
    accentColor: Colors.indigoAccent.shade700,
    scaffoldBackgroundColor: Colors.indigo.shade50,
    appBarTheme: _buildDefaultAppBarTheme(base.appBarTheme),
    textTheme: _buildDefaultTextTheme(base.textTheme),
    primaryTextTheme: _buildDefaultTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildDefaultTextTheme(base.accentTextTheme),
  );
}

TextTheme _buildDefaultTextTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(
      color: Colors.indigo.shade700,
    ),
    title: base.title.copyWith(
      color: Colors.indigo.shade700,
      fontWeight: FontWeight.w700,
      fontSize: 24.0,
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    body2: base.body2.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),
  );
}

AppBarTheme _buildDefaultAppBarTheme(AppBarTheme base) {
  return base.copyWith(
    color: Colors.indigo.shade700,
  );
}
