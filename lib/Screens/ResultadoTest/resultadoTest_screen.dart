import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/ResultadoTest/components/body.dart';
import '../../constants.dart';
import 'package:flutter_auth/Screens/Layout/menu_lateral.dart';

class ResultadoTestScreen extends StatelessWidget {
  final List<dynamic> testResult;

  ResultadoTestScreen({this.testResult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          'Resultados',
          style: TextStyle(color: Colors.black, fontFamily: 'Raleway'),
        ),
        backgroundColor: kDeepOrangeColor,
      ),
      drawer: MenuLateral(),
      body: Body(this.testResult),
      backgroundColor: kWhiteColor,
    );
  }
}
