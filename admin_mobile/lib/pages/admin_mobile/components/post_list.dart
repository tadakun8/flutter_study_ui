import 'package:admin_mobile/pages/admin_mobile/components/post_header.dart';
import 'package:flutter/material.dart';

class PostList extends StatelessWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 48),
      child: Column(
        // 親Containerの高さを最大まで広げる
        mainAxisSize: MainAxisSize.max,
        children: const [
          PostsHeader(),
        ],
      ),
    );
  }
}
