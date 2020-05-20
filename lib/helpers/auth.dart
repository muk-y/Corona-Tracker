import 'dart:convert';
import 'package:http/http.dart' as http;

class Auth {
  Auth._privateConstructor();

  static final Auth shared = Auth._privateConstructor();

  factory Auth() {
    return shared;
  }

  Future<Map> request(String url) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
