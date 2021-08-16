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

    String id = jsonResponse['data']['_id'];
    String name = jsonResponse['data']['name'];
    String username = jsonResponse['data']['username'];
    String email = jsonResponse['data']['email'];
    List<Map<String, dynamic>> testResults =
        jsonResponse['data']['testResults'];
    int categoryInitialTest = jsonResponse['data']['categoryInitialTest'];
    int scoreInitialTest = jsonResponse['data']['scoreInitialTest'];
    int membership = jsonResponse['data']['membership'];

    Users user = new Users(name, username, email, testResults,
        categoryInitialTest, scoreInitialTest, membership);
    user.setId(id);
  }
}
