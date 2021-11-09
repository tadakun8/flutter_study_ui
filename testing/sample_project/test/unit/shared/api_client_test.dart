import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mock_web_server/mock_web_server.dart';
import 'package:sample_project/models/album.dart';
import 'package:sample_project/shared/api_client.dart';

void main() {
  final _server = MockWebServer(port: 8045);
  late HttpClient httpClient;

  setUp(() {
    httpClient = HttpClient('http://localhost:8045/');
    _server.start();
  });

  tearDown(() {
    _server.shutdown();
  });

  group('httpClient', () {
    test('HTTP Status is 200', () async {
      _server.enqueue(httpCode: 200, body: 'sample body');
      final response = await httpClient.get('sample');
      expect(response.statusCode, 200);
      expect(response.body, 'sample body');
    });

    test('HTTP Status is not 200', () async {
      _server.enqueue(httpCode: 500);
      expect(httpClient.get('sample'), throwsException);
    });
  });

  group('ApiClient', () {
    final apiCliet = ApiClient('http://localhost:8045/');
    test('getAlbum', () async {
      final mockResponseTemplate = {
        "userId": 1,
        "id": 1,
        "title": "quidem molestiae enim"
      };

      final mockResponseBody = json.encode(mockResponseTemplate);

      final mockResponse = MockResponse()
        ..httpCode = 200
        ..body = mockResponseBody;

      _server.enqueueResponse(mockResponse);

      final response = await apiCliet.getAlbum(1);
      expect(response, Album.fromJson(mockResponseTemplate));
    });

    test('getAlbumList', () async {
      final mockResponseTemplate = [
        {"userId": 1, "id": 1, "title": "quidem molestiae enim"},
        {"userId": 1, "id": 2, "title": "sunt qui excepturi placeat culpa"},
        {"userId": 1, "id": 3, "title": "omnis laborum odio"},
      ];

      final mockResponseBody = json.encode(mockResponseTemplate);

      final mockResponse = MockResponse()
        ..httpCode = 200
        ..body = mockResponseBody;

      _server.enqueueResponse(mockResponse);

      final response = await apiCliet.getAlbumList();
      final expectedValue =
          mockResponseTemplate.map((album) => Album.fromJson(album)).toList();
      expect(response, expectedValue);
    });
  });
}
