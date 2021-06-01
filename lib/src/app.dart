import 'package:flutter/material.dart';
import 'package:proyecto_clarity_flutter/src/screens/home_page.dart';
//import 'package:proyecto_clarity_flutter/src/screens/home_page.dart';
//import 'package:proyecto_clarity_flutter/src/screens/inicio.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Clarity',
      home: HomePage(),
    );
  }
}
