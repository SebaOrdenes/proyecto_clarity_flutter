import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/Especialista.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EspecialistaService {
  static List<Especialista> listaEspecialistas = [];
  static Especialista especialista;
  static bool state = false; //permite verificar si se han guardado los especia.

  getEspecialistas() async {
    listaEspecialistas = [];
    http.Response response = await http.get(Uri.http(ip, '/api/collaborators'));
    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    List<dynamic> resultadoTest = jsonResponse['data'];

    for (Map<String, dynamic> resultado in resultadoTest) {
      String id = resultado["_id"];
      String name = resultado["name"];
      String image = "assets/images/Individual.png";
      if (name == "Samhyra Pinto") {
        image = "assets/images/Samhyra Pinto.jpg";
      } else if (name == "Ylyana Rodríguez") {
        image = "assets/images/Ylyana Rodríguez.jpg";
      } else if (name == "María Lourdes Latorreo") {
        image = "assets/images/María Lourdes Latorre.jpeg";
      } else if (name == "Hector Antillanca el satanico") {
        image = "assets/images/hector.png";
      }

      List<dynamic> role = resultado["role"];
      String speciality = "psicologa";
      List<dynamic> hoursUnAvailableFCIOTOS =
          resultado["hoursUnAvailableFCIOTOS"];
      List<dynamic> hoursUnAvailableFAIGS = resultado["hoursUnAvailableFAIGS"];
      List<dynamic> hoursUnAvailableFAIW = resultado["hoursUnAvailableFAIW"];
      Especialista especialista = new Especialista(
          id,
          name,
          image,
          role,
          speciality,
          hoursUnAvailableFCIOTOS,
          hoursUnAvailableFAIGS,
          hoursUnAvailableFAIW);

      listaEspecialistas.add(especialista);
    }
  }

  static Future<Especialista> getEspecialista(String idCollaborator) async {
    try {
      http.Response response = await http.get(
        Uri.http(ip, '/api/collaborators/$idCollaborator'),
      );
      print(idCollaborator);
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      Map<String, dynamic> resultado = jsonResponse['data'];
      String id = resultado["_id"];
      String name = resultado["name"];
      String image = "assets/images/Individual.png";
      if (name == "Samhyra Pinto") {
        image = "assets/images/Samhyra Pinto.jpg";
      } else if (name == "Ylyana Rodríguez") {
        image = "assets/images/Ylyana Rodríguez.jpg";
      } else if (name == "María Lourdes Latorreo") {
        image = "assets/images/María Lourdes Latorre.jpeg";
      } else if (name == "Hector Antillanca el satanico") {
        image = "assets/images/hector.png";
      }

      List<dynamic> role = resultado["role"];
      String speciality = "psicologa";
      List<dynamic> hoursUnAvailableFCIOTOS =
          resultado["hoursUnAvailableFCIOTOS"];
      List<dynamic> hoursUnAvailableFAIGS = resultado["hoursUnAvailableFAIGS"];
      List<dynamic> hoursUnAvailableFAIW = resultado["hoursUnAvailableFAIW"];
      Especialista especialista = new Especialista(
        id,
        name,
        image,
        role,
        speciality,
        hoursUnAvailableFCIOTOS,
        hoursUnAvailableFAIGS,
        hoursUnAvailableFAIW,
      );
      return especialista;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static setEspecialista(Especialista esp) {
    especialista = esp;
  }

  static updateHourOTO(String id, String date) async {
    print(date);
    //Modificando el tipo se sato para que coincida con la Base de Datos
    String auxDate = DateTime.parse(date).toUtc().toString();
    print(auxDate);
    try {
      http.Response response = await http.put(
        Uri.http('10.0.2.2:8000', '/api/collaborators/addHour/$id/0'),
        body: {
          "hourForOTOS": auxDate,
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
