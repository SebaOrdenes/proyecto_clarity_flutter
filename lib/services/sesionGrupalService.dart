import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/Especialista.dart';
import 'package:flutter_auth/models/SesionGrupal.dart';
import 'package:flutter_auth/models/Users.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'especialistaService.dart';

class SesionGrupalService {
  static List<SesionGrupal> listaSesionGrupal = [];
  static List<SesionGrupal> listaSesionByUserGrupal = [];
  static SesionGrupal sesionGrupal;

  getSesionesGrupales() async {
    try {
      listaSesionGrupal = [];
      http.Response response =
          await http.get(Uri.http(ip, '/api/groupSession'));
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> listSesionesGrupales = jsonResponse['data'];

      for (Map<String, dynamic> resultado in listSesionesGrupales) {
        String id = resultado["_id"];
        int currentCapacity = resultado["current_capacity"];
        String topic = resultado["topic"];
        int totalCapacity = resultado["total_capacity"];
        String hour = resultado["hour"];
        String idCollaborator = resultado["id_Collaborator"];
        int numberSession = resultado["numberOfSessions"];
        Especialista especialista =
            await EspecialistaService.getEspecialista(idCollaborator);
        List<dynamic> participants = resultado["participants"];

        //Si existe un especialista asignado y el usuario no se ha registrado en el workshop
        if (especialista != null &&
            participants.contains(Users.username) == false) {
          SesionGrupal sesionGrupal = new SesionGrupal(id, topic, totalCapacity,
              hour, especialista, numberSession, currentCapacity, participants);
          listaSesionGrupal.add(sesionGrupal);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  static getSesionesByUserGrupales() async {
    try {
      listaSesionByUserGrupal = [];
      http.Response response =
          await http.get(Uri.http(ip, '/api/groupSession'));
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> listSesionesGrupales = jsonResponse['data'];

      for (Map<String, dynamic> resultado in listSesionesGrupales) {
        String id = resultado["_id"];
        int currentCapacity = resultado["current_capacity"];
        String topic = resultado["topic"];
        int totalCapacity = resultado["total_capacity"];
        String hour = resultado["hour"];
        String idCollaborator = resultado["id_Collaborator"];
        int numberSession = resultado["numberOfSessions"];
        Especialista especialista =
            await EspecialistaService.getEspecialista(idCollaborator);
        List<dynamic> participants = resultado["participants"];

        //Si existe un especialista asignado y el usuario no se ha registrado en el workshop
        if (especialista != null &&
            participants.contains(Users.username) != false) {
          SesionGrupal sesionGrupal = new SesionGrupal(id, topic, totalCapacity,
              hour, especialista, numberSession, currentCapacity, participants);
          listaSesionByUserGrupal.add(sesionGrupal);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  //Agregar participante al workshop solicitado
  static addParticipanSesionGrupal(String sesionGrupaId, String userId) async {
    try {
      http.Response response = await http.put(
        Uri.http(ip, '/api/groupSession/addParticipant/$sesionGrupaId/$userId'),
        body: "",
      );
      print(response);
    } catch (e) {
      print(e);
    }
  }

  //Cambiar atributo workshop
  static setSesionGrupal(SesionGrupal sesion) {
    sesionGrupal = sesion;
  }
}
