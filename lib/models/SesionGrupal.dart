import 'Especialista.dart';

class SesionGrupal {
  String id;
  String topic;
  int totalCapacity;
  String hour;
  Especialista especialista;
  int numerSession;
  int currentCapacity;
  List<dynamic> participants;

  SesionGrupal(
      String id,
      String topic,
      int totalCapacity,
      String hour,
      Especialista especialista,
      int numerSession,
      int currentCapacity,
      List<dynamic> participants) {
    this.id = id;
    this.topic = topic;
    this.totalCapacity = totalCapacity;
    this.hour = hour;
    this.especialista = especialista;
    this.numerSession = numerSession;
    this.currentCapacity = currentCapacity;
    this.participants = participants;
  }
}
