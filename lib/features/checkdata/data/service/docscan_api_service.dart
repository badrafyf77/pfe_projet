import 'dart:convert';
import 'package:http/http.dart' as http;

const baseUrl = "http://192.168.171.1:1111/api/v1/";

class DocScanService {
  Future<Map<String, dynamic>> getCin(String base64) async {
    const url = '${baseUrl}cin';
    final body = {
      'base64': base64,
    };

    final response = await http.post(
      Uri.parse(url),
      body: json.encode(body),
    );
    final Map<String, dynamic> data = json.decode(response.body);
    return data;
  }
}
