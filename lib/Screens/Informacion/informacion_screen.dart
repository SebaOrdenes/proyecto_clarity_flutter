import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Informacion/components/body.dart';
import 'package:flutter_auth/Screens/Layout/menu_lateral.dart';
import '../../constants.dart';

class InformacionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Planes de lectura',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: kPinkOscuro,
      ),
      drawer: MenuLateral(),
      body: Body(),
      backgroundColor: kWhiteColor,
    );
  }
}
