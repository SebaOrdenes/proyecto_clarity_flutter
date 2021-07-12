import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Welcome/components/background.dart';
import 'package:flutter_auth/Screens/Welcome/components/welcomeScroll.dart';
import 'package:flutter_auth/components/rounded_button.dart';

class Body extends StatelessWidget {
  @override
  //Widget de bienvenida que permite acceder al login
  Widget build(BuildContext context) {
    return Background(
      child: Stack(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Positioned(
            child: WelcomeScroll(),
          ),
          Positioned(
              bottom: 20,
              right: 40,
              child: RoundedButton(
                  text: "Continue",
                  press: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
