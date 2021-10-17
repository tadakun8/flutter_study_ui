import 'package:flutter/material.dart';

class FlightBookingPage extends StatelessWidget {
  const FlightBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(Icons.navigate_before),
      ),
      body: Column(
        children: const [
          Text('sample'),
        ],
      ),
    );
  }
}
