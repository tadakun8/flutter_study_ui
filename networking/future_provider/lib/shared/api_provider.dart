import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_provider/models/album.dart';
import 'package:future_provider/shared/api_client.dart';

final albumListProvider = FutureProvider<List<Album>>((_) async {
  return await apiClient.getAlbumList();
});
