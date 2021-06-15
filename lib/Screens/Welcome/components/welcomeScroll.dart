import 'package:flutter/material.dart';

class WelcomeScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Positioned(
                child: Image.asset(
              'assets/images/Claritylogo.png',
              scale: 1.5,
            )),
            SizedBox(height: size.height * 0.1),
            Text(
              'Bienvenida a Clarity.',
              // textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontFamily: 'Raleway'),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Positioned(
                child: Image.asset(
              'assets/images/happy.png',
              scale: 1,
            )),
            SizedBox(height: size.height * 0.1),
            Text(
              'Tu bienestar esta en tus manos.',
              // textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontFamily: 'Raleway'),
            ),
            Text(
              'y nosotros estamos para acompañarte.',
              // textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontFamily: 'Raleway'),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Positioned(
                child: Image.asset(
              'assets/images/Flowers.png',
              scale: 8.5,
            )),
            SizedBox(height: size.height * 0.1),
            Text(
              'Clarity es una solución simple y altamente efectiva',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontFamily: 'Raleway'),
            ),
            Text(
              '  para el manejo de la depresión en mujeres',
              // textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontFamily: 'Raleway'),
            ),
            Text(
              ' que deseen experimentar bienestar y felicidad en sus vidas.',
              // textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontFamily: 'Raleway'),
            ),
          ],
        ),
      ],
    );
  }
}
