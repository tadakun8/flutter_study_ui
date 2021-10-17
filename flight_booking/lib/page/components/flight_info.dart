import 'dart:math';

import 'package:flight_booking/const.dart';
import 'package:flutter/material.dart';

class _AirportName extends StatelessWidget {
  final String shortName;
  final String fullName;
  const _AirportName({
    Key? key,
    required this.shortName,
    required this.fullName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          shortName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 32,
          ),
        ),
        Text(
          fullName,
          style: TextStyle(
            color: kColorFlightText.withOpacity(0.5),
          ),
        )
      ],
    );
  }
}

class _FlightIcon extends StatelessWidget {
  const _FlightIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        border: Border.all(
          color: kColorFlightIcon,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(52 / 2),
      ),
      child: Transform.rotate(
        angle: pi / 2,
        child: const Icon(
          Icons.flight,
          color: kColorFlightIcon,
          size: 28,
        ),
      ),
    );
  }
}

class FlightInfo extends StatelessWidget {
  const FlightInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: kColorPrimary,
          elevation: 24,
          shadowColor: kColorPrimary,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 32,
              left: 24,
              right: 24,
            ),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _AirportName(
                    shortName: 'DHN',
                    fullName: 'Dhaka',
                  ),
                  _FlightIcon(),
                  _AirportName(
                    shortName: 'LDN',
                    fullName: 'London',
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Monday, 18 May, 2020',
                  style: TextStyle(
                    color: kColorFlightText.withOpacity(0.5),
                  ),
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }
}
