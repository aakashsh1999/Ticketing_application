import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterAuthentication {
  void createUser(String name, String email, String password) async {
    var url = "http://13.233.182.19:3002/register";

    try {
      var response = await http.post(Uri.parse(url),
          body: jsonEncode(<String, String>{
            "name": name,
            "email": email,
            "password": password,
          }),
          headers: <String, String>{
            'Content-Type': 'application/json',
            "Accept": "application/json",
          });
      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
      } else {
        print('Nhi Chala');
      }
    } catch (err) {
      print(err);
    }
  }
}
