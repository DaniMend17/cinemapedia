import 'package:flutter/material.dart';

List<Color> colors = [
  Colors.lightBlueAccent,
  Colors.red,
  Colors.teal,
  Colors.pink,
  Colors.brown
];



class AppTheme {
  int selectedColor;

  AppTheme({this.selectedColor = 0});

  ThemeData getTheme()=> ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colors[selectedColor],
      // brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        centerTitle: true,
      )
  );  
}