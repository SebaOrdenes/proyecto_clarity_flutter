import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Test/test_screen.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/services/testService.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

//cambiando el nombre del test en el servicio
class _BodyState extends State<Body> {
  void setNameTest(String nameTest) {
    TestService.name = nameTest;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            Image.asset(
              'assets/images/Acomp.png',
              width: 100,
              height: 100,
            ),
            SizedBox(height: size.height * 0.05),
            Text(
              'Te sugerimos iniciar tu proceso respondiendo a un cuestionario, que te ayudará a contar con una guía para iniciar  tu plan de transformación y bienestar. ',
              style: TextStyle(fontSize: 20, fontFamily: 'Raleway'),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size.height * 0.05),
            GestureDetector(
              onTap: () {},
              child: RoundedButton(
                text: "Test de Evaluación de Depresión inicial",
                press: () {
                  setNameTest("Test de depresión");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return TestScreen();
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Text(
              'Cada dos semanas, puedes obtener tu última puntuación de felicidad realizando esta evaluación.  ',
              style: TextStyle(fontSize: 20, fontFamily: 'Raleway'),
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              onTap: () {},
              child: RoundedButton(
                text: "Evalua tu avance de estado de ánimo",
                press: () {
                  setNameTest("Test quincenal");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return TestScreen();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
/*
    return Background(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/images/Acomp.png',
          width: 100,
          height: 100,
        ),
        SizedBox(height: size.height * 0.05),
        Text(
          'Te sugerimos iniciar tu proceso respondiendo a un cuestionario, que te ayudará a contar con una guía para iniciar  tu plan de transformación y bienestar. ',
          style: TextStyle(fontSize: 20, fontFamily: 'Raleway'),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: size.height * 0.05),
        RoundedButton(
          text: "Test de Evaluación de Depresión",
          press: () {
            setNameTest("Test de depresión");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return TestScreen();
                },
              ),
            );
          },
        ),
        SizedBox(height: size.height * 0.05),
        Text(
          'Cada dos semanas, puedes obtener tu última puntuación de felicidad realizando esta evaluación.  ',
          style: TextStyle(fontSize: 20, fontFamily: 'Raleway'),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: size.height * 0.05),
        RoundedButton(
          text: "Evalua el avance de tu estado de ánimo",
          press: () {
            setNameTest("Test quincenal");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return TestScreen();
                },
              ),
            );
          },
        )
      ],
    ));*/
  }
}
