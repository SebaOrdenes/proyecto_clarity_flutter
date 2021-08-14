import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Lecturas/components/body.dart';

import '../../constants.dart';

class LecturaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Lectura diaria',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontFamily: 'Raleway'),
        ),
        backgroundColor: kPinkOscuro,
      ),
      //drawer: MenuLateral(),
      body: Body(),
      backgroundColor: kWhiteColor,
    );
  }
}
