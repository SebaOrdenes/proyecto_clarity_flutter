import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../constants.dart';
import 'package:flutter_auth/Screens/Layout/menu_lateral.dart';

import 'components/body.dart';

class PerfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Perfil',
          style: TextStyle(color: Colors.black, fontFamily: 'Raleway'),
        ),
        backgroundColor: kDeepOrangeColor,
      ),
      drawer: MenuLateral(),
      body: Body(),
      backgroundColor: kWhiteColor,
    );
  }
}
