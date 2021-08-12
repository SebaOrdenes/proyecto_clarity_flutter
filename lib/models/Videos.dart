import 'package:flutter/material.dart';

class Video {
  String titulo;
  String descripcion;
  String url;

  Video(
      {@required this.titulo, @required this.descripcion, @required this.url});
}

List<Video> listaVideos = [
  Video(
      titulo: 'Dia 1',
      descripcion: 'descripcion1',
      url:
          'https://storage.googleapis.com/clarity-t/Videos%20Acompa%C3%B1amiento/SESI%C3%93N%201.%20.mp4'),
  Video(
      titulo: 'Dia 2',
      descripcion: 'descripcion2',
      url:
          'https://storage.googleapis.com/clarity-t/Videos%20Acompa%C3%B1amiento/d2c57a9e-e85c-433d-8b43-92f6fd3e7664%20(1).MP4'),
];
