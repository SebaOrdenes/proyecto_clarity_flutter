import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Video {
  var id;
  String titulo;
  String descripcion;
  String url;
  static List<Video> listaVideos = [];
  static Video videoPresentacion;

  Video(
      {@required this.titulo, @required this.descripcion, @required this.url});
//para añadir nuevos videos, simplemente ingresar el json de cada video en la base de datos, desde aqui se llamaran automaticamente siempre y cuando se mantenga el formato
//sugerencia: utilizar postman para añadir nuevos json con titulo,descripcion y url donde se almacene el video (alguna api)
  // ignore: missing_return
  Future<Video> getVideos() async {
    listaVideos = [];
    http.Response response = await http.get(Uri.http(ip, 'api/video'));

    Map<String, dynamic> usersData =
        new Map<String, dynamic>.from(json.decode(response.body));
    for (var i = 0; i < usersData['data'].length; i++) {
      id = usersData['data'][i]["_id"];
      titulo = usersData['data'][i]["title"];
      descripcion = usersData['data'][i]["description"];
      url = usersData['data'][i]["url"];
      if (titulo != 'Presentación') {
        Video videoaux =
            new Video(titulo: titulo, descripcion: descripcion, url: url);
        listaVideos.add(videoaux);
      }
    }
    print(usersData['data'].length);
  }

//si se desea modifcar el video de presentacion, solamente debe subirme nuevamente el json con la url del video
//NOTA: necesariamente el video debe llamarse 'Presentación'
  // ignore: missing_return
  Future<Video> getVideoPresentacion() async {
    http.Response response = await http.get(Uri.http(ip, 'api/video'));

    Map<String, dynamic> usersData =
        new Map<String, dynamic>.from(json.decode(response.body));
    for (var i = 0; i < usersData['data'].length; i++) {
      id = usersData['data'][i]["_id"];
      titulo = usersData['data'][i]["title"];
      descripcion = usersData['data'][i]["description"];
      url = usersData['data'][i]["url"];
      if (titulo == 'Presentación') {
        videoPresentacion =
            new Video(titulo: titulo, descripcion: descripcion, url: url);
      }
    }
  }
}
