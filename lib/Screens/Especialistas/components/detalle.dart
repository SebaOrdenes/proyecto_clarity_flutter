import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Layout/components/background.dart';
import 'package:flutter_auth/Screens/Tratamiento/tratamiento_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/Especialista.dart';
import 'package:flutter_auth/services/especialistaService.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/calendar.dart';

class Detalle extends StatefulWidget {
  @override
  _DetalleState createState() => _DetalleState();
}

class _DetalleState extends State<Detalle> {
  Especialista especialista;
  dynamic listDateTime;
  int actualDay = 1;
  int actualMonth = 1;
  int actualYear = 2021;
  int actualHour = 0;

  //Atributos de fecha
  String selectedDay;
  String selectedDate;

  //Atributos tiempo
  int selectedHour = 0;
  int indexColorHour = 0;
  List<int> listHourNotAvailable;
  List<int> listHourAvailable;
  DateTime completeActualDate;
  Color colorSelectorHours = kSecondaryColor;

  String ruta = "assets/images/fondo.jpeg";

  @override
  void initState() {
    super.initState();

    this.especialista = EspecialistaService.especialista; //Especialista
    dateToList(especialista.hoursUnAvailableFCIOTOS); //Obener fechas ocupadas
    getNowDate(); //Obteniendo fecha actual
    timeSelector(completeActualDate);
    if (listHourAvailable.isEmpty == false) {
      this.selectedHour = listHourAvailable[0];
    } else {
      this.selectedHour = -1;
    }

    this.listHourNotAvailable = [];
  }

