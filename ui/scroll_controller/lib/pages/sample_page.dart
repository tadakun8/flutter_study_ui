import 'package:flutter/material.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 300),
        child: ListView.builder(
          itemCount: 50,
          itemBuilder: (BuildContext context, int position) {
            return ListTile(
              title: Text('サンプル'),
              subtitle: Text('これはサンプルです'),
              leading: Icon(Icons.light),
              trailing: Icon(Icons.menu),
            );
          },
        ),
      ),
    );
  }
}
