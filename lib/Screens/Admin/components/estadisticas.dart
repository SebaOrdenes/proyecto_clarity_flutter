import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Admin/components/menu_lateral.dart';
import 'package:flutter_auth/models/Resultado.dart';

import '../../../constants.dart';

class EstadisticasScreen extends StatelessWidget {
  final Resultado res;
  EstadisticasScreen({this.res});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDeepOrangeColor,
        title: Text(
          'Estadisticas',
          style: TextStyle(fontFamily: 'Raleway'),
        ),
        centerTitle: true,
      ),
      drawer: MenuLateral(),
      body: Column(
        children: <Widget>[
          Flexible(
            child: Container(
              //width: double.infinity,
              child: ListView(
                //alignment: Alignment.center,
                children: <Widget>[
                  Text('${this.res.menssageCategoryOne}'),
                  Text('${this.res.menssageCategoryTwo}'),
                  Text('${this.res.menssageCategoryThree}'),
                  Text('${this.res.menssageCategoryFour}'),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: kWhiteColor,
    );
  }
}
