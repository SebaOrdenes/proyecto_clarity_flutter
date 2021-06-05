import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Users {
  String name;
  String username;
  String password;
  String email;
  List usersData;
  List<Users> user = [];
  Users(String name, String username, String password, String email) {
    this.name = name;
    this.username = username;
    this.password = password;
    this.email = email;
  }
  getUsers() async {
    http.Response response =
        await http.get(Uri.http('10.0.2.2:3000', '/api/users'));
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    this.usersData = jsonResponse['data'];
    for (int i = 0; i < this.usersData.length; i++) {
      String name = this.usersData[i]["name"];
      String username = this.usersData[i]["username"];
      String password = this.usersData[i]["password"];
      String email = this.usersData[i]["email"];
      Users userNew = new Users(name, username, password, email);
      this.user.add(userNew);
    }
  }
}
