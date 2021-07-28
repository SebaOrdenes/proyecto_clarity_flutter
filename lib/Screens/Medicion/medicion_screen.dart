import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Medicion/components/body.dart';
import 'package:flutter_auth/Screens/Layout/menu_lateral.dart';
import '../../constants.dart';

class MedicionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Medicion',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Raleway',
          ),
        ),
        backgroundColor: kPinkOscuro,
      ),
      drawer: MenuLateral(),
      body: Body(),
      backgroundColor: kWhiteColor,
    );
  }
}
