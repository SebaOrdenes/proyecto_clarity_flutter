import 'Especialista.dart';
import 'Users.dart';

class SesionOTO {
  String id;
  String date;
  String hour;
  Especialista especialista;

  SesionOTO(String id, String date, String hour, Especialista especialista) {
    this.id = id;
    this.date = date;
    this.hour = hour;
    this.especialista = especialista;
  }
}
