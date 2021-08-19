import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Layout/components/background.dart';
import 'package:flutter_auth/Screens/Tratamiento/tratamiento_screen.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/models/Especialista.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/Users.dart';
import 'package:flutter_auth/models/Workshop.dart';
import 'package:flutter_auth/services/workshopService.dart';

class DetalleWorkshop extends StatefulWidget {
  @override
  _DetalleWorkshopState createState() => _DetalleWorkshopState();
}

class _DetalleWorkshopState extends State<DetalleWorkshop> {
  Especialista especialista;
  Workshop workshop;
  String ruta = "assets/images/main_top.png";
  String workshopDate;
  String workshopHour;
  String textConfirm; //Texto descriptivo

  bool loading = false; //Permite mostrar circulo de carga

  @override
  void initState() {
    super.initState();
    workshop = WorkshopService.workshop;
    especialista = WorkshopService.workshop.especialista;
    String workshopDate = workshop.hour;
    this.workshopDate = getDatefromDateTime(workshopDate);
    this.workshopDate = invertDate(this.workshopDate);
    this.workshopHour = getTimeFromDateTime(workshopDate);
    this.textConfirm =
        "${Users.name}, gracias por solicitar un Workshop. Para poder finalizar su solicitud debe presionar el siguiente botón.";
  }

  //Obtener fecha
  getDatefromDateTime(String dateTime) {
    return dateTime.split("T")[0];
  }

  //Obtener hora
  getTimeFromDateTime(String dateTime) {
    return dateTime.split("T")[1].substring(0, 5);
  }

  //Invertir fecha a partir de un DateTime
  invertDate(String date) {
    return date.split("-").reversed.join("-");
  }

  //Realizar solicitud del workshop
  addParticipantWokshop() async {
    setLoading(true);
    await WorkshopService.addParticipantWorkshop(workshop.id, Users.id);
    setLoading(false);
    Users.listWorkshops.add(Users.id);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return TratamientoScreen();
        },
      ),
    );

    return showProblem;
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      //Contenedor fondo
      child: Column(
        children: [
          Expanded(
            //Contenedor con fondo de la pantalla
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    this.ruta,
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
              margin: EdgeInsets.only(),
              child: ListView(
                children: [
                  //Columna central
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      detailWorkshop(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Carta con detalla de la solicitud
  Widget detailWorkshop() {
    //Contenedor información de solicitud
    return Container(
      margin: EdgeInsets.only(
        right: 30,
        left: 30,
        top: 30,
        bottom: 30,
      ),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: kPrimaryLightColor,
            blurRadius: 10.0,
            spreadRadius: 0.0,
          )
        ],
      ),
      //Columna con: Nombre del especialista, detalle del workshop y botón
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Contenedor con columna de información. Mueve parte intera de contenedor información
          Container(
            margin: EdgeInsets.only(
              top: 10,
              bottom: 5,
            ),
            child: informationCollaborator(),
          ),

          //Contenedor información workshop
          Container(
            margin: EdgeInsets.only(
              top: 10,
              bottom: 5,
            ),
            child: informationWorkshop(),
          ),

          //Botón solicitar Workshop
          Container(
            margin: EdgeInsets.only(
              top: 10,
              bottom: 5,
            ),
            child: storeWorkshopPetition(),
          ),
        ],
      ),
    );
  }

  informationCollaborator() {
    //Primera fila
    return Row(
      children: [
        //Contenedor con imagen del especialista
        Container(
          height: 100,
          width: 100,
          margin: EdgeInsets.only(bottom: 20, left: 20, top: 10),
          child: Image.asset(this.especialista.image),
        ),
        //Contenedor con texto del especialista (expanded ajusta el texto para no sobresalir de la pantalla)
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Nombre especialista
                Text(
                  this.especialista.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w700,
                  ),
                ),

                //Tipo de especialista
                Text(
                  this.especialista.speciality,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w300,
                  ),
                ),

                //Tipo de sesión
                Text(
                  "Workshop",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  //Información sobre la solicitud del workshop
  informationWorkshop() {
    return Column(
      children: [
        //Descripción de la solicitud

        //Titulo de la sección
        Container(
          margin: EdgeInsets.only(left: 20, bottom: 20, right: 20),
          child: Text(
            "Descripción del Workshop solicitado",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.0,
              fontFamily: "Raleway",
              fontWeight: FontWeight.bold,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        //Variables de workshop: nombre, descripción y cantidad

        Container(
          margin: EdgeInsets.only(left: 20, bottom: 20, right: 20),
          //Columna con variables y ajustadas al inicio
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nombre: ${this.workshop.title}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontFamily: "Raleway",
                  height: 1.5,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                "Descripción: ${this.workshop.description}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontFamily: "Raleway",
                  height: 1.5,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                "Participantes: ${this.workshop.totalCapacity} personas",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontFamily: "Raleway",
                  height: 1.5,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                "Fecha: ${this.workshopDate} ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontFamily: "Raleway",
                  height: 1.5,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                "Hora: ${this.workshopHour} hrs",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontFamily: "Raleway",
                  height: 1.5,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, bottom: 20, right: 20),
          child: Text(
            this.textConfirm,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.0,
              fontFamily: "Raleway",
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, bottom: 20, right: 20),
        ),
      ],
    );
  }

  storeWorkshopPetition() {
    return RoundedButton(
      loading: loading,
      text: "Solicitar Workshop",
      press: () {
        if (workshop.totalCapacity > 0) {
          addParticipantWokshop();
        } else {
          setState(
            () {
              this.textConfirm =
                  "Lo sentimos ${Users.name}, acaban de solicitar el último cupo. Pero puedes visitar otras secciones presionando este panel ";
            },
          );
        }
      },
    );
  }

  showProblem() {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return TratamientoScreen();
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 20, left: 20, bottom: 10, top: 20),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: kPinkOscuro,
              blurRadius: 3.0,
              spreadRadius: 0.0,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_sharp,
              color: kPinkOscuro,
              size: 100,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, bottom: 20, right: 20),
              child: Text(
                "Lo sentimos ${Users.name}, acaban de solicitar el último cupo. Pero puedes visitar otras secciones presionando este panel",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontFamily: "Raleway",
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: size.width * 0.7),
              child: Icon(
                Icons.arrow_right_alt_rounded,
                color: kPinkOscuro,
                size: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Modificar circulo de carga
  setLoading(booleanVariable) {
    setState(() {
      loading = booleanVariable;
    });
  }
}
