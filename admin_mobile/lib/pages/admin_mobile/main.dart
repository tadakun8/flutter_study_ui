import 'package:admin_mobile/pages/admin_mobile/components/post_list.dart';
import 'package:flutter/material.dart';

import 'components/side_navigation.dart';

class AdminMobilePage extends StatelessWidget {
  const AdminMobilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const <Widget>[
          SideNavigation(),
          Expanded(
            child: PostList(),
          ),
        ],
      ),
    );
  }
}
