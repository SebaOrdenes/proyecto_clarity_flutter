import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Admin/admin_screen.dart';
import 'package:flutter_auth/Screens/Para_ti/para_ti_screen.dart';
import 'package:flutter_auth/Screens/Tratamiento/components/videos.dart';
import 'package:flutter_auth/Screens/Tratamiento/tratamiento_screen.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';

import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/Screens/Welcome/splashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SplashScreen(),
      //home: AdminScreen(),
      //home: TratamientoScreen(),
      //home: ParaTiScreen(),
    );
  }
}
