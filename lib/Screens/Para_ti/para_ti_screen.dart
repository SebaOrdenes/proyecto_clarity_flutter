import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_auth/Screens/Para_ti/components/body.dart';
import 'package:flutter_auth/components/app_bar.dart';
import '../../constants.dart';
import 'package:flutter_auth/Screens/Layout/menu_lateral.dart';

class ParaTiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBarComponent(titleText: "Inicio"),
      ),
      drawer: MenuLateral(),
      body: Body(),
      backgroundColor: kWhiteColor,
    );
  }
}
