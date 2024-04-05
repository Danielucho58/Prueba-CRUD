import 'package:flutter/material.dart';
import 'package:pruebasilice_app/home_screen.dart';
//import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
    
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.deepOrange,),),
      debugShowCheckedModeBanner: false,
      title: 'Registro',
      home: HomeScreen(),
     );
    }
}
