import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Revitalizar/components/escuchar_screen.dart';
import 'package:flutter_auth/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Center(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/fondo.jpeg'),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Date un minuto para renovar tu energía \n',
                          style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'Raleway',
                              color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '¿Necesitas una herramienta simple que te permita relajarte rápidamente?\n',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Raleway',
                              color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'La relajación es sin duda una de las claves más fáciles de aplicar, y eso requiere de un solo recurso que todos tenemos cuando vivimos, así que prepárate para escuchar las técnicas más efectivas para lograr la calma que necesitas y seguir con con los desafíos del día a día.',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Raleway',
                              color: Colors.black26),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    'Instrucciones',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Raleway',
                        color: Colors.black),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    'Intenta los diferentes ejercicios de respiración y encuentra el que te haga sentir más cómoda.',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Raleway',
                        color: Colors.black26),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    'Esta actividad te puede ayudar a:',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Raleway',
                        color: kPinkOscuro),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    '-Sentirte mas relajada. \n'
                    '-Oxigenar tu cuerpo y calmar tu mente. \n'
                    '-Conectar contigo misma y balancear tus emociones',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Raleway',
                        color: Colors.black26),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: size.height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return EscucharScreen();
                                  },
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/images/escucha.png',
                              width: 150,
                              height: 120,
                            ),
                          ),
                          Text(
                            'Escucha',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 20, fontFamily: 'Raleway'),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              'assets/images/respira.png',
                              width: 150,
                              height: 120,
                            ),
                          ),
                          Text(
                            'Respirar',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 20, fontFamily: 'Raleway'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
                  SizedBox(height: size.height * 0.01),
                  GestureDetector(
                    onTap: null,
                    child: Image.asset(
                      'assets/images/visualizar.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Text(
                    'Visualiza',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontFamily: 'Raleway'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
/*
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
    );*/
  }
}
