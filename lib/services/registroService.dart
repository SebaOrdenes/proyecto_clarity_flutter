import 'dart:convert';

import 'package:flutter_auth/constants.dart';
import 'package:http/http.dart' as http;

class RegistroService {

  Future< Map<String, dynamic>>  postUser(String name, String password, String username, String email,
      String testResults) async {
    // ignore: unused_local_variable
    http.Response response = await http.post(
      Uri.http(ip, '/api/users/register'),
      body: {
        'name': name,
        'password': password,
        'confirmPassword': password,
        'email': email,
        'testResults': testResults,
        'username': username,
      },
    );
    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    return  jsonResponse;
  }
}
