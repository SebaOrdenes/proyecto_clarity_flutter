import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Admin/components/body.dart';
import 'package:flutter_auth/Screens/Para_ti/components/menu_lateral.dart';
import '../../constants.dart';

class AdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDeepOrangeColor,
      ),
      drawer: MenuLateral(),
      body: Body(),
      backgroundColor: kWhiteColor,
    );
  }
}
