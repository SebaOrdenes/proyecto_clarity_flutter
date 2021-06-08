import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Informacion/components/body.dart';
import 'package:flutter_auth/Screens/Para_ti/components/menu_lateral.dart';
import '../../constants.dart';

class InformacionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Informacion para ti',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: kDeepOrangeColor,
      ),
      drawer: MenuLateral(),
      body: Body(),
      backgroundColor: kWhiteColor,
    );
  }
}
