import 'package:flutter/material.dart';
import 'package:online_learning/const.dart';

class _FigmaLogo extends StatelessWidget {
  final double size;
  const _FigmaLogo({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: size,
        height: size,
        child: Image.network(figmaLogoUrl),
        padding: const EdgeInsets.all(8),
        color: Colors.black,
      ),
    );
  }
}

class Featured extends StatelessWidget {
  const Featured({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 32, left: 8),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Featured',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 32,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.navigate_before),
                      SizedBox(
                        width: 180,
                        child: Column(
                          children: const [
                            Text(
                              'Figma: Solid Foundations',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'The most complete beginner to advanced guide',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: _FigmaLogo(
                size: 48,
              ),
            )
          ],
        )
      ],
    );
  }
}
