import 'package:box_constraints/components/column_expanded_page.dart';
import 'package:box_constraints/components/column_listview_page.dart';
import 'package:box_constraints/components/sample_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ColumnExpandedPage(),
    );
  }
}
