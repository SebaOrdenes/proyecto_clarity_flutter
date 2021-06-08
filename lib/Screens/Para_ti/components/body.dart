import 'package:flutter/material.dart';
//import 'package:flutter_auth/Screens/Informacion/components/list_images.dart';
import 'package:flutter_auth/Screens/Informacion/informacion_screen.dart';
import 'package:flutter_auth/Screens/Para_ti/components/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 300,
              left: 30,
              child: InkWell(
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
                  padding: EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/images/Informacion.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              )),
          Positioned(
              top: 300,
              left: 250,
              child: InkWell(
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
                  padding: EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/images/Medicion.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              )),
          Positioned(
              top: 450,
              left: 30,
              child: InkWell(
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
                  padding: EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/images/Revitalizar.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              )),
          Positioned(
              top: 450,
              left: 250,
              child: InkWell(
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
                  padding: EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/images/Tratamiento.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
