import 'package:api_with_http_package/components/album_list.dart';
import 'package:api_with_http_package/model/album.dart';
import 'package:api_with_http_package/shared/api_client.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final int id;
  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Future<Album> album;
  @override
  void initState() {
    super.initState();
    album = apiClient.getAlbum(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: FutureBuilder<Album>(
              future: album,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return AlbumWidget(album: snapshot.data!);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}
