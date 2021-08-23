import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Revitalizar/components/audios.dart';

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
              Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/fondo.jpeg'),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Armoniza tu mente\n',
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Raleway',
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '¿Necesitas un tiempo de descanso y cuentas con poco tiempo?',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Raleway',
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: size.height * 0.02),
                      Text(
                        'Las alternativas de relajación que encontrarás  te ayudarán a disminuir tensiones y renovar la energía mental.',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Raleway',
                            color: Colors.black26),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  )),

              SizedBox(height: size.height * 0.02),
              Text(
                'Instrucciones',
                style: TextStyle(
                    fontSize: 20, fontFamily: 'Raleway', color: Colors.black),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                'Elige la música que quieras y  disfruta de la experiencia.',
                style: TextStyle(
                    fontSize: 15, fontFamily: 'Raleway', color: Colors.black26),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                'Esta actividad te puede ayudar a:',
                style: TextStyle(
                    fontSize: 16, fontFamily: 'Raleway', color: kPinkOscuro),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                '-Reducir tensiones. \n'
                '-Aliviar el cansancio mental y fisico. \n'
                '-Sentirte más tranquila.',
                style: TextStyle(
                    fontSize: 14, fontFamily: 'Raleway', color: Colors.black26),
                textAlign: TextAlign.justify,
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
                            return AudioPlayerUrl();
                          },
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      child: Image.asset(
                        'assets/images/PAZ.jpg',
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
                            return AudioPlayerUrl();
                          },
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      child: Image.asset(
                        'assets/images/RELAX.jpg',
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ),
                ],
              ),
              //AudioPlayerUrl(),
            ],
          ),
        ),
      ),
    );
  }
}
