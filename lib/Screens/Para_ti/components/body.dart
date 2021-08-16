import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Informacion/informacion_screen.dart';
import 'package:flutter_auth/Screens/Medicion/medicion_screen.dart';
import 'package:flutter_auth/Screens/Revitalizar/revitalizar_screen.dart';
import 'package:flutter_auth/Screens/Tratamiento/tratamiento_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/Users.dart';

texto() {
  return Container(
    padding: const EdgeInsets.all(30),
    decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/images/fondo.jpeg'), fit: BoxFit.cover),
    ),
    child: Text(
      'Hola, ${Users.name} ♥\n'
      'Bienvenida a Clarity ! \n'
      'Tu bienestar está en tus manos y estamos aquí para acompañarte',
      style: TextStyle(
          color: Colors.black,
          fontFamily: 'Raleway',
          fontSize: 20,
          height: 1.3),
      softWrap: true,
    ),
  );
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* String membresia;
    if (Users.membership == 0) {
      membresia = 'Usuario free';
    } else {
      membresia = 'Usuario premium';
    }*/
    //Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Center(
        child: ListView(
          children: [
            texto(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
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
                    padding: EdgeInsets.all(5.0),
                    child: Image.asset(
                      'assets/images/Measurement.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
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
                    padding: EdgeInsets.all(5.0),
                    child: Image.asset(
                      'assets/images/Information.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TratamientoScreen();
                        },
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    child: Image.asset(
                      'assets/images/Treatment.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return RevitalizarScreen();
                        },
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    child: Image.asset(
                      'assets/images/Revitalize.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              '\n“De nuestras vulnerabilidades vienen nuestras fortalezas”\n'
              'Sigmud Freud \n',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kPinkOscuro,
                fontFamily: 'Raleway',
                fontSize: 15,
              ),
            ),
            Text(
              'Nuestra propuesta es acompañarte a vivir un proceso de transformación.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black45,
                  fontFamily: 'Raleway',
                  fontSize: 11,
                  height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
