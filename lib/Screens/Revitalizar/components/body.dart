import 'package:flutter/material.dart';
//import 'package:flutter_auth/Screens/Para_ti/para_ti_screen.dart';
import 'package:flutter_auth/Screens/Layout/components/background.dart';
import 'package:flutter_auth/Screens/Revitalizar/components/respirar_screeen.dart';

//import 'package:flutter_auth/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: ListView(children: [
        Column(
          children: [
            SizedBox(height: size.height * 0.05),
            Text(
              'Date un minuto para renovar tu energía.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontFamily: 'Raleway'),
            ),
            SizedBox(height: size.height * 0.02),
            SizedBox(height: size.height * 0.05),
            Text(
              '¿Necesitas una herramienta simple que te permita relajarte rápidamente?',
              style: TextStyle(
                  fontSize: 20, fontFamily: 'Raleway', color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              'Ve las opciones que tenemos para ti',
              style: TextStyle(
                  fontSize: 20, fontFamily: 'Raleway', color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
        Positioned(
            top: 250,
            left: 200,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RespirarScreen();
                    },
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/images/respira.png',
                  width: 150,
                  height: 150,
                ),
              ),
            )),
        Text(
          'Respira',
          style: TextStyle(
              fontSize: 20, fontFamily: 'Raleway', color: Colors.black),
          textAlign: TextAlign.center,
        ),
        Positioned(
            top: 250,
            left: 200,
            child: InkWell(
              onTap: null,
              child: Container(
                padding: EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/images/escucha.png',
                  width: 150,
                  height: 150,
                ),
              ),
            )),
        Text(
          'Escucha',
          style: TextStyle(
              fontSize: 20, fontFamily: 'Raleway', color: Colors.black),
          textAlign: TextAlign.center,
        ),
        Positioned(
            top: 400,
            left: 200,
            child: InkWell(
              onTap: null,
              child: Container(
                padding: EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/images/visualizar.png',
                  width: 150,
                  height: 150,
                ),
              ),
            )),
        Text(
          'Visualiza',
          style: TextStyle(
              fontSize: 20, fontFamily: 'Raleway', color: Colors.black),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: size.height * 0.05),
      ]),
    );
  }
}
