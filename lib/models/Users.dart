import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';

class Users {
  String id;
  static String name;
  static String username = "";
  String password = ""; //Borrar este atributo
  static String email;
  String testResults;
  Map<String, dynamic> validationLog;
  List<Users> users = [];
  SharedPreferences
      preferences; //Preferencias para mantener el usuario guardado

  Users(String id, String nombre, String nombreUsuaria, String password,
      String correo, String testResults) {
    this.id = id;
    name = nombre;
    username = nombreUsuaria;
    this.password = password;
    email = correo;
    this.testResults = testResults;
  }

  static String getName() {
    return name;
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
  }

  //Obtener listado de usuarios
  getUsers() async {
    http.Response response =
        await http.get(Uri.http('10.0.2.2:8000', '/api/users'));
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    List usersData = jsonResponse['data'];
    for (int i = 0; i < usersData.length; i++) {
      String id = usersData[i]["_id"];
      String name = usersData[i]["name"];
      String username = usersData[i]["username"];
      String password = usersData[i]["password"];
      String email = usersData[i]["email"];
      String testResults = usersData[i]["testResults"];
      Users userNew =
          new Users(id, name, username, password, email, testResults);
      this.users.add(userNew);
    }
  }

  //Entregar listado de usuarios
  List<Users> getListUsers() {
    return this.users;
  }

  //Login de usuario
  Future login(String username, String password) async {
    /*http.Response response =
        await http.post(Uri.http('10.0.2.2:8000', '/api/users/login'), body: {
      'username': username,
      'password': password,
    });
    Map<String, dynamic> jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    this.validationLog = jsonResponse;*/
    this.validationLog = {"validation": 1};
    //guardarDatos(username, "");
  }

  //Obtener validaciones de login
  Map<String, dynamic> getValidation() {
    return this.validationLog;
  }

  void getUserById(String id) async {
    http.Response response =
        await http.get(Uri.http('10.0.2.2:8000', '/api/$id'));
  }

  Future<void> mostrarDatosGuardados() async {
    preferences = await SharedPreferences.getInstance();
    this.id = await preferences.getString('idUser');
    name = await preferences.getString('name');
    print(id);
  }
}
