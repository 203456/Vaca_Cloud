import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl = 'http://3.12.155.9/api/v1/animal/';

class BaseClient {
  final String token;
  BaseClient(this.token);
  var client = http.Client();
  //GET
  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);

    var response = await client.get(url, headers: {
      'Authorization': 'Token $token',
    });
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);

    var response = await client.post(url,
        body: jsonEncode(<String, String>{
          'title': 'title',
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200) {
      return response.body;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }
}
