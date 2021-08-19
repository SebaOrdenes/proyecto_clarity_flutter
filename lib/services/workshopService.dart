import 'dart:convert';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/Especialista.dart';
import 'package:flutter_auth/models/Users.dart';
import 'package:flutter_auth/models/Workshop.dart';
import 'package:flutter_auth/services/especialistaService.dart';
import 'package:http/http.dart' as http;

class WorkshopService {
  static List<Workshop> listaWorkshop = [];
  static List<Workshop> listaWorkshopByUser = [];
  static Workshop workshop;

  getWorkshops() async {
    try {
      listaWorkshop = [];
      http.Response response = await http.get(Uri.http(ip, '/api/workshops'));
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> listWorkshop = jsonResponse['data'];

      for (Map<String, dynamic> resultado in listWorkshop) {
        String id = resultado["_id"];
        String title = resultado["title"];
        String description = resultado["description"];
        int totalCapacity = resultado["total_capacity"];
        String hour = resultado["hour"];
        String idCollaborator = resultado["id_Collaborator"];
        List<dynamic> participants = resultado["participants"];
        Especialista especialista =
            await EspecialistaService.getEspecialista(idCollaborator);

        //Si existe un especialista asignado y el usuario no se ha registrado en el workshop
        if (especialista != null &&
            participants.contains(Users.username) == false) {
          Workshop workshop = new Workshop(id, title, description,
              totalCapacity, hour, idCollaborator, participants, especialista);
          listaWorkshop.add(workshop);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  static getWorkshopsByUser() async {
    try {
      listaWorkshopByUser = [];
      http.Response response = await http.get(Uri.http(ip, '/api/workshops'));
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> listWorkshop = jsonResponse['data'];

      for (Map<String, dynamic> resultado in listWorkshop) {
        String id = resultado["_id"];
        String title = resultado["title"];
        String description = resultado["description"];
        int totalCapacity = resultado["total_capacity"];
        String hour = resultado["hour"];
        String idCollaborator = resultado["id_Collaborator"];
        List<dynamic> participants = resultado["participants"];
        Especialista especialista =
            await EspecialistaService.getEspecialista(idCollaborator);

        //Si existe un especialista asignado y el usuario no se ha registrado en el workshop
        if (especialista != null &&
            participants.contains(Users.username) != false) {
          Workshop workshop = new Workshop(id, title, description,
              totalCapacity, hour, idCollaborator, participants, especialista);
          listaWorkshopByUser.add(workshop);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  //Agregar participante al workshop solicitado
  static addParticipantWorkshop(String workshopId, String userId) async {
    try {
      http.Response response = await http.put(
        Uri.http(ip, '/api/workshops/addParticipant/$workshopId/$userId'),
        body: "",
      );
      print(response);
    } catch (e) {
      print(e);
    }
  }

  //Cambiar atributo workshop
  static setWorkshop(Workshop work) {
    workshop = work;
  }
}
