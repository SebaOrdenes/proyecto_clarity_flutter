import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Medicion/components/body.dart';
import 'package:flutter_auth/Screens/Para_ti/components/menu_lateral.dart';
import '../../constants.dart';

class MedicionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicion'),
        backgroundColor: kDeepOrangeColor,
      ),
      drawer: MenuLateral(),
      body: Body(),
      backgroundColor: kWhiteColor,
    );
  }
}