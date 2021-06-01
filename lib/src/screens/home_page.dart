import 'package:flutter/material.dart';
import 'package:proyecto_clarity_flutter/src/screens/sign_in.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrange.shade300,
      ),
      body: Center(
          child: Image.asset(
        'assets/LogoClarity.png',
        width: 200,
      )),
      backgroundColor: Colors.deepOrange.shade100,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_right_alt),
        onPressed: () {
          final route = MaterialPageRoute(builder: (context) {
            return SignIn();
          });
          Navigator.push(context, route);
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