  //Solicitar la sesión 1-1
  updateHour(date) async {
    await EspecialistaService.updateHourOTO(this.especialista.id, date);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return TratamientoScreen();
        },
      ),
    );
  }

  //Obteniendo lista de listas con fecha y hora no disponible
  //Salida: [[fecha,hora],[fecha,hora]...]
  dateToList(List date) {
    print(date);
    print(date.map((e) => DateTime.parse(e).toUtc()));
    this.listDateTime = date.map(
        (e) => e.toString().substring(0, e.toString().length - 1).split("T"));
  }

  //Obtiene la fecha de una lista [fecha, hora]
  dateListToDate(List listDateTime) {
    return listDateTime[0];
  }

  //Obtiene la hora de una lista [fecha, hora]
  dateListToHour(List listDateTime) {
    return listDateTime[1];
  }

  List<String> getNowDate() {
    DateTime now = new DateTime.now();

    this.actualDay = now.day;
    this.actualMonth = now.month;
    this.actualYear = now.year;
    this.actualHour = now.hour;

    this.completeActualDate =
        new DateTime(now.year, now.month, now.day);

    List<String> newDate = completeActualDate.toString().split("-");

    return newDate;
  }

  //Comparar las fechas para mostrar los horarios en pantalla
  List compareDates(List selectedDateCalendar) {
    this.listHourNotAvailable = [];
    for (List dateTime in this.listDateTime) {
      String dateReserved = dateListToDate(dateTime);
      String selectedDay = dateListToDate(selectedDateCalendar);
      if (selectedDay == dateReserved) {
        int hour = int.parse(dateTime[1].substring(0, 2));
        print(dateTime);
        setState(() {
          this.listHourNotAvailable.add(hour);
          print(listHourNotAvailable);
        });
      }
    }
    return this.listHourNotAvailable;
  }

  //Obtiene las horas disponibles
  getAvailableHours() {
    int i = this.actualHour;
    String actualDayAux;

    //Cambiar tipo dato día actual
    if (this.actualDay < 10) {
      actualDayAux = "0${this.actualDay}";
    } else {
      actualDayAux = "${this.actualDay}";
    }

    //Si el día seleccionado no es igual al día actual, las horas comienzan d
    //desde las 12. En caso contrario, se comienza de la hora actual.
    if (actualDayAux != this.selectedDay.substring(8, 10)) {
      i = 0;
    }

    this.listHourAvailable = [];
    for (; i < 24; i++) {
      if (this.listHourNotAvailable.isEmpty == false) {
        if (!this.listHourNotAvailable.contains(i)) {
          setState(() {
            this.listHourAvailable.add(i);
          });
        }
      } else {
        setState(() {
          this.listHourAvailable.add(i);
        });
      }
    }
  }

  //Selector horario
  //Enetrada: fecha seleccionada en pantalla
  timeSelector(DateTime date) {
    List selectedDateCalendar = date.toString().split(" ");
    this.selectedDay = selectedDateCalendar[0];
    compareDates(selectedDateCalendar);
    getAvailableHours();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(),
            child: ListView(
              children: [
                informationEspecialista(),
                //Contenedor con la fecha actual
                titleOneToOne("Seleccione una fecha"),
                showCalendar(),
                //Contenedor Texto Rango horas
                titleOneToOne("Seleccione una hora"),
                //Mostrar horarios disponibles

                Container(
                  margin: EdgeInsets.only(right: 20, bottom: 10),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    physics: NeverScrollableScrollPhysics(),
                    childAspectRatio: 2.7,
                    children: showHours(indexColorHour),
                  ),
                ),

                //Botón solicitar sesión
                buttonSesion(),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget informationEspecialista() {
    return Container(
      height: 150,

      decoration: BoxDecoration(
        color: kDeepOrangeColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),

      //Contenedor con información del especialista
      child: Container(
        child: Row(
          children: [
            //Contenedor con imagen del especialista
            Container(
              height: 100,
              width: 100,
              margin: EdgeInsets.only(bottom: 20, left: 20),
              child: Image.asset(this.especialista.image),
            ),
            //Contenedor con texto del especialista
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 30,
                      left: 10,
                    ),
                    child: Text(
                      this.especialista.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 5,
                      left: 10,
                    ),
                    child: Text(
                      this.especialista.speciality,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 5,
                      left: 10,
                    ),
                    child: Text(
                      "Sesión 1-1",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: "Raleway",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  titleOneToOne(String texto) {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
        left: 20,
      ),
      child: Text(
        texto,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: "Raleway",
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  //Método para mostrar el calendario
  showCalendar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2.0,
            spreadRadius: 0.0,
          )
        ],
      ),
      margin: EdgeInsets.only(
        top: 20,
        left: 10,
        right: 10,
      ),
      child: Calendar(
        firstDay: DateTime.now(),
        lastDay: DateTime.utc(2030, 3, 14),
        focusDay: DateTime.now(),
        selectedDay: DateTime.now(),
        getSelectDay: timeSelector,
      ),
    );
  }

  //Método para mostrar las horas
  showHours(int index) {
    List<Widget> widgets = [];
    for (int i = 0; i < this.listHourAvailable.length; i++) {
      int horaActual = listHourAvailable[i];
      int horaSiguiente = listHourAvailable[i] + 1;
      if (horaSiguiente == 25) {
        horaSiguiente = 1;
      }

      bool isSelected = false;
      if (i == index) {
        isSelected = true;
      }

      widgets.add(
        isSelected
            ? GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(left: 20, top: 10),
                  decoration: BoxDecoration(
                    color: colorSelectorHours,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 2),
                        child: Icon(
                          Icons.access_time,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 2),
                        child: Text(
                          "$horaActual:00 - $horaSiguiente:00 hrs",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : GestureDetector(
                onTap: () {
                  setState(() {
                    this.selectedHour = listHourAvailable[i];
                    indexColorHour = i;
                    isSelected = true;
                    colorSelectorHours = kSecondaryColor;
                    print(this.selectedHour);
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20, top: 10),
                  decoration: BoxDecoration(
                    color: Color(0xffEEEEEE),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          right: 2,
                        ),
                        child: Icon(
                          Icons.access_time,
                          color: Colors.black,
                          size: 18,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 2),
                        child: Text(
                          "$horaActual:00 - $horaSiguiente:00 hrs",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFamily: 'Raleway',
                          ),
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

  buttonSesion() {
    return Container(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {},
        child: RoundedButton(
          text: "Solicitar sesión 1-1",
          press: () {
            if (this.selectedHour != -1) {
              String selectedHourAux = "${this.selectedHour}";
              if (this.selectedHour < 10) {
                selectedHourAux = "0${this.selectedHour}";
              }
              this.selectedDate = "${this.selectedDay} $selectedHourAux:00:00";
              print(this.selectedDate);
              updateHour(this.selectedDate);
            }
          },
        ),
      ),
    );
  }
}
