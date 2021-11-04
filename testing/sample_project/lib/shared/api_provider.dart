import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_project/models/album.dart';
import 'package:sample_project/shared/api_client.dart';

final albumListProvider = FutureProvider<List<Album>>((_) async {
  return await apiClient.getAlbumList();
});
