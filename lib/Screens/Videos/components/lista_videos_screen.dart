import 'package:better_player/better_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Layout/menu_lateral.dart';
import 'package:flutter_auth/models/Users.dart';
import 'package:flutter_auth/models/Videos.dart';
import '../../../constants.dart';

class VideoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (Users.membership == 1) {
      return Scaffold(
        backgroundColor: kDeepOrangeColor,
        //drawer: MenuLateral(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Text(
            'Tratamiento premium',
            style: TextStyle(color: Colors.black, fontFamily: 'Raleway'),
          ),
          backgroundColor: Colors.white,
        ),

        body: ListView.builder(
            itemCount: listaVideos.length,
            itemBuilder: (context, index) {
              Video video = listaVideos[index];
              return Card(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/fondo.jpeg'),
                        fit: BoxFit.cover),
                  ),
                  child: ListTile(
                    title: Text(video.titulo),
                    //leading: Image.network(video.url),
                    trailing: Icon(Icons.arrow_forward_rounded),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            //return VideoPlayer();
                            return Scaffold(
                              //drawer: MenuLateral(),
                              appBar: AppBar(
                                iconTheme: IconThemeData(color: Colors.black),
                                centerTitle: true,
                                title: Text(
                                  'Tratamiento premium',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Raleway'),
                                ),
                                backgroundColor: kDeepOrangeColor,
                              ),
                              body: ListView(
                                children: [
                                  //SizedBox(height: size.height * 0.015),
                                  AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: BetterPlayerPlaylist(
                                        betterPlayerConfiguration:
                                            BetterPlayerConfiguration(),
                                        betterPlayerPlaylistConfiguration:
                                            BetterPlayerPlaylistConfiguration(),
                                        betterPlayerDataSourceList:
                                            createDataSet(index)),
                                  ),
                                  Container(
                                    child: Text(
                                      'Plan de Tratamiento: ${video.titulo}',
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
                                      '${video.descripcion}',
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
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              );
            }),
      );
    } else {
      return Scaffold(
        backgroundColor: kDeepOrangeColor,
        //drawer: MenuLateral(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Text(
            'Tratamiento premium',
            style: TextStyle(color: Colors.black, fontFamily: 'Raleway'),
          ),
          backgroundColor: Colors.white,
        ),

        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              Video video = listaVideos[index];
              return Card(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/fondo.jpeg'),
                        fit: BoxFit.cover),
                  ),
                  child: ListTile(
                    title: Text(video.titulo),
                    //leading: Image.network(video.url),
                    trailing: Icon(Icons.arrow_forward_rounded),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            //return VideoPlayer();
                            return Scaffold(
                              //drawer: MenuLateral(),
                              appBar: AppBar(
                                iconTheme: IconThemeData(color: Colors.black),
                                centerTitle: true,
                                title: Text(
                                  'Tratamiento premium',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Raleway'),
                                ),
                                backgroundColor: kDeepOrangeColor,
                              ),
                              body: ListView(
                                children: [
                                  //SizedBox(height: size.height * 0.015),
                                  AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: BetterPlayerPlaylist(
                                        betterPlayerConfiguration:
                                            BetterPlayerConfiguration(),
                                        betterPlayerPlaylistConfiguration:
                                            BetterPlayerPlaylistConfiguration(),
                                        betterPlayerDataSourceList:
                                            createDataSet(index)),
                                  ),
                                  Container(
                                    child: Text(
                                      'Plan de Tratamiento: ${video.titulo}',
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
                                      '${video.descripcion}',
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
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              );
            }),
      );
    }
  }
}

List<BetterPlayerDataSource> createDataSet(int index) {
  Video video = listaVideos[index];
  String url = video.url;
  List dataSourceList = List<BetterPlayerDataSource>();
  dataSourceList.add(
    BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      url,
    ),
  );
  return dataSourceList;
}
