import 'dart:convert';
import 'package:http/http.dart' as http;

const baseUrl = "localhost:1111/api/v1/";

class DocscanService {
  Future<Map<String, dynamic>> signIn(String base64) async {
    const url = '${baseUrl}cin';
    final body = {
      'cin': base64,
    };

    final response = await http.post(
      Uri.parse(url),
      body: json.encode(body),
    );
    final Map<String, dynamic> data = json.decode(response.body);

    if (response.statusCode != 200) {
      if (data['error']['message'] == 'INVALID_PASSWORD') {
        throw 'Incorrect mot de passe';
      } else if (data['error']['message'] == 'EMAIL_NOT_FOUND') {
        throw 'Email non trouvé';
      } else if (data['error']['message'] ==
          'TOO_MANY_ATTEMPTS_TRY_LATER : Access to this account has been temporarily disabled due to many failed login attempts. You can immediately restore it by resetting your password or you can try again later.') {
        throw 'Nombre de tentatives trop élevé. Veuillez réessayer plus tard';
      } else {
        throw data['error']['message'];
      }
    }
    return data;
  }
}
