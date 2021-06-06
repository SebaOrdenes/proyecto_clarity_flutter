import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Para_ti/components/body.dart';
import '../../constants.dart';

class ParaTiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: kSecondaryColor,
        centerTitle: true,
      ),
      body: Body(),
      backgroundColor: kWhiteColor,
    );
  }
}
