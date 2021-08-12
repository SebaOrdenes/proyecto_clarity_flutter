import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Admin/components/menu_lateral.dart';
import 'package:flutter_auth/Screens/Videos/components/videos_tratamiento.dart';
import 'package:flutter_auth/models/Videos.dart';
import '../../../constants.dart';

class VideoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      drawer: MenuLateral(),
      body: ListView.builder(
          itemCount: listaVideos.length,
          itemBuilder: (context, index) {
            Video video = listaVideos[index];
            return Card(
              child: ListTile(
                title: Text(video.titulo),
                //leading: Image.network(video.url),
                trailing: Icon(Icons.arrow_forward_rounded),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return VideoPlayer();
                      },
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
