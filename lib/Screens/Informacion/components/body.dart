import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Informacion/components/background.dart';
//import 'package:flutter_auth/Screens/Login/login_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: ListView(
        children: <Widget>[
          //POR AHORA se pondrán imagenes de referencia solamente
          Container(
            //DESPUES hay que cambiarlo por boton hacia una vista correspondiente a cada lectura
            padding: EdgeInsets.all(20.0),
            child: Image.asset(
              'assets/images/Banner1.jpg',
              height: 300,
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Image.asset('assets/images/Banner2.jpg'),
            height: 300,
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Image.asset('assets/images/Banner3.jpg'),
            height: 300,
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Image.asset('assets/images/Banner4.jpg'),
            height: 300,
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Image.asset('assets/images/Banner5.jpg'),
            height: 300,
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Image.asset('assets/images/Banner6.jpg'),
            height: 300,
          ),
        ],
      ),
    );
  }
}
