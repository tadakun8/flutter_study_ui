import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sample_project/models/album.dart';

abstract class _BaseClient {
  Future<http.Response> get(String path);
}

class HttpClient extends _BaseClient {
  final String clientBaseUrl;

  HttpClient(this.clientBaseUrl);

  @override
  Future<http.Response> get(String path) async {
    final uri = Uri.parse(clientBaseUrl + path);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to connect to webservice');
    }
  }
}

class ApiClient extends HttpClient {
  final String baseUrl;

  ApiClient(this.baseUrl) : super(baseUrl);

  Future<Album> getAlbum(int id) async {
    final response = await super.get('albums/$id');
    return Album.fromJson(json.decode(response.body));
  }

  Future<List<Album>> getAlbumList() async {
    final response = await super.get('albums');
    List<dynamic> parsedJson = json.decode(response.body);
    return parsedJson.map((item) => Album.fromJson(item)).toList();
  }
}
