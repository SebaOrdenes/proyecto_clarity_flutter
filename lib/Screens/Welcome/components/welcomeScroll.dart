import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Tratamiento/components/videos.dart';

class WelcomeScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Center(
            child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Column(
          children: <Widget>[
            //SizedBox(height: size.height * 0.1),
            Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/Claritylogo.png',
                  scale: 1.5,
                )),
            Text(
              'Bienvenida a Clarity.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontFamily: 'Raleway'),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.2),
            Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/happy.png',
                  scale: 0.05,
                )),
            SizedBox(height: size.height * 0.2),
            Text(
              'Tu bienestar esta en tus manos',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontFamily: 'Raleway'),
            ),
            Text(
              'y nosotros estamos para ayudarte',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontFamily: 'Raleway'),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.1),
            Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/images/woman_draw.png', scale: 2.5)),
            SizedBox(height: size.height * 0.05),
            Text(
              'Clarity es una solución simple y altamente efectiva',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontFamily: 'Raleway'),
            ),
            Text(
              ' para el manejo de la depresión en mujeres que deseen',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontFamily: 'Raleway'),
            ),
            Text(
              'experimentar bienestar y felicidad en sus vidas',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontFamily: 'Raleway'),
            ),
          ],
        ),
      ],
    )));
  }
}
