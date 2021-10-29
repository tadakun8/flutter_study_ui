import 'dart:convert';

import 'package:api_with_http_package/model/api_response.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static const apiUrl = 'http://localhost:3030/';

  static Future<ApiResponse> get(String path) async {
    final uri = Uri.parse(apiUrl + path);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return ApiResponse.fromJson(json.decoder.convert(response.body));
    } else {
      throw Exception('Failed to connect to webservice');
    }
  }
}
