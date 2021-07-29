import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Layout/components/background.dart';
import 'package:flutter_auth/Screens/Para_ti/para_ti_screen.dart';
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

  @override
  void initState() {
    super.initState();
    setState(() {
      getEspecialistasUnoUno(EspecialistaService.listaEspecialistas);


    });
  }

  getEspecialistasUnoUno(List<Especialista> especialistas){
    for(Especialista especialista in especialistas){
      if(especialista.role[0].toString() == "0"){
        print(especialista.name);
        this.especialistas.add(especialista);
      }
    }

  }

  verDetalleEspecialista(int index) async{
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
          Container(
            margin: EdgeInsets.only(top: 20, left: 30),
            child: Text("Especialistas"),
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: ListView.builder(
              itemCount: especialistas.length,
              itemBuilder: (BuildContext context, int index) {
                return getEspecialistas(index);
              },
            ),
          ))
        ]));
  }

  Widget getEspecialistas(int index) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(

      //Al presionar contenedor con especialista
      onTap: () {
        verDetalleEspecialista(index);
        },

      //Contenedor con botón especialista y su información
      child: Container(
        height: 110,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: kDeepOrangeColor,
          borderRadius: BorderRadius.circular(5),

        ),

        //Lo que está dentro del contenedor de cada especialista
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Imagen de especialista
            Container(
                margin: EdgeInsets.only(left: 20, top:10),
                height: 90,
                width: 90,
                child: Image.asset(this.especialistas[index].image)),

            //Información del especialista

            Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Nombre del especialista
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      this.especialistas[index].name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  //Descripción del especialista
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        //Especialidad
                        Container(
                          child: Text(
                            this.especialistas[index].speciality,
                            style: TextStyle(
                              color: Color(0xffababab),
                              fontSize: 17,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),

                        //Evaluación especialista
                        Container(
                          margin:
                              EdgeInsets.only(top: 3, left: size.width * 0.25),
                          child: Row(
                            children: [
                              //Texto rating
                              Container(
                                child: Text(
                                  "Tipo: ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'Roboto'),
                                ),
                              ),
                              //Valor rating
                              Container(
                                child: Text(
                                  "1-1",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'Roboto'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
