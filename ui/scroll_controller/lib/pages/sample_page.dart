import 'package:flutter/material.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  late ScrollController _scrollController;
  bool _isShow = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  // スクロールを検知したときに呼ばれる処理
  void _scrollListener() {
    const threshold = 0.8;
    double positionRate =
        _scrollController.offset / _scrollController.position.maxScrollExtent;
    if (positionRate > threshold) {
      setState(() {
        _isShow = true;
      });
    }
    if (positionRate < threshold - 0.05) {
      setState(() {
        _isShow = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 300),
        child: Stack(
          children: [
            if (_isShow)
              Container(
                padding: const EdgeInsets.all(8.0),
                width: double.infinity,
                color: Colors.orange[100],
                child: const Text(
                  'To see this room\'s full history, upgrade one of our paid plans.',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ListView.builder(
              controller: _scrollController,
              itemCount: 50,
              itemBuilder: (BuildContext context, int position) {
                return const ListTile(
                  title: Text('サンプル'),
                  subtitle: Text('これはサンプルです'),
                  leading: Icon(Icons.light),
                  trailing: Icon(Icons.menu),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
