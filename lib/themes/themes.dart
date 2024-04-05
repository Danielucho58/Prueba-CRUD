import 'package:flutter/material.dart';




class AppThemes {

  static Color primary = Colors.brown;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
     
      //color primario     
       primaryColor: Colors.brown,
    
      // AppBar theme
       appBarTheme:  AppBarTheme(
        color: primary,
        elevation: 30
       )
      );
}