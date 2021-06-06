import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Informacion/informacion_screen.dart';
//import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Para_ti/components/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return InformacionScreen();
                    },
                  ),
                );
              },
              child: Container(
                alignment: Alignment.centerLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset('assets/images/Informacion.png',
                      width: 110.0, height: 110.0),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.centerRight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset('assets/images/Medicion.png',
                      width: 110.0, height: 110.0),
                ),
              ),
            ),
            /*InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.centerRight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset('assets/images/Revitalizar.png',
                      width: 110.0, height: 110.0),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.bottomRight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset('assets/images/Tratamiento.png',
                      width: 110.0, height: 110.0),
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
