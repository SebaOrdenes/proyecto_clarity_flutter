import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/models/Lecturas.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //initState se ejecuta antes que se carguen todos los componentes

  @override
  void initState() {
    super.initState();
    //print(Lectura.readingByDay[0].reading);
  }

  //Mostrar Todos los widgets en pantalla
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kDeepOrangeColor,
      //drawer: MenuLateral(),
      body: ListView.builder(
          itemCount: Lectura.titlesByDay.length,
          itemBuilder: (context, index) {
            int indexmasuno = index + 1;
            return Card(
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/fondo.jpeg'),
                      fit: BoxFit.cover),
                ),
                child: ListTile(
                  title: Text(
                      'Día $indexmasuno, ${Lectura.titlesByDay[index].titulo}'),
                  //leading: Image.network(video.url),
                  trailing: Icon(Icons.arrow_forward_rounded),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          //return VideoPlayer();
                          return Scaffold(
                            backgroundColor: kDeepOrangeColor,
                            //drawer: MenuLateral(),
                            appBar: AppBar(
                              iconTheme: IconThemeData(color: Colors.black),
                              centerTitle: true,
                              title: Text(
                                'Lectura diaria',
                                style: TextStyle(
                                    color: Colors.black, fontFamily: 'Raleway'),
                              ),
                              backgroundColor: kDeepOrangeColor,
                            ),
                            body: Container(
                              // color: kDeepOrangeColor,
                              padding: const EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/fondo.jpeg'),
                                    fit: BoxFit.fill),
                              ),
                              child: ListView(children: <Widget>[
                                Center(
                                  child: Text(
                                    "Día $indexmasuno, ${Lectura.titlesByDay[index].titulo}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Raleway',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  //padding: EdgeInsets.all(20.0),
                                  margin: EdgeInsets.all(20),
                                  child: Text(
                                    "${Lectura.readingByDay[index].reading}",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Raleway',
                                        height: 1.6),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ]),
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
/*Container(
      color: Colors.deepPurple.shade50,
      child: ListView(children: <Widget>[
        Center(
          child: Text(
            "Día 0, ${Lectura.titlesByDay[0].titulo}",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          color: Colors.indigo.shade50,
          //padding: EdgeInsets.all(20.0),
          margin: EdgeInsets.all(20),
          child: Text(
            "${Lectura.readingByDay[0].reading}",
            style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
            textAlign: TextAlign.justify,
          ),
        ),
      ]),
    );  */