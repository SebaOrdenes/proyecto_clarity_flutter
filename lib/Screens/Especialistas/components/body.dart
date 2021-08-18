import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Layout/components/background.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/Especialista.dart';
import 'package:flutter_auth/services/especialistaService.dart';

import '../detalleEspecialista_screen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Especialista> especialistas = [];
  String ruta = "assets/images/fondo.jpeg";
  String descriptionSection =
      "Accede a la extensa red de terapias propuestas por Clarity y trabaja en conjunto a un profesional en el cambio de patrones de pensamiento y comportamientos que le impiden sentirse bien.";
  @override
  void initState() {
    super.initState();
    setState(() {
      getEspecialistasUnoUno(EspecialistaService.listaEspecialistas);
    });
  }

  getEspecialistasUnoUno(List<Especialista> especialistas) {
    for (Especialista especialista in especialistas) {
      if (especialista.role[0].toString() == "0") {
        print(especialista.name);
        this.especialistas.add(especialista);
      }
    }
  }

  verDetalleEspecialista(int index) async {
    EspecialistaService.setEspecialista(this.especialistas[index]);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return DetalleEspecialistaScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          sectionText(),
          Container(
            margin: EdgeInsets.only(top: 20, left: 30),
            child: Text(
              "Red de Especialistas",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: ListView(children: [
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 0.9,
                  children: getEspecialistas(),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  getEspecialistas() {
    Size size = MediaQuery.of(context).size;
    List<Widget> widgets = [];
    for (int index = 0; index < especialistas.length; index++) {
      widgets.add(
        GestureDetector(
          //Al presionar contenedor con especialista
          onTap: () {
            verDetalleEspecialista(index);
          },

          //Contenedor con botón especialista y su información
          child: Container(
            margin: EdgeInsets.only(
              top: 5,
              right: 10,
              left: 10,
              bottom: 5,
            ),

            decoration: BoxDecoration(
              color: kDeepOrangeColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: kPinkOscuro,
                  blurRadius: 3.0,
                  spreadRadius: 0.0,
                )
              ],
            ),

            //Lo que está dentro del contenedor de cada especialista
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60.0),
                    child: Image.asset(
                      this.especialistas[index].image,
                      width: 80.0,
                      height: 80.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                //Contenedor con la descripción
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Nombre del especialista
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          this.especialistas[index].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      //Especialidad
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          this.especialistas[index].speciality,
                          style: TextStyle(
                            color: Color(0xffababab),
                            fontSize: 11,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return widgets;
  }

  sectionText() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        bottom: 10,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            this.ruta,
          ),
          fit: BoxFit.fitHeight,
        ),
      ),
      //Columnas titulo y descripción
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Contenedor titulo
          Container(
            margin: EdgeInsets.only(
              top: 10,
              right: 20,
              left: 20,
            ),
            child: Text(
              "Conecta con tú especialista",
              style: TextStyle(
                fontSize: 20.0,
                height: 1.4,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.start,
            ),
          ),

          //Contenedor Descripción
          Container(
            margin: EdgeInsets.only(
              top: 10,
              right: 20,
              left: 20,
              bottom: 20,
            ),
            child: Text(
              "$descriptionSection",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15.0,
                fontFamily: "Raleway",
                height: 1.4,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
