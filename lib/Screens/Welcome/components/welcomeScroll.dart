import 'package:flutter/material.dart';

class WelcomeScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Stack(
      children: <Widget>[
        ListView(
          scrollDirection: Axis.horizontal,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(children: <Widget>[
              Container(
                  padding: EdgeInsets.all(50.0),
                  width: 400,
                  child: Image.asset(
                    'assets/images/happy.png', scale: 1.5,
                    //width: 150.0,
                    // alignment: Alignment.bottomLeft,
                  )),
              Text(
                'HOLA ',
                textAlign: TextAlign.start,
              ),
            ]),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(100.0),
              child: Image.asset(
                'assets/images/love.png',
                width: 300.0,
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(100.0),
              child: Image.asset(
                'assets/images/mariposa1.png',
                width: 300,
              ),
            ),

            //buildContent(),
          ],
        )
      ],
    );
  }
}
