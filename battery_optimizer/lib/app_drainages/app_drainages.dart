import 'package:battery_optimizer/const.dart';
import 'package:flutter/material.dart';

class _HorizontalBorder extends StatelessWidget {
  const _HorizontalBorder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.grey[200],
    );
  }
}

class _AppColumn extends StatelessWidget {
  // アプリケーションの名前
  final String name;
  // アプリケーションのアイコン
  final Icon icon;
  // アプリケーションが使用している電力比率
  final String percentage;

  const _AppColumn({
    Key? key,
    required this.name,
    required this.icon,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(
        name,
        style: const TextStyle(color: kColorText),
      ),
      trailing: Text(
        percentage,
        style: const TextStyle(color: kColorText),
      ),
    );
  }
}

class AppsDrainage extends StatelessWidget {
  const AppsDrainage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          // リストの先頭
          // 多くの場合icon
          // ClipOval() wedgetをくり抜く　この大きさに沿ってくり抜くので、子が長方形なら楕円形になる
          leading: ClipOval(
            child: Container(
              color: kColorPurple,
              child: const Icon(
                Icons.apps,
                color: Colors.white,
              ),
            ),
          ),
          title: const Text(
            'Apps Drainage',
            style: TextStyle(color: kColorTitle),
          ),
          subtitle: const Text(
            'Show the most draining evergy application',
            style: TextStyle(color: kColorText),
          ),
        ),
        Material(
          color: Colors.white,
          elevation: kElevation,
          borderRadius: BorderRadius.circular(16),
          child: Column(
            children: const [
              _AppColumn(
                name: 'SMSApp',
                icon: Icon(
                  Icons.sms,
                  color: Colors.indigo,
                ),
                percentage: '75%',
              ),
              _HorizontalBorder(),
              _AppColumn(
                name: 'MovieApp',
                icon: Icon(
                  Icons.live_tv,
                  color: Colors.red,
                ),
                percentage: '60%',
              ),
              _HorizontalBorder(),
              _AppColumn(
                name: 'MapApp',
                icon: Icon(
                  Icons.map,
                  color: Colors.green,
                ),
                percentage: '35%',
              ),
              _HorizontalBorder(),
              _AppColumn(
                name: 'ShoppingApp',
                icon: Icon(
                  Icons.local_grocery_store,
                  color: Colors.orange,
                ),
                percentage: '35%',
              ),
              _HorizontalBorder(),
              _AppColumn(
                name: 'TrainApp',
                icon: Icon(
                  Icons.train,
                  color: Colors.black,
                ),
                percentage: '15%',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
