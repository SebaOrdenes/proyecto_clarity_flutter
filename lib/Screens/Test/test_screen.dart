import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Layout/menu_lateral.dart';
import 'package:flutter_auth/Screens/Test/components/body.dart';
import '../../constants.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Test',
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
