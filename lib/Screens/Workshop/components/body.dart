import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Layout/components/background.dart';
import 'package:flutter_auth/Screens/Videos/videos_screen.dart';
import 'package:flutter_auth/components/calendar.dart';
import 'package:flutter_auth/models/Users.dart';
import 'package:flutter_auth/models/Workshop.dart';
import 'package:flutter_auth/services/workshopService.dart';
import 'package:flutter_auth/constants.dart';

import '../detalleWorkshop_screen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String ruta = "assets/images/fondo.jpeg";
  String descriptionSection =
      "Nos interesa saber sobre tus problemas y así comprender sus causas y alternativas de solución. Recuerda, no estas sola en este proceso, y parte de nuestro apoyo es brindarte experiencias de aprendizaje que permitan empoderarte y afrontar todos tus desafíos.";

  //Listas de workshop
  List<Workshop> listWorkshop;
  List<Workshop> originalListWorkshop; //para mostrar todos los workshops

  //Filtros por fecha
  String selectDate;
  String textFilter;
  IconData iconFilter;
  bool stateFilter;

  @override
  void initState() {
    super.initState();
    this.listWorkshop = WorkshopService.listaWorkshop;
    print(this.listWorkshop);
    this.originalListWorkshop = WorkshopService.listaWorkshop;
    this.textFilter = "Filtrar por:";
    this.iconFilter = Icons.calendar_today;
    this.stateFilter = false;
  }

  //Obtención de lista de workshop
  //Selección de fecha en calendario
  dateSelector(DateTime date) {
    List selectedDateCalendar = date.toString().split(" ");
    print(selectedDateCalendar);
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

  //Compara fecha seleccionada y fechas en la lista
  comparateDates(String selectDate, String dateWorkshop) {
    if (selectDate == dateWorkshop) {
      return true;
    }
    return false;
  }

  //Filtra los workshop por fecha a partir de una lista original
  filterByDate(DateTime selectDate) {
    setState(
      () {
        this.listWorkshop = [];
      },
    );
    if (this.originalListWorkshop.isEmpty == false) {
      for (int i = 0; i < this.originalListWorkshop.length; i++) {
        String dateTime = originalListWorkshop[i].hour;
        String dateOriginal = getDatefromDateTime(dateTime);
        String dateSelected = selectDate.toString().split(" ")[0];
        bool resultComparate = comparateDates(dateSelected, dateOriginal);
        if (resultComparate == true) {
          setState(
            () {
              this.listWorkshop.add(originalListWorkshop[i]);
            },
          );
        }
      }
    }
  }

  //Cambia los valores del filtro en pantalla
  setFilterState() {
    //Mostrar o no calendario
    setState(
      () {
        //stateFilter = false: no se filtra por fecha
        //stateFilter = true:  si se filtra por fecha
        if (stateFilter == false) {
          this.stateFilter = true;
          this.textFilter = "Ver todos";
          this.iconFilter = Icons.view_list;
          filterByDate(DateTime.now());
        } else {
          this.stateFilter = false;
          this.textFilter = "Filtrar por:";
          this.iconFilter = Icons.calendar_today;
          this.listWorkshop = this.originalListWorkshop;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Lista con calendarios y workshops disponibles
          Expanded(
            child: Container(
              margin: EdgeInsets.only(),
              child: ListView(
                children: [
                  //Contenedor Descripción de la sección
                  sectionText(),
                  showCalendarFilter(),
                  showCalendar(),
                  Container(
                    child: Column(
                      children: showListWorkshop(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
              "Workshops",
              style: TextStyle(
                fontSize: 20.0,
                height: 1.4,
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

  showCalendarFilter() {
    //Size size = MediaQuery.of(context).size;
    return Container(
      //Contenedor de filtros
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      //Fila de contenedor para mover al final el contenedor
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //Contenedor Nombre filtro y fecha
          GestureDetector(
            onTap: () {
              setFilterState();
            },

            //Contenedor filtro
            child: Container(
              width: 130,
              decoration: BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: kSecondaryColor,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),

              //Fila para situar nombre filtro e icono
              child: Row(
                children: [
                  //Contenedor titulo
                  Container(
                    margin: EdgeInsets.only(
                      left: 10,
                      right: 5,
                    ),
                    child: Text(
                      textFilter,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  //Contenedor de icono
                  Container(
                    margin: EdgeInsets.only(
                      left: 5,
                      right: 10,
                      top: 2,
                      bottom: 2,
                    ),
                    child: Icon(
                      iconFilter,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  showCalendar() {
    if (stateFilter == true) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(
          top: 20,
          left: 10,
          right: 10,
          bottom: 10,
        ),
        child: Calendar(
          firstDay: DateTime.now(),
          lastDay: DateTime.utc(2030, 3, 14),
          focusDay: DateTime.now(),
          selectedDay: DateTime.now(),
          getSelectDay: filterByDate,
        ),
      );
    }
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Text("Seleeción de workshop",
          style: TextStyle(
            fontFamily: 'Raleway',
          )),
    );
  }

  showListWorkshop() {
    List<Widget> widgets = [];
    Size size = MediaQuery.of(context).size;
    if (this.listWorkshop.isEmpty == false) {
      //Para mostra lista de workshop
      for (int i = 0; i < this.listWorkshop.length; i++) {
        String date = getDatefromDateTime(listWorkshop[i].hour);
        String time = getTimeFromDateTime(listWorkshop[i].hour);
        String dateInvert = invertDate(date);
        if (this.listWorkshop[i].totalCapacity >
            this.listWorkshop[i].participants.length) {
          widgets.add(
            GestureDetector(
              onTap: () {
                WorkshopService.setWorkshop(this.listWorkshop[i]);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DetalleWorkshopScreen();
                    },
                  ),
                );
              },

              //Contenedor workshop
              child: Container(
                margin: EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                  bottom: 10,
                ),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Imagen
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 10),
                      height: 90,
                      width: 90,
                      child: Image.asset(
                        this.listWorkshop[i].especialista.image,
                        scale: 1,
                      ),
                    ),

                    //Información del workshop
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Titulo del workshop
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              this.listWorkshop[i].title,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),

                          //Fecha y hora de workshop
                          Container(
                            child: Row(
                              children: [
                                //Fecha
                                Container(
                                  child: Text(
                                    dateInvert,
                                    style: TextStyle(
                                      color: Color(0xffababab),
                                      fontSize: 17,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),

                                //Hora
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  child: Text(
                                    "$time hrs",
                                    style: TextStyle(
                                      color: Color(0xffababab),
                                      fontSize: 17,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //Nombre Especialista
                          Container(
                            child: Text(
                              "Especialista: ${this.listWorkshop[i].especialista.name}",
                              style: TextStyle(
                                color: Color(0xffababab),
                                fontSize: 13,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(left: size.width * 0.55),
                            child: Icon(
                              Icons.arrow_right_alt_rounded,
                              color: kPinkOscuro,
                              size: 30,
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
      }
    } else {
      //Contenedor para mostrar que no existen workshop disponibles
      widgets.add(
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return VideoScreen();
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
                    "Lo sentimos ${Users.name}, aún no hay un worshop definido para la fecha seleccionada. Pero puede ver los vídeos creados por nuestro equipo u otros servicios que ofrece Clarity.",
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
        ),
      );
    }

    return widgets;
  }
}
