import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Admin/components/estadisticas.dart';
import 'package:flutter_auth/models/Resultado.dart';
import 'package:flutter_auth/models/Users.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Resultado res =
      new Resultado(null, null, null, null, null, null, null, null, null, null);
  //initState se ejecuta antes que se carguen todos los componentes
  void getResult() async {
    await res.getResultado2();
    //print(res.menssageCategoryOne);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          //print(res);
          return EstadisticasScreen(res: res);
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  //Mostrar Todos los widgets en pantalla
  @override
  Widget build(BuildContext context) {
    //return SafeArea(child: Center(child: ListView(children: []))); <-----------------------------------
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            Text(
              ' Bienvenida Admin ${Users.name}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kPrimaryColor,
                fontFamily: 'Raleway',
                fontSize: 30,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            GestureDetector(
              onTap: () {
                //dondeClickeo(index);
                getResult();
              },
              child: Container(
                child: Image.asset(
                  'assets/images/estadisticas.png',
                  height: 150,
                ),
              ),
            ),
            Text(
              'Ver estadisticas de depresi??n',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kPrimaryColor,
                fontFamily: 'Raleway',
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
/*
    return Column(
      children: <Widget>[
        Flexible(
          child: Container(
              child: ListView(children: <Widget>[
            Positioned(
                left: 20,
                child: Text(
                  ' Bienvenida Admin ${Users.name}',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontFamily: 'Raleway',
                    fontSize: 30,
                  ),
                )),
            Positioned(
                child: InkWell(
              onTap: () {
                getResult();
              },
              child: Container(
                padding: EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/images/estadisticas.png',
                  width: 150,
                  height: 150,
                ),
              ),
            )),
            Text(
              ("Ver estadisticas Test depresi??n"),
              style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
              textAlign: TextAlign.center,
            )
          ])),
        ),
      ],
    );*/
  }
}
