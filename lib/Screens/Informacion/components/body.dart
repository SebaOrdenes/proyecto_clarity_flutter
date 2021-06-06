import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Informacion/components/background.dart';
//import 'package:flutter_auth/Screens/Login/login_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('HOLA SOY INFORMACION'),
            //buildContent(),

            SizedBox(height: size.height * 0.05),
            SizedBox(height: size.height * 0.05),
          ],
        ),
      ),
    );
  }
}
