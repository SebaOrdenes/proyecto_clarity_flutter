import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Revitalizar/components/audios.dart';
import 'package:flutter_auth/components/rounded_button.dart';

import '../../../constants.dart';

Widget imagenesMusic = Container(
  padding: const EdgeInsets.all(30),
  decoration: BoxDecoration(
    image: DecorationImage(
        image: AssetImage('assets/images/fondo.jpeg'), fit: BoxFit.cover),
  ),
  child: Row(),
);

class EscucharScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          'Escucha',
          style: TextStyle(color: Colors.black, fontFamily: 'Raleway'),
        ),
        backgroundColor: kDeepOrangeColor,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: ListView(
            children: [
              SizedBox(height: size.height * 0.02),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/fondo.jpeg'),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    Text(
                      'Date un minuto para renovar tu energía',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Raleway',
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    RoundedButton(text: "Respira", press: () {})
                  ],
                ),
              ),
              Text(
                '¿Necesitas una herramienta simple que te permita relajarte rápidamente?',
                style: TextStyle(
                    fontSize: 18, fontFamily: 'Raleway', color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                'La relajación es sin duda una de las claves más fáciles de aplicar, y eso requiere de un solo recurso que todos tenemos cuando vivimos, así que prepárate para escuchar las técnicas más efectivas para lograr la calma que necesitas y seguir con con los desafíos del día a día.',
                style: TextStyle(
                    fontSize: 14, fontFamily: 'Raleway', color: Colors.black26),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                'Instrucciones',
                style: TextStyle(
                    fontSize: 20, fontFamily: 'Raleway', color: Colors.black),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                'Intenta los diferentes ejercicios de respiración y encuentra el que te haga sentir más cómoda.',
                style: TextStyle(
                    fontSize: 14, fontFamily: 'Raleway', color: Colors.black26),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                'Esta actividad te puede ayudar a:',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Raleway',
                    color: kDeepOrangeColor),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                '-Sentirte mas relajada. \n'
                '-Oxigenar tu cuerpo y calmar tu mente. \n'
                '-Conectar contigo misma y balancear tus emociones',
                style: TextStyle(
                    fontSize: 14, fontFamily: 'Raleway', color: Colors.black26),
                textAlign: TextAlign.justify,
              ),
              VideoPlayerScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
