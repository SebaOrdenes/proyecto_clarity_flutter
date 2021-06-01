import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Sign In',
          style: TextStyle(fontSize: 30),
        ),
      ),
      backgroundColor: Colors.deepOrange.shade100,
    );
  }
}
