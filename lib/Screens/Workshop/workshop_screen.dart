import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Workshop/components/body.dart';
import 'package:flutter_auth/Screens/Layout/menu_lateral.dart';
import '../../constants.dart';

class WorkshopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Workshop',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Raleway',
          ),
        ),
        backgroundColor: kDeepOrangeColor,
      ),
      drawer: MenuLateral(),
      body: Body(),
      backgroundColor: kWhiteColor,
    );
  }
}
