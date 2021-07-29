import 'package:flutter/material.dart';
//import 'package:flutter_auth/Screens/Para_ti/components/menu_lateral.dart';
//import 'package:flutter_auth/Screens/Para_ti/para_ti_screen.dart';
import 'package:flutter_auth/Screens/Layout/components/background.dart';
import 'package:flutter_auth/components/rounded_button.dart';

import '../../../constants.dart';
import '../revitalizar_screen.dart';

//import 'package:flutter_auth/constants.dart';

class RespirarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Respirar',
          style: TextStyle(color: Colors.black, fontFamily: 'Raleway'),
        ),
        backgroundColor: kPinkOscuro,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: ListView(
            children: [
              SizedBox(height: size.height * 0.02),
              Text(
                '¿Necesitas una herramienta simple que te permita relajarte rápidamente?',
                style: TextStyle(
                    fontSize: 20, fontFamily: 'Raleway', color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                'La relajación es sin duda una de las claves más fáciles de aplicar, y eso requiere de un solo recurso que todos tenemos cuando vivimos, así que prepárate para escuchar las técnicas más efectivas para lograr la calma que necesitas y seguir con con los desafíos del día a día.',
                style: TextStyle(fontSize: 18, fontFamily: 'Raleway'),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );

    /*
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Revitalizar',
          style: TextStyle(color: Colors.black, fontFamily: 'Raleway'),
        ),
        backgroundColor: kDeepOrangeColor,
      ),
      // drawer: MenuLateral(),
      body: Background(
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
              RoundedButton(
                text: "RESPIRA",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RevitalizarScreen();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: size.height * 0.05),
              Text(
                '¿Necesitas una herramienta simple que te permita relajarte rápidamente?',
                style: TextStyle(
                    fontSize: 20, fontFamily: 'Raleway', color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height * 0.03),
              Text(
                '   La relajación es sin duda una de las claves más fáciles de aplicar, y eso requiere de un solo recurso que todos tenemos cuando vivimos, así que prepárate para escuchar las técnicas más efectivas para lograr la calma que necesitas y seguir con con los desafíos del día a día.',
                style: TextStyle(fontSize: 18, fontFamily: 'Raleway'),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: size.height * 0.05),
              Text(
                'Instrucciones',
                style: TextStyle(fontSize: 30, color: Colors.black),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: size.height * 0.03),
              Text(
                '   Prueba los diferentes ejercicios de respiración y encuentra el que te haga sentir más cómoda.',
                style: TextStyle(fontSize: 18, fontFamily: 'Raleway'),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: size.height * 0.03),
              Text(
                'Esta actividad puede ayudarte:                            ',
                style: TextStyle(fontSize: 18, fontFamily: 'Raleway'),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: size.height * 0.03),
              Text(
                '-Sentirte más relajada                                            ',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Raleway',
                    color: kSecondaryColor),
                textAlign: TextAlign.justify,
              ),
              Text(
                '-Oxigenar tu cuerpo y calmar tu mente             ',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Raleway',
                    color: kSecondaryColor),
                textAlign: TextAlign.justify,
              ),
              Text(
                '-Conectarte contigo misma y equilibrar             ',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Raleway',
                    color: kSecondaryColor),
                textAlign: TextAlign.justify,
              ),
              Text(
                'tus emociones                                                      ',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Raleway',
                    color: kSecondaryColor),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
          Positioned(
              top: 250,
              left: 200,
              child: InkWell(
                onTap: null,
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/images/Especialista.png',
                    width: 150,
                    height: 150,
                  ),
                ),
              )),
          Positioned(
              top: 400,
              left: 200,
              child: InkWell(
                onTap: null,
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/images/Workshops.png',
                    width: 150,
                    height: 150,
                  ),
                ),
              )),
          Positioned(
              top: -40,
              left: 65,
              child: Image.asset(
                'assets/images/Tratamiento1.png',
                width: 250,
                height: 250,
              )),
          Positioned(
              top: 170,
              left: 20,
              child: Text(
                ' Hemos integrado diferentes alternativas psicoterapéuticas',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontFamily: 'Raleway',
                ),
              )),
          Positioned(
              top: 190,
              left: 30,
              child: Text(
                ' para acompañarte en tu camino de transformación.',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontFamily: 'Raleway',
                ),
              ))
        ]),
      ),
      backgroundColor: kWhiteColor,
    );*/
  }
}
