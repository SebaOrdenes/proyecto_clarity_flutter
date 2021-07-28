import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Admin/admin_screen.dart';
import 'package:flutter_auth/Screens/Informacion/informacion_screen.dart';
import 'package:flutter_auth/constants.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          color: kPinkOscuro,
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    //image: DecorationImage(
                    //  image: NetworkImage(
                    //    'https://images.app.goo.gl/f5WNPUWswzehUpJT7'),
                    //fit: BoxFit.fill),
                  ),
                ),
                Text(
                  'ADMIN',
                  style: TextStyle(
                      fontSize: 18, fontFamily: 'Raleway'), //nombre inventado
                )
              ],
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.person_rounded),
          title: Text(
            'Inicio',
            style: TextStyle(fontSize: 18, fontFamily: 'Raleway'),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AdminScreen();
                },
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.info_outline_rounded),
          title: Text(
            'Informacion',
            style: TextStyle(fontSize: 18, fontFamily: 'Raleway'),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return InformacionScreen();
                },
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.arrow_back),
          title: Text(
            'Logout',
            style: TextStyle(fontSize: 18, fontFamily: 'Raleway'),
          ),
          onTap: null,
        )
      ],
    ));
  }
}
