import 'dart:convert';

import 'package:future_provider/models/album.dart';
import 'package:http/http.dart' as http;
import 'package:future_provider/shared/const.dart' as constants;

abstract class _BaseClient {
  Future<http.Response> get(String path);
}

class _HttpClient extends _BaseClient {
  @override
  Future<http.Response> get(String path) async {
    final uri = Uri.parse(constants.apiUrl + path);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to connect to webservice');
    }
  }
}

class _ApiClient extends _HttpClient {
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

final apiClient = _ApiClient();
