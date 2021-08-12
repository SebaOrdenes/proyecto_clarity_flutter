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
      descripcion:
          'Es una excelente herramienta, en formato de cápsulas de video que te ayudarán a  comprender lo que sucede en la mente, empatizar con tus emociones e iniciar ejercicios prácticos que facilitan el proceso de sanidad interior. Comprendemos las dinámicas psicológicas  comunes de la depresión y hemos desarrollado este programa para guiarte en tu propio proceso. Vamos a dar inicio a esta experiencia, recuerda que estamos para acompañarte.',
      url:
          'https://storage.googleapis.com/clarity-t/Videos%20Acompa%C3%B1amiento/SESI%C3%93N%201.%20.mp4'),
  Video(
      titulo: 'Dia 2',
      descripcion: 'descripcion2',
      url:
          'https://storage.googleapis.com/clarity-t/Videos%20Acompa%C3%B1amiento/video%20redes.mp4'),
  Video(
      titulo: 'Dia 3',
      descripcion: 'descripcion3',
      url: 'https://storage.googleapis.com/clarity-t/Bienvenida/CLARITY.mp4'),
];
