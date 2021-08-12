import 'package:flutter/material.dart';
import 'package:better_player/better_player.dart';

import '../../../constants.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VideoPlayer(),
    );
  }
}

class VideoPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kDeepOrangeColor,
        //drawer: MenuLateral(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Tratamiento',
            style: TextStyle(color: Colors.black, fontFamily: 'Raleway'),
          ),
          backgroundColor: kPinkOscuro,
        ),
        body: ListView(
          children: [
            SizedBox(height: size.height * 0.015),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: BetterPlayerPlaylist(
                  betterPlayerConfiguration: BetterPlayerConfiguration(),
                  betterPlayerPlaylistConfiguration:
                      BetterPlayerPlaylistConfiguration(),
                  betterPlayerDataSourceList: createDataSet()),
            ),
            SizedBox(height: size.height * 0.015),
            Container(
                child: Text(
              'Dia 1: Plan de Tratamiento',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Raleway',
                  fontSize: 20,
                  height: 2),
            )),
            Container(
                child: Text(
              'Es una excelente herramienta, en formato de cápsulas de video que te ayudarán a  comprender lo que sucede en la mente, empatizar con tus emociones e iniciar ejercicios prácticos que facilitan el proceso de sanidad interior. Comprendemos las dinámicas psicológicas  comunes de la depresión y hemos desarrollado este programa para guiarte en tu propio proceso. Vamos a dar inicio a esta experiencia, recuerda que estamos para acompañarte.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Raleway',
                  fontSize: 15,
                  height: 1.3),
            )),
          ],
        ));
  }
}

List<BetterPlayerDataSource> createDataSet() {
  List dataSourceList = List<BetterPlayerDataSource>();
  dataSourceList.add(
    BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      'https://storage.googleapis.com/clarity-t/Videos%20Acompa%C3%B1amiento/SESI%C3%93N%201.%20.mp4',
    ),
  );
  /* dataSourceList.add(
    BetterPlayerDataSource(BetterPlayerDataSourceType.network,
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
  );
  dataSourceList.add(
    BetterPlayerDataSource(BetterPlayerDataSourceType.network,
        "http://sample.vodobox.com/skate_phantom_flex_4k/skate_phantom_flex_4k.m3u8"),
  );*/
  return dataSourceList;
}
