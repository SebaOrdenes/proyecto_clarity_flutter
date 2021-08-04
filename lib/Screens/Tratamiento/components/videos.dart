import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../constants.dart';

class VideoPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Player Demo',
      home: VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // Crear y almacenar el VideoPlayerController. El VideoPlayerController
    // ofrece distintos constructores diferentes para reproducir videos desde assets, archivos,
    // o internet.
    _controller = VideoPlayerController.network(
      //'https://storage.googleapis.com/clarity-t/SESI%C3%93N%201.%20.mp4',
      'https://storage.googleapis.com/clarity-t/Videos%20Acompa%C3%B1amiento/SESI%C3%93N%201.%20.mp4',
      //'https://storage.googleapis.com/clarity-t/Videos%20Acompa%C3%B1amiento/VID_20200729_172330.mp4',
      //'https://storage.googleapis.com/clarity-t/Videos%20Acompa%C3%B1amiento/d2c57a9e-e85c-433d-8b43-92f6fd3e7664%20(1).MP4',
      //'https://storage.googleapis.com/clarity-t/Videos%20Acompa%C3%B1amiento/video%20redes.mp4',
    );

    // Inicializa el controlador y almacena el Future para utilizarlo luego
    _initializeVideoPlayerFuture = _controller.initialize();

    // Usa el controlador para hacer un bucle en el vídeo
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // Asegúrate de despachar el VideoPlayerController para liberar los recursos
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tratamiento',
          style: TextStyle(color: Colors.black, fontFamily: 'Raleway'),
        ),
        backgroundColor: kPinkOscuro,
      ),

      // Usa un FutureBuilder para visualizar un spinner de carga mientras espera a que
      // la inicialización de VideoPlayerController finalice.
      body: Column(
        children: [
          SizedBox(height: size.height * 0.25),
          FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // Si el VideoPlayerController ha finalizado la inicialización, usa
                // los datos que proporciona para limitar la relación de aspecto del VideoPlayer
                return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  // Usa el Widget VideoPlayer para mostrar el vídeo
                  child: VideoPlayer(_controller),
                );
              } else {
                // Si el VideoPlayerController todavía se está inicializando, muestra un
                // spinner de carga
                return Center(
                    child: CircularProgressIndicator(
                  color: kPinkcolor,
                ));
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPinkcolor,
        onPressed: () {
          // Envuelve la reproducción o pausa en una llamada a `setState`. Esto asegura
          // que se muestra el icono correcto
          setState(() {
            // Si el vídeo se está reproduciendo, pausalo.
            if (_controller.value.isPlaying) {
              _controller.pause();
              //_controller.setVolume(1);
            } else {
              // Si el vídeo está pausado, reprodúcelo
              _controller.play();
            }
          });
        },
        // Muestra el icono correcto dependiendo del estado del vídeo.
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ), // Esta coma final hace que el formateo automático sea mejor para los métodos de compilación.
    );
  }
}
