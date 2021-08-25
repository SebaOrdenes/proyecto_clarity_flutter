import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Lecturas/components/body.dart';
import 'package:flutter_auth/components/app_bar.dart';

import '../../constants.dart';

class LecturaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBarComponent(titleText: "Lectura diaria"),
      ),
      //drawer: MenuLateral(),
      body: Body(),
      backgroundColor: kWhiteColor,
    );
  }
}
