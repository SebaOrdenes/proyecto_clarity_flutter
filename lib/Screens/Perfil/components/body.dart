import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Admin/components/background.dart';
import 'package:flutter_auth/components/calendar.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/Users.dart';
import 'package:flutter_auth/services/sesionGrupalService.dart';
import 'package:flutter_auth/services/sesionOTOService.dart';
import 'package:flutter_auth/services/workshopService.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String backgroundImage = "assets/images/login_bottom.png";
  String perfilImage = "assets/images/ESPERANZA.jpg";
  int lengthSession1_1 = 0;
  int lengthGroupSession = 0;
  int lengthWorkshops = 0;
  bool loading;
  bool stateButtonPremium = false;
  List<dynamic> listEventsByDay;

  @override
  void initState() {
    super.initState();
    getSessions();
    this.loading = false;

    //SesionOTOService.getOTOSByUser(user);
  }

  //Obtener las sesiones de las usuarias
  getSessions() async {
    setState(() {
      this.lengthSession1_1 = SesionOTOService.listaSessionsOTOByUser.length;
      this.lengthGroupSession =
          SesionGrupalService.listaSesionGrupalByUser.length;
      this.lengthWorkshops = WorkshopService.listaWorkshopByUser.length;
    });
  }

  //Actualizar la membresía de usuario
  updateMembership() async {
    setState(() {
      loading = true;
    });
    // ignore: unused_local_variable
    http.Response response = await http.post(
      Uri.http(ip, '/api/users/updateMembership'),
      body: {
        'username': Users.username,
        'membership': "1",
      },
    );

    setState(() {
      loading = false;
      stateButtonPremium = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      //Contenedor principal
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    this.backgroundImage,
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
              child: ListView(
                children: [
                  //Columna con información del usuario
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Fila con Imagen del usuario
                      buildImage(),
                      //Fila con nombre del usuario
                      buildName(),
                      //Fila con email del usuario
                      buildEmail(),
                      //Fila con botón actualizar usuarios
                      buildUpgradeButton(),
                      Container(
                        height: 45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildButton(
                                "$lengthSession1_1", "Sesión individual"),
                            VerticalDivider(),
                            buildButton("$lengthGroupSession", "Sesión Grupal"),
                            VerticalDivider(),
                            buildButton("$lengthWorkshops", "Workshop"),
                          ],
                        ),
                      ),

                      //buildCalendar(),
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

  //Imagen de perfil
  buildImage() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: Ink.image(
              image: AssetImage(this.perfilImage),
              fit: BoxFit.cover,
              width: 128,
              height: 128,
              child: InkWell(
                onTap: () {},
              )),
        ),
      ),
    );
  }

  //Mostrar nombre
  buildName() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 5),
      child: Text(
        Users.name,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: "Raleway",
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  //Mostrar email
  buildEmail() {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: Text(
        Users.email,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontFamily: "Raleway",
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  //Mostrar botón actualizar a premium
  buildUpgradeButton() {
    if (Users.membership != 1 && stateButtonPremium == false) {
      return Container(
        margin: EdgeInsets.only(top: 5, bottom: 5),
        child: RoundedButton(
          text: "Actualizar a Premium",
          dimension: 0.7,
          color: kPinkcolor,
          loading: loading,
          press: () {
            return updateMembership();
          },
        ),
      );
    }
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 15),
      child: Text(
        "Usuaria Premium",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }

  //Botones información
  buildButton(String value, String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: MaterialButton(
        onPressed: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Calendario
  buildCalendar() {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.symmetric(horizontal: 40),
      width: size.width * 0.9,
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
            color: kWhiteColor,
            blurRadius: 1.0,
            spreadRadius: 0.0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Calendar(
            firstDay: DateTime.now(),
            lastDay: DateTime.utc(2030, 3, 14),
            focusDay: DateTime.now(),
            selectedDay: DateTime.now(),
            format: CalendarFormat.twoWeeks,
          ),
        ],
      ),
    );
  }

  //Información de la usuaria
  builText() {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.symmetric(horizontal: 40),
      width: size.width * 0.9,
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
            color: kWhiteColor,
            blurRadius: 1.0,
            spreadRadius: 0.0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Container()],
      ),
    );
  }
}
