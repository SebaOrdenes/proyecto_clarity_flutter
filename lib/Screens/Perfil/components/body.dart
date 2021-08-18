import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Admin/components/background.dart';

import 'package:flutter_auth/constants.dart';
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Center(
        child: ListView(
          children: [
            SizedBox(height: size.height * 0.05),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/fondo.jpeg'),
                    fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
