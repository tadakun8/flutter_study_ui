import 'package:flutter/material.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  late ScrollController _scrollController;
  bool _isShow = false;
  int _currentIndex = 0;
  final double itemWidth = 80.0;
  var servantList = [
    "Savar",
    "Archer",
    "Lancer",
    "Rider",
    "Caster",
    "Assassin",
    "Berserker",
    "Ruler",
    "Avenger",
    "Alterego",
    "Mooncancer",
    "Savar",
    "Archer",
    "Lancer",
    "Rider",
    "Caster",
    "Assassin",
    "Berserker",
    "Ruler",
    "Avenger",
    "Alterego",
    "Mooncancer"
  ];

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
                  'そろそろスクロールが終わるよ',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ListView.builder(
              controller: _scrollController,
              itemCount: 22,
              itemBuilder: (BuildContext context, int position) {
                return SizedBox(
                  height: itemWidth,
                  child: ListTile(
                    title: Text(servantList[position]),
                    subtitle: const Text('これはサンプルです'),
                    leading: const Icon(Icons.light),
                    trailing: const Icon(Icons.menu),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.keyboard_arrow_up),
            label: 'UP',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.keyboard_arrow_down),
            label: 'DOWN',
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            _scrollController.animateTo(
              _scrollController.offset - itemWidth,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
          if (index == 1) {
            _scrollController.animateTo(
              _scrollController.offset + itemWidth,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
      ),
    );
  }
}
