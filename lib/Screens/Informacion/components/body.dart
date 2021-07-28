import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Lecturas/lectura_screen.dart';
import 'package:flutter_auth/models/Lecturas.dart';

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
    //Size size = MediaQuery.of(context).size;
    //return SafeArea(child: Center(child: ListView(children: []))); <-----------------------------------
    return SafeArea(
        child: Center(
      child: ListView.builder(
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                //dondeClickeo(index);
                getLect(index);
              },
              child: Container(
                child: Image.asset(
                  'assets/images/Banner${images[index]}.jpg',
                  height: 300,
                ),
              ),
            ),
          );
        },
      ),
    ));

    // This size provide us total height and width of our screen
    /*
    return Scaffold(
      drawer: MenuLateral(),
      body: Column(
        children: <Widget>[
          Flexible(
            child: Container(
              //width: double.infinity,
              child: ListView.builder(
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      padding: EdgeInsets.all(20.0),
                      child: Positioned(
                        child: InkWell(
                          onTap: () {
                            //dondeClickeo(index);
                            getLect(index);
                          },
                          child: Container(
                            child: Image.asset(
                              'assets/images/Banner${images[index]}.jpg',
                              height: 300,
                            ),
                          ),
                        ),
                      ));
                },
              ),
            ),
          ),
        ],
      ),
      backgroundColor: kWhiteColor,
    );*/
  }
}
