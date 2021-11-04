import 'package:flutter_test/flutter_test.dart';
import 'package:mock_web_server/mock_web_server.dart';
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
}
