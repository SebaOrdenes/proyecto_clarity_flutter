import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/Especialista.dart';
import 'dart:convert';

import 'package:flutter_auth/models/SesionOTO.dart';
import 'package:flutter_auth/models/Users.dart';

class SesionOTOService {
  static SesionOTO sesionOTOS;

  //Genera un sesión 1-1
  static setSesionOTOService(
      String date, String hour, Especialista especialista, Users user) {
    sesionOTOS = new SesionOTO(date, hour, especialista, user);
  }
}
