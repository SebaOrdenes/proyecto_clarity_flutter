import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //Utilizar para verificar si la usuaria se encuentra registrada
  @override
  void initState() {
    Future.delayed(
        Duration(milliseconds: 10000),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => WelcomeScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          //Ajustar al tamaño de pantalla de cualquier celular
          child: FractionallySizedBox(
              widthFactor: .6,
              child: Image.asset(
                'assets/images/Claritylogo.png', scale: 1.5,
                //width: 150.0,
                // alignment: Alignment.bottomLeft,
              )),
        ),
      ],
    )));
  }
}
