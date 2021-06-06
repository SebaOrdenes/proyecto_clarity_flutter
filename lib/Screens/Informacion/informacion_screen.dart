import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Informacion/components/body.dart';
import '../../constants.dart';

class InformacionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informacion para ti'),
        backgroundColor: kPinkcolor,
      ),
      body: Body(),
      backgroundColor: kWhiteColor,
    );
  }
}
