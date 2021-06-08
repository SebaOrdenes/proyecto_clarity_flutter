import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Informacion/components/body.dart';
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
      body: Body(),
      backgroundColor: kWhiteColor,
    );
  }
}
