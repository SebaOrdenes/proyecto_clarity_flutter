import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';

class Users {
  static String id;
  static String name;
  static String username = "";
  static String email;
  static List<Map<String, dynamic>> testResults;
  static int categoryInitialTest;
  static int scoreInitialTest;
  static int membership;

  Map<String, dynamic> validationLog;
  List<Users> users = [];
  SharedPreferences
      preferences; //Preferencias para mantener el usuario guardado

  Users(
      String nombre,
      String nombreUsuaria,
      String correo,
      List<Map<String, dynamic>> resultadoTest,
      int categoriaTestInicial,
      int puntajeTestInicial,
      int membresia) {
    name = nombre;
    username = nombreUsuaria;
    email = correo;
    testResults = resultadoTest;
    categoryInitialTest = categoriaTestInicial;
    scoreInitialTest = puntajeTestInicial;
    membership = membresia;
  }

  setId(String newId) {
    id = newId;
  }

  static String getName() {
    return name;
  }

  //Registrar un usuario
  postUser(String name, String password, String username, String email,
      String testResults) async {
    http.Response response = await http
        .post(Uri.http('10.0.2.2:8000', '/api/users/register'), body: {
      'name': name,
      'password': password,
      'confirmPassword': password,
      'email': email,
      'testResults': testResults,
      'username': username,
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
      String name = usersData[i]["name"];
      String username = usersData[i]["username"];
      String email = usersData[i]["email"];
      int categoryInitialTest = usersData[i]["categoryInitialTest"];
      int scoreInitialTest = usersData[i]["ScoreInitialTest"];
      int membership = usersData[i]["membership"];

      List<Map<String, dynamic>> testResults = usersData[i]["testResults"];
      Users userNew = new Users(name, username, email, testResults,
          categoryInitialTest, scoreInitialTest, membership);
      this.users.add(userNew);
    }
  }

  //Entregar listado de usuarios
  List<Users> getListUsers() {
    return this.users;
  }

  //Obtener validaciones de login
  Map<String, dynamic> getValidation() {
    return this.validationLog;
  }

  void getUserById(String id) async {
    http.Response response =
        await http.get(Uri.http('10.0.2.2:8000', '/api/$id'));
  }

  //Modifica la variable resultadoTest
  static Future<List<dynamic>> getResultadoTest(String typeTest) async {
    http.Response response =
        await http.get(Uri.http('10.0.2.2:8000', '/api/users/$id/$typeTest'));
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    List resultadoTest = jsonResponse['data'];
    print(resultadoTest);
    return resultadoTest;
  }

  Future<void> mostrarDatosGuardados() async {
    preferences = await SharedPreferences.getInstance();
    id = await preferences.getString('idUser');
    name = await preferences.getString('name');
    print(id);
  }
}
