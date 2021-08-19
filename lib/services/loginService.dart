import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/Users.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LoginService {
  //-------------- Ingreso de la usuaria --------------

  //Comprobar usuaria existente
  Future<Map<String, dynamic>> checkUser(
      String username, String password) async {
    http.Response response =
        await http.post(Uri.http(ip, '/api/users/login'), body: {
      'username': username,
      'password': password,
    });
    Map<String, dynamic> jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    Map<String, dynamic> validationLog = jsonResponse;
    return validationLog;
  }

  //Instanciando usuaria
  Future<void> newUser(String nameUser) async {
    http.Response response =
        await http.post(Uri.http(ip, '/api/users/getUserByUserName'), body: {
      'username': nameUser,
    });
    Map<String, dynamic> jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    print(jsonResponse);
    String id = jsonResponse['data']['_id'];
    String name = jsonResponse['data']["name"];
    String username = jsonResponse['data']["username"];
    String email = jsonResponse['data']["email"];
    int categoryInitialTest = jsonResponse['data']["categoryInitialTest"];
    int scoreInitialTest = jsonResponse['data']["ScoreInitialTest"];
    int categoryBiweeklyTest = jsonResponse['data']["categoryBiweeklyTest"];
    double scoreBiweeklyTest =
        jsonResponse['data']["ScoreBiweeklyTest"].toDouble();
    List<dynamic> listSesion1_1 = jsonResponse['data']["listSesion1_1"];
    List<dynamic> listGroupSession = jsonResponse['data']["listGroupSession"];
    List<dynamic> listWorkshops = jsonResponse['data']["listWorkshops"];
    int role = jsonResponse['data']["role"];
    int membership = jsonResponse['data']["membership"];

    List<Map<String, dynamic>> testResults =
        jsonResponse['data']["testResults"];
    print(jsonResponse);
    Users user = new Users(
        name,
        username,
        email,
        testResults,
        categoryInitialTest,
        scoreInitialTest,
        categoryBiweeklyTest,
        scoreBiweeklyTest,
        listSesion1_1,
        listGroupSession,
        listWorkshops,
        role,
        membership);

    user.setId(id);
  }
}
