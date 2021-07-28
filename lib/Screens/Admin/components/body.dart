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
      new Resultado(null, null, null, null, null, null, null, null, null);
  //initState se ejecuta antes que se carguen todos los componentes
  void getResult() async {
    await res.getResultado();
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
              ("Ver estadisticas Test depresión"),
              style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
              textAlign: TextAlign.center,
            )
          ])),
        ),
      ],
    );
  }
}
