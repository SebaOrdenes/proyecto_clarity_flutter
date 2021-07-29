import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Admin/components/menu_lateral.dart';
import 'package:flutter_auth/models/Resultado.dart';

import '../../../constants.dart';

class EstadisticasScreen extends StatelessWidget {
  final Resultado res;
  EstadisticasScreen({this.res});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPinkOscuro,
        title: Text(
          'Estadisticas',
          style: TextStyle(fontFamily: 'Raleway'),
        ),
        centerTitle: true,
      ),
      drawer: MenuLateral(),
      body: Column(
        children: <Widget>[
          Flexible(
            child: Container(
              //width: double.infinity,
              child: ListView(
                //alignment: Alignment.center,
                children: <Widget>[
                  SizedBox(height: size.height * 0.05),
                  Text(
                    '- ${this.res.menssageCategoryOne}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Text(
                    '- ${this.res.menssageCategoryTwo}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Text(
                    '- ${this.res.menssageCategoryThree}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Text(
                    '- ${this.res.menssageCategoryFour}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Text(
                    '- ${this.res.menssageScore1}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: kWhiteColor,
    );
  }
}
