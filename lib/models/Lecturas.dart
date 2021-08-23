// To parse this JSON data, do
//
//     final lectura = lecturaFromJson(jsonString);
import 'dart:convert';
import 'package:flutter_auth/constants.dart';
import 'package:http/http.dart' as http;

class Lectura {
  static String id;
  static String nameReadingPlan;
  static String introduction;

  static List<LecturasDiarias> readingByDay;
  static List<TitulosDiarios> titlesByDay;

  Lectura(String id, String nameReadingPlan, String introduction,
      List<String> readingByDay, List<String> titlesByDay) {
    id = id;
    nameReadingPlan = nameReadingPlan;
    introduction = introduction;
    readingByDay = readingByDay;
    titlesByDay = titlesByDay;
  }
  //si se añaden nuevas lecturas a la DB añadir un nuevo caso con el nuevo titulo para que se muestre
  //ademmas recordar añadir nueva imagen de nueva lectura como BannerX
  //donde X es el numero nuevo, hasta el 24/08/2021 este numero corresponde a 5
  String nombreLectura(int id, String name) {
    if (id == 0) {
      name = "Amor propio";
      return name;
    }
    if (id == 1) {
      name = "Resignificando mi identidad";
      return name;
    }
    if (id == 2) {
      name = "El valor de la integridad";
      return name;
    }
    if (id == 3) {
      name = "Perdonar es ganar libertad";
      return name;
    }
    if (id == 4) {
      name = "Creencias limitantes en las mujeres";
      return name;
    }
    if (id == 5) {
      name = "Equilibrar las cargas";
      return name;
    } else
      name = "Amor propio";
    return name;
  }

  // ignore: missing_return
  Future<Lectura> getLecturas(int index) async {
    var nombre;
    var n = nombreLectura(index, nombre);

    http.Response response =
        await http.get(Uri.http(ip, 'api/readingPlans/$n'));

    Map<String, dynamic> usersData =
        new Map<String, dynamic>.from(json.decode(response.body));

    id = usersData['data']["_id"];
    nameReadingPlan = usersData['data']["nameReadingPlan"];
    introduction = usersData['data']["introduction"];
    var tagObjsJson = jsonDecode(response.body)['data']["readingByDay"] as List;
    List<LecturasDiarias> tagObjs = tagObjsJson
        .map((tagJson) => LecturasDiarias.fromJson(tagJson))
        .toList();
    readingByDay = tagObjs;
    var tagObjsJson2 = jsonDecode(response.body)['data']["titlesByDay"] as List;
    List<TitulosDiarios> tagObjs2 = tagObjsJson2
        .map((tagJson2) => TitulosDiarios.fromJson(tagJson2))
        .toList();
    titlesByDay = tagObjs2;
    //print(titlesByDay[0].titulo);
    //print(tagObjs[0].reading);
  }
}

class LecturasDiarias {
  String id;
  String reading;

  LecturasDiarias(this.id, this.reading);

  factory LecturasDiarias.fromJson(dynamic json) {
    return LecturasDiarias(json['_id'] as String, json['reading'] as String);
  }

  @override
  String toString() {
    return '{ ${this.id}, ${this.reading} }';
  }
}

class TitulosDiarios {
  String id;
  String titulo;

  TitulosDiarios(this.id, this.titulo);

  factory TitulosDiarios.fromJson(dynamic json) {
    return TitulosDiarios(json['_id'] as String, json['title'] as String);
  }

  @override
  String toString() {
    return '{ ${this.id}, ${this.titulo} }';
  }
}
