import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/models/Lecturas.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //initState se ejecuta antes que se carguen todos los componentes

  @override
  void initState() {
    super.initState();
    //print(Lectura.readingByDay[0].reading);
  }

  //Mostrar Todos los widgets en pantalla
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Text(
        "Día 0, ${Lectura.titlesByDay[0].titulo}",
        style: TextStyle(fontSize: 20, fontFamily: 'Raleway'),
        textAlign: TextAlign.justify,
      ),
      Text(
        "${Lectura.readingByDay[0].reading}",
        style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
        textAlign: TextAlign.justify,
      )
    ]);
  }
}
