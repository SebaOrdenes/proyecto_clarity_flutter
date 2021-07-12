import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/components/body.dart';
import 'package:flutter_auth/constants.dart';

//Pantalla de Bienvenida, donde se muestra un scroll con el logo de Clarity
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      backgroundColor: kWhiteColor,
    );
  }
}
