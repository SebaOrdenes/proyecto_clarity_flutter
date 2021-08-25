import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/Especialista.dart';
import 'dart:convert';

import 'package:flutter_auth/models/SesionOTO.dart';
import 'package:flutter_auth/models/Users.dart';
import 'package:http/http.dart' as http;

import 'especialistaService.dart';

class SesionOTOService {
  static SesionOTO sesionOTOS;
  static List<SesionOTO> listaSessionsOTOByUser = [];

  //Genera un sesión 1-1
  static setSesionOTOService(String id, String date, String hour,
      Especialista especialista, Users user) {
    sesionOTOS = new SesionOTO(id, date, hour, especialista);
  }

  //Obtiene la sesión 1-1 por usuario
  static getOTOSByUser() async {
    try {
      listaSessionsOTOByUser = [];
      http.Response response = await http.get(Uri.http(ip, '/api/otos'));
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> listSessionsOTO = jsonResponse['data'];
      for (Map<String, dynamic> resultado in listSessionsOTO) {
        String id = resultado["_id"];
        String idCollaborator = resultado["id_collaborator"];
        String hour = resultado["hour"];
        String username = resultado["username"];

        Especialista especialista =
            await EspecialistaService.getEspecialista(idCollaborator);

        //Si existe un especialista asignado y el usuario no se ha registrado en el workshop
        if (especialista != null && username == Users.username) {
          SesionOTO sesionOTO = new SesionOTO(id, hour, hour, especialista);
          listaSessionsOTOByUser.add(sesionOTO);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
