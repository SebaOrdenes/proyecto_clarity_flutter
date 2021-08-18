import 'Especialista.dart';
import 'Users.dart';

class SesionOTO {
  String date;
  String hour;
  Especialista especialista;
  Users user;

  SesionOTO(String date, String hour, Especialista especialista, Users user) {
    this.date = date;
    this.hour = hour;
    this.especialista = especialista;
    this.user = user;
    
  }
}
