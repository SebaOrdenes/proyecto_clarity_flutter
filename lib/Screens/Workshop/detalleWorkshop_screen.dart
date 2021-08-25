import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_auth/components/app_bar.dart';
import '../../constants.dart';
import 'package:flutter_auth/Screens/Layout/menu_lateral.dart';

import 'components/detalleWorkshop.dart';

class DetalleWorkshopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBarComponent(titleText: "Información del Workshop"),
      ),
      drawer: MenuLateral(),
      body: DetalleWorkshop(),
      backgroundColor: kWhiteColor,
    );
  }
}
