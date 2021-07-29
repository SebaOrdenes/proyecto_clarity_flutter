import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Layout/components/background.dart';
import 'package:flutter_auth/Screens/Para_ti/para_ti_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/Especialista.dart';
import 'package:flutter_auth/services/especialistaService.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

import '../especialistas_screen.dart';

class Detalle extends StatefulWidget {
  @override
  _DetalleState createState() => _DetalleState();
}

class _DetalleState extends State<Detalle> {
  Especialista especialista;
  List<String> listDates;
  List<String> ListHours;

  List<String> dates = ["Jue","Vie","Sab"];
  List<String> days = ["29","30","31"];
  String actualDate;
  bool stateDate = false;

  @override
  void initState() {
    super.initState();
    this.especialista = EspecialistaService.especialista;
    hourToList(especialista.hoursUnAvailableFCIOTOS[0]);
    getNowDate();
  }

  //Obteniendo fecha
  List<String> dateToList(dynamic date){
    List<String> listDateTime = date.toString().split("T");
    List<String> listDate = listDateTime[0].split("-");
    return listDate;
  }

    //Obteniendo hora
    List<String> hourToList(dynamic date){
      List<String> listDateTime = date.toString().split("T");
      List<String> listHour = listDateTime[1].split(":");
      return listHour;
    }

  List<String> getNowDate() {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    List<String> newDate = date.toString().split("-");
    return newDate;
  }

  getHoursFree(List<dynamic> listDate, List<dynamic> listHours){
    String dia = listDate[0];
    String mes = listDate[1];
    String anio = listDate[2];
    String hour = listHours[0];

    }

  @override
  Widget build(BuildContext context) {



    return Background(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: kPinkOscuro,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
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
                      margin: EdgeInsets.only(bottom: 20, left: 20 ),
                      child: Image.asset(this.especialista.image),
                    ),
                    //COntenedor con texto del especialista
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top:45, left: 10,),
                            child: Text(
                              this.especialista.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top:5, left: 10,),
                            child: Text(
                              this.especialista.speciality,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top:5, left: 10,),
                            child: Text(
                             "Sesión 1-1",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],

                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Contenedor con la fecha actual
            Container(
              margin: EdgeInsets.only(top:30, left: 20,),
              child: Text(
                "Julio 2021",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //Contenedor con las fechas disponibles

            Container(
              margin: EdgeInsets.only(left:10, top:20, right: 20),
              height: 90,
              child:ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                    itemBuilder: (BuildContext context, int index) {
                    return demoDates(this.dates[index], this.days[index], true);

                }
              )
            ),
            //Contenedor Texto Mañana
            Container(
              margin: EdgeInsets.only(top:30, left: 20,),

              child: Text(
                "Mañana",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 20),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 2.7,
                  children: [
                    doctorTiming("8:30",true),
                    doctorTiming("8:30",false),

                  ],
                )
            ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return EspecialistasScreen();
              },
            ),
          );

        },
            child:Container(
              margin: EdgeInsets.only(top:30, left: 20,),
              child: Text(
                "Tarde",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),),
            Container(
                margin: EdgeInsets.only(right: 20),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 2.7,
                  children: [
                    doctorTiming("8:30",true),
                    doctorTiming("8:30",false),
                    doctorTiming("8:30",false),

                  ],
                )
            ),
               Container(
                 alignment: Alignment.center,
                 width: MediaQuery.of(context).size.width,
                 height: 30,
                 margin: EdgeInsets.all(20),
                 decoration: BoxDecoration(
                   color: kPinkOscuro,
                   borderRadius: BorderRadius.circular(5)
                 ),
                 child: Text( "Solicitar una sesión",
                     style:TextStyle(
                      color: Colors.white,
                       fontSize: 20,
                       fontFamily: "Roboto",
                       fontWeight: FontWeight.w500,
                 ))
               )
          ],
        ),

    );
  }

  doctorTiming(String time, bool isSelected){
    return isSelected ?
    GestureDetector(
      onTap: () {

      },
    child: Container(
      margin: EdgeInsets.only(left: 20,top:10),
      decoration: BoxDecoration(
        color: Color(0xff107613),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 5),
            child: Icon(
              Icons.access_time,
              color: Colors.white,
              size: 10,
            )
          ),
          Container(
            margin: EdgeInsets.only(right: 5),
            child: Text(
              time,
              style: TextStyle(
                color: Colors.white,
                fontSize:17
              )
            ),
          )
        ],
      ),
    ),):GestureDetector(
        child:Container(margin: EdgeInsets.only(left: 20,top:10),
        decoration: BoxDecoration(
          color: Color(0xffEEEEEE),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(right: 5),
                child: Icon(
                  Icons.access_time,
                  color: Colors.black,
                  size: 10,
                )
            ),
            Container(
              margin: EdgeInsets.only(right: 5),
              child: Text(
                  time,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize:17
                  )
              ),
            )
          ],
        )
        ),
    );
  }

  demoDates(String day, String date, bool isSelected){
    return isSelected ?
    GestureDetector(
      onTap: () {
        print("chao");
      },
      child: Container(
      width: 70,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: kPinkcolor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top:20),
            padding: EdgeInsets.all(7),
            child: Text(
              day,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:1),
            padding: EdgeInsets.all(7),
            child: Text(
              date,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

        ],
      ),
    ), ):  GestureDetector(
        child: Container(
      width: 70,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Color(0xffEEEEEE),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top:20),
            padding: EdgeInsets.all(7),
            child: Text(
              day,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:1),
            padding: EdgeInsets.all(7),
            child: Text(
              date,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

        ],
      ),),);
  }
}

