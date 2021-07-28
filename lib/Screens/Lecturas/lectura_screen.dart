import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Lecturas/components/body.dart';
import 'package:flutter_auth/Screens/Para_ti/components/menu_lateral.dart';

import '../../constants.dart';

class LecturaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LECTURA',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: kDeepOrangeColor,
      ),
      drawer: MenuLateral(),
      body: Body(),
      backgroundColor: kWhiteColor,
    );
  }
}
