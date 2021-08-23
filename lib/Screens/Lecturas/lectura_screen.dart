import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Lecturas/components/body.dart';

import '../../constants.dart';

class LecturaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          'Lectura diaria',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontFamily: 'Raleway'),
        ),
        backgroundColor: kWhiteColor,
      ),
      //drawer: MenuLateral(),
      body: Body(),
      backgroundColor: kWhiteColor,
    );
  }
}
