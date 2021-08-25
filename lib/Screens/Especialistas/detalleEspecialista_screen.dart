import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_auth/components/app_bar.dart';
import '../../constants.dart';
import 'package:flutter_auth/Screens/Layout/menu_lateral.dart';

import 'components/detalle.dart';

class DetalleEspecialistaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBarComponent(titleText: "Especialista"),
      ),
      drawer: MenuLateral(),
      body: Detalle(),
      backgroundColor: kWhiteColor,
    );
  }
}
