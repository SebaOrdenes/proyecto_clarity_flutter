import 'package:http/http.dart' as http;

class RegistroService {
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
}
