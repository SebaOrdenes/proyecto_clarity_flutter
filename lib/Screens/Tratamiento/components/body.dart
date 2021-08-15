import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Especialistas/especialistas_screen.dart';
import 'package:flutter_auth/Screens/Layout/components/background.dart';
import 'package:flutter_auth/Screens/Videos/videos_screen.dart';
import 'package:flutter_auth/services/especialistaService.dart';

import '../../../constants.dart';

//import 'package:flutter_auth/constants.dart';
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  EspecialistaService especialistaService;

  //Cambiar a vista especialistas
  getEspecialistas() async {
    especialistaService = new EspecialistaService();
    print(EspecialistaService.listaEspecialistas);
    if (EspecialistaService.state == false) {
      await especialistaService.getEspecialistas();
      EspecialistaService.state = true;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return EspecialistasScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Center(
            child: ListView(children: [
      SizedBox(height: size.height * 0.05),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/fondo.jpeg'), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/Tratamiento1.png',
              width: 200,
              height: 110,
            ),
            Text(
              'Hemos integrado diferentes alternativas psicoterapéuticas '
              'para acompañarte en tu camino de transformación.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kPrimaryColor,
                fontFamily: 'Raleway',
                fontSize: 15,
              ),
            ),
          ],
        ),
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
                    return VideoScreen();
                  },
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(5.0),
              child: Image.asset(
                'assets/images/Individual.png',
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
                    return getEspecialistas();
                  },
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(5.0),
              child: Image.asset(
                'assets/images/Especialista.png',
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
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(5.0),
              child: Image.asset(
                'assets/images/Grupos.png',
                width: 150,
                height: 150,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(5.0),
              child: Image.asset(
                'assets/images/Workshops.png',
                width: 150,
                height: 150,
              ),
            ),
          ),
        ],
      ),
    ])));
    /*Background(
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 400,
              left: 30,
              child: InkWell(
                onTap: null,
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/images/Grupos.png',
                    width: 150,
                    height: 150,
                  ),
                ),
              )),
          Positioned(
              top: 250,
              left: 30,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return VideoScreen();
                        //return VideoListScreen();
                      },
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/images/Individual.png',
                    width: 150,
                    height: 150,
                  ),
                ),
              )),
          Positioned(
              top: 250,
              left: 200,
              child: InkWell(
                onTap: () {
                  getEspecialistas();
                },
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
              ),
              ),
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
        ],
      ),
    );*/
  }
}
