import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Informacion/informacion_screen.dart';
import 'package:flutter_auth/Screens/Medicion/medicion_screen.dart';
import 'package:flutter_auth/Screens/Para_ti/para_ti_screen.dart';
import 'package:flutter_auth/Screens/Tratamiento/tratamiento_screen.dart';
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
                  'Carolina',
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
                  return ParaTiScreen();
                },
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.text_snippet_rounded),
          title: Text(
            'Medicion',
            style: TextStyle(fontSize: 18, fontFamily: 'Raleway'),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return MedicionScreen();
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
          leading: Icon(Icons.quiz_rounded),
          title: Text(
            'Tratamiento',
            style: TextStyle(fontSize: 18, fontFamily: 'Raleway'),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return TratamientoScreen();
                },
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.music_video_rounded),
          title: Text(
            'Revitalizar',
            style: TextStyle(fontSize: 18, fontFamily: 'Raleway'),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return MedicionScreen();
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
