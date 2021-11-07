import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_project/models/album.dart';
import 'package:sample_project/shared/api_client.dart';
import 'package:sample_project/shared/const.dart' as constants;

final apiClientProvider = Provider((ref) => ApiClient(constants.apiUrl));

final albumListProvider = FutureProvider<List<Album>>((ref) async {
  final apiClient = ref.read(apiClientProvider);
  return await apiClient.getAlbumList();
});
