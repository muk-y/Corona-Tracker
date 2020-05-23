import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;

class Auth {
  Auth._privateConstructor();

  static final Auth shared = Auth._privateConstructor();

  factory Auth() {
    return shared;
  }

  Future<dynamic> request(String url) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load');
    }
  }

  // Future<List<dynamic>> requestCollection(String url) async {
  //   final response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     var countries = json.decode(response.body);
  //     return json.decode(response.body);
  //   } else {
  //     throw Exception('Failed to load');
  //   }
  // }

}
