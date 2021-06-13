import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Medicion/components/background.dart';
import 'package:flutter_auth/Screens/Test/test_screen.dart';
import 'package:flutter_auth/components/rounded_button.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Background(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RoundedButton(
          text: "Test de Evaluación de Depresión",
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return TestScreen();
                },
              ),
            );
          },
        ),
        RoundedButton(
          text: "Evalua el avance de tu estado de ánimo",
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return TestScreen();
                },
              ),
            );
          },
        )
      ],
    ));
  }
}
