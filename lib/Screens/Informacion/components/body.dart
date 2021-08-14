import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Lecturas/lectura_screen.dart';
import 'package:flutter_auth/models/Lecturas.dart';
import 'package:flutter_auth/models/Users.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  List<int> images = [];
  Lectura lectura = new Lectura('', '', '', null, null);
  //metodo para llamar a getlectura con un await
  void getLect(int index) async {
    await lectura.getLecturas(index);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LecturaScreen();
        },
      ),
    );
  }

//Aumenta el contador de la imagen
  void _addImagen() {
    for (var i = 0; i < 6; i++) {
      images.add(i + 1);
      //Permite el cambio de estado de las imagenes (reflejan en lista los nuevos elementos)
      setState(() {});
    }
  }

  //initState se ejecuta antes que se carguen todos los componentes
  @override
  void initState() {
    super.initState();
    _addImagen();
  }

  void dondeClickeo(int index) {
    print(index);
  }

  Widget build(BuildContext context) {
    if (Users.membership == 1) {
      return SafeArea(
          child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/fondo.jpeg'), fit: BoxFit.none),
        ),
        child: Center(
          child: ListView.builder(
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    getLect(index);
                  },
                  child: Container(
                    child: Image.asset(
                      'assets/images/Banner${images[index]}.jpg',
                      height: 200,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ));
    } else {
      return SafeArea(
          child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/fondo.jpeg'), fit: BoxFit.none),
        ),
        child: Center(
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    getLect(index);
                  },
                  child: Container(
                    child: Image.asset(
                      'assets/images/Banner${images[0]}.jpg',
                      height: 200,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ));
    }
  }
}
