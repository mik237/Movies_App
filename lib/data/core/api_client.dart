import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:movies_app/data/core/api_constants.dart';

class ApiClient {
  final Client client;

  ApiClient({required this.client});

  dynamic get(String path) async {
    final response = await client.get(Uri.parse("${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}"),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
