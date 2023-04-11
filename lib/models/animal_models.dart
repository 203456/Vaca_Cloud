import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl = 'http://3.12.155.9/api/v1/animal/by_owner/';

class BaseClient {
  final String Token;
  final String userId;
  BaseClient(this.Token, this.userId);
  var client = http.Client();
  //GET
  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + userId + api);

    var response = await client.get(url, headers: {
      'Authorization': 'Token $Token',
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
      print(decodedResponse['next']);
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    print(url);
    var _payload = json.encode(object);
    print(object);
    var _headers = {'Content-Type': 'application/json'};

    var response = await client.post(url,
        body: jsonEncode(<String, String>{
          'title': 'title',
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    print(response);
    if (response.statusCode == 200) {
      print(response.statusCode);
      return response.body;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }
}
