import 'package:flutter_auth/models/Especialista.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EspecialistaService {
  static List<Especialista> listaEspecialistas = [];
  static Especialista especialista;
  static bool state = false; //permite verificar si se han guardado los especia.

  getEspecialistas() async {
    http.Response response =
        await http.get(Uri.http('10.0.2.2:8000', '/api/collaborators'));
    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    List<dynamic> resultadoTest = jsonResponse['data'];

    for (Map<String, dynamic> resultado in resultadoTest) {
      String id = resultado["_id"];
      String name = resultado["name"];
      String image = "assets/images/Individual.png";
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

  static setEspecialista(Especialista esp){
    especialista = esp;
  }
}
