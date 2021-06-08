import 'package:flutter/material.dart';
//import 'package:flutter_auth/Screens/Informacion/components/list_images.dart';
import 'package:flutter_auth/Screens/Informacion/informacion_screen.dart';
import 'package:flutter_auth/Screens/Medicion/medicion_screen.dart';
import 'package:flutter_auth/Screens/Para_ti/components/background.dart';
import 'package:flutter_auth/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 200,
              left: 200,
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
                    'assets/images/Information.png',
                    width: 150,
                    height: 150,
                  ),
                ),
              )),
          Positioned(
              top: 200,
              left: 30,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MedicionScreen();
                      },
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/images/Measurement.png',
                    width: 150,
                    height: 150,
                  ),
                ),
              )),
          Positioned(
              top: 350,
              left: 200,
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
                    'assets/images/Revitalize.png',
                    width: 150,
                    height: 150,
                  ),
                ),
              )),
          Positioned(
              top: 350,
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
                    'assets/images/Treatment.png',
                    width: 150,
                    height: 150,
                  ),
                ),
              )),
          Positioned(
              top: 550,
              left: 30,
              child: Text(
                ' "De nuestras vulnerabilidades vienen nuestras fortalezas" ',
                style: TextStyle(
                    color: kPrimaryColor, fontStyle: FontStyle.italic),
              )),
          Positioned(
              top: 30,
              left: 30,
              child: Text(
                'Bienvenida a Clarity! ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w300,
                ),
              )),
        ],
      ),
    );
  }
}
