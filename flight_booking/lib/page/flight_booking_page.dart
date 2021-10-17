import 'package:flight_booking/const.dart';
import 'package:flight_booking/page/components/flight_info.dart';
import 'package:flutter/material.dart';

class FlightBookingPage extends StatelessWidget {
  const FlightBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(Icons.navigate_before),
        backgroundColor: kColorPrimary,
      ),
      body: Column(
        children: const [
          FlightInfo(),
        ],
      ),
    );
  }
}
