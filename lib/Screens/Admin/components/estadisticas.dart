import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Admin/components/menu_lateral.dart';
import 'package:flutter_auth/models/Resultado.dart';

import '../../../constants.dart';

class EstadisticasScreen extends StatelessWidget {
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
      body: Container(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Text('HOLA SOY UNA ESTADÍSTICA'),
          ],
        ),
      ),
      backgroundColor: kWhiteColor,
    );
  }
}
