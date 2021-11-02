import 'dart:convert';

import 'package:api_with_http_package/model/album.dart';
import 'package:api_with_http_package/model/album_list.dart';
import 'package:http/http.dart' as http;
import 'package:api_with_http_package/shared/const/const.dart' as constants;

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

  Future<AlbumList> getAlbumList() async {
    final response = await super.get('albums');
    return AlbumList.fromJson(json.decode(response.body));
  }
}

final apiClient = _ApiClient();
