import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Revitalizar/components/escuchar_screen.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/Screens/Welcome/splashScreen.dart';

import 'Screens/Revitalizar/components/audios.dart';

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
      supportedLocales: [
        const Locale('es'),
        const Locale('en'),
      ],
      //home: AudioPlayerUrl(),
      home: SplashScreen(),
      //home: TratamientoScreen(),
      //home: ParaTiScreen(),
    );
  }
}
