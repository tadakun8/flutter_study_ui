import 'package:admin_mobile/pages/components/side_navigation.dart';
import 'package:flutter/material.dart';

class AdminMobilePage extends StatelessWidget {
  const AdminMobilePage({Key? key}) : super(key: key);

  // const AdminMobilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const <Widget>[SideNavigation()],
      ),
    );
  }
}
