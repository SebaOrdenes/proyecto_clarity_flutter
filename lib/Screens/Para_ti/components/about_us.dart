import 'package:better_player/better_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Layout/menu_lateral.dart';
import 'package:flutter_auth/Screens/Videos/components/lista_videos_screen.dart';
import 'package:flutter_auth/models/Users.dart';
import 'package:flutter_auth/models/Videos.dart';
import '../../../constants.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Video video = listaVideos[2];

    return Scaffold(
      drawer: MenuLateral(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          'Acerca de nosotros',
          style: TextStyle(color: Colors.black, fontFamily: 'Raleway'),
        ),
        backgroundColor: kWhiteColor,
      ),
      body: Container(
        color: kDeepOrangeColor,
        child: ListView(
          children: [
            //SizedBox(height: size.height * 0.015),

            SizedBox(height: size.height * 0.015),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: BetterPlayerPlaylist(
                  betterPlayerConfiguration: BetterPlayerConfiguration(),
                  betterPlayerPlaylistConfiguration:
                      BetterPlayerPlaylistConfiguration(),
                  betterPlayerDataSourceList: createDataSet(2)),
            ),
            Container(
              child: Text(
                'Quiénes somos',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Raleway',
                    fontSize: 20,
                    height: 2),
              ),
            ),

            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Clarity es una solución simple y altamente efectiva para el manejo de la depresión en mujeres que deseen experimentar bienestar y felicidad en sus vidas',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Raleway',
                    fontSize: 15,
                    height: 1.3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
