import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_auth/Screens/Especialistas/components/body.dart';
import '../../constants.dart';
import 'package:flutter_auth/Screens/Layout/menu_lateral.dart';

import 'components/detalle.dart';



class DetalleEspecialistaScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Especialista',
          style: TextStyle(color: Colors.black, fontFamily: 'Raleway'),
        ),
        backgroundColor: kPinkOscuro,
      ),
      drawer: MenuLateral(),
      body: Detalle(),
      backgroundColor: kWhiteColor,
    );
  }
}
