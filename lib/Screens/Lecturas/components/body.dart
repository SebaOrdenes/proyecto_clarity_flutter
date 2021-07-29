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
    return Container(
      color: Colors.deepPurple.shade50,
      child: ListView(children: <Widget>[
        Center(
          child: Text(
            "Día 0, ${Lectura.titlesByDay[0].titulo}",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          color: Colors.indigo.shade50,
          //padding: EdgeInsets.all(20.0),
          margin: EdgeInsets.all(20),
          child: Text(
            "${Lectura.readingByDay[0].reading}",
            style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
            textAlign: TextAlign.justify,
          ),
        ),
      ]),
    );
  }
}
