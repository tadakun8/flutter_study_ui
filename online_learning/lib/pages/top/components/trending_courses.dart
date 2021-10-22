import 'package:flutter/material.dart';

class TrendingCources extends StatelessWidget {
  const TrendingCources({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 32, left: 8, bottom: 8),
          child: const Text(
            'Trending Cources',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  // child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Icon(
                  //       Icons.school,
                  //       color: Colors.blue,
                  //     ),
                  //     Text('Communication Skills'),
                  //   ],
                  // ),
                  // ListTileを使えば Rowを使う必要がない
                  color: Colors.grey[100],
                  child: const ListTile(
                    leading: Icon(
                      Icons.school,
                      color: Colors.blue,
                    ),
                    trailing: Text('Communication Skills'),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  color: Colors.grey[100],
                  child: const ListTile(
                    leading: Icon(
                      Icons.school,
                      color: Colors.blue,
                    ),
                    trailing: Text('Digital Marketing 101'),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  color: Colors.grey[100],
                  child: const ListTile(
                    leading: Icon(
                      Icons.school,
                      color: Colors.blue,
                    ),
                    trailing: Text('Digital Marketing 101'),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  // ElevatedButtonは影をつける時に使用する
                  // child: ElevatedButton(
                  //   onPressed: () {},
                  //   child: const Text('View trending list'),
                  // ),
                  child: TextButton(
                    child: const Text('View trending list'),
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      // 文字の色
                      primary: Colors.white,
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
