import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Users {
  String name;
  String username = "";
  String password = "";
  String email;
  String testResults;
  List usersData;
  Map<String, dynamic> validationLog;
  List<Users> user = [];
  http.Response response;

  Users(String name, String username, String password, String email,
      String testResults) {
    this.name = name;
    this.username = username;
    this.password = password;
    this.email = email;
    this.testResults = testResults;
  }

  //Registrar un usuario
  postUser(String name, String password, String username, String email,
      String testResults) async {
    http.Response response = await http
        .post(Uri.http('10.0.2.2:8000', '/api/users/register'), body: {
      'username': name,
      'name': name,
      'password': password,
      'confirmPassword': password,
      'email': email,
      'testResults': testResults
    });
    print(response.body);
  }

  //Obtener listado de usuarios
  getUsers() async {
    http.Response response =
        await http.get(Uri.http('10.0.2.2:8000', '/api/users'));
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    this.usersData = jsonResponse['data'];
    for (int i = 0; i < this.usersData.length; i++) {
      String name = this.usersData[i]["name"];
      String username = this.usersData[i]["username"];
      String password = this.usersData[i]["password"];
      String email = this.usersData[i]["email"];
      String testResults = this.usersData[i]["testResults"];
      Users userNew = new Users(name, username, password, email, testResults);
      this.user.add(userNew);
    }
  }

  //Entregar listado de usuarios
  List<Users> getListUsers() {
    return this.user;
  }

  //Login de usuario
  Future login(String username, String password) async {
    http.Response response =
        await http.post(Uri.http('10.0.2.2:8000', '/api/users/login'), body: {
      'username': username,
      'password': password,
    });
    Map<String, dynamic> jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    this.validationLog = jsonResponse;
  }

  //Obtener validaciones de login
  Map<String, dynamic> getValidation() {
    return this.validationLog;
  }
}
