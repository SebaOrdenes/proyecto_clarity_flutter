import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/models/Resultado.dart';

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
  }

  @override
  void initState() {
    super.initState();
    getResult();
    print(res.menssageCategoryOne);
    //print(Lectura.readingByDay[0].reading);
  }

  //Mostrar Todos los widgets en pantalla
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Text(
        ("${res.categoryFour}"),
        style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
        textAlign: TextAlign.justify,
      )
    ]);
  }
}
