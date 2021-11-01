import 'dart:convert';

import 'package:api_with_http_package/model/album.dart';
import 'package:api_with_http_package/model/album_list.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static const apiUrl = 'https://jsonplaceholder.typicode.com/';

  static Future<AlbumList> get(String path) async {
    final uri = Uri.parse(apiUrl + path);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      // final rawList = json.decode(response.body);
      // return AlbumList.fromJson({'albumList': rawList});
      return AlbumList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to connect to webservice');
    }
  }

  static Future<Album> getAlbum(String path) async {
    final uri = Uri.parse(apiUrl + path);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      // final rawList = json.decode(response.body);
      // return AlbumList.fromJson({'albumList': rawList});
      return Album.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to connect to webservice');
    }
  }
}
