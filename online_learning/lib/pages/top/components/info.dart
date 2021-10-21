import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.blue[50],
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 150,
                child: Text('Choose from over 100,000 online video courses'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {},
                child: const Text('Browse all courses'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 32,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
