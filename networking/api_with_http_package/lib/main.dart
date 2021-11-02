import 'package:api_with_http_package/components/album_list.dart';
import 'package:api_with_http_package/model/album_list.dart';
import 'package:api_with_http_package/shared/api_client.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<AlbumList> albumList;

  @override
  void initState() {
    super.initState();
    albumList = apiClient.getAlbumList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: FutureBuilder<AlbumList>(
                future: albumList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return AlbumListWidget(
                        albumList: snapshot.data!.albumList!);
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
      ),
    );
  }
}
