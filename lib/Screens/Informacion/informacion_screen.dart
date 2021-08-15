import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Informacion/components/body.dart';
import 'package:flutter_auth/Screens/Layout/menu_lateral.dart';
import '../../constants.dart';

class InformacionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          'Mis planes de lectura',
          style: TextStyle(color: Colors.black, fontFamily: 'Raleway'),
        ),
        backgroundColor: kDeepOrangeColor,
      ),
      drawer: MenuLateral(),
      body: Body(),
      backgroundColor: kWhiteColor,
    );
  }
}
