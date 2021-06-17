import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Admin/components/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 110,
              left: 30,
              child: Text(
                'Hola soy la pantalla del Admin',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Raleway',
                ),
              )),
        ],
      ),
    );
  }
}
