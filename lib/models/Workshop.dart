import 'Especialista.dart';

class Workshop {
  String id;
  String title;
  String description;
  int totalCapacity;
  String hour;
  String idCollaborator;
  List<dynamic> participants;
  Especialista especialista;

  Workshop(
      String id,
      String title,
      String description,
      int totalCapacity,
      String hour,
      String idCollaborator,
      List<dynamic> participants,
      Especialista especialista) {
    this.id = id;
    this.title = title;
    this.description = description;
    this.totalCapacity = totalCapacity;
    this.hour = hour;
    this.idCollaborator = idCollaborator;
    this.participants = participants;
    this.especialista = especialista;
  }
}
