// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';

class Panel extends StatelessWidget {
  const Panel({
    Key? key,
    required this.energy,
    required this.targetEnergy,
    required this.money,
  }) : super(key: key);

  final int energy;
  final int targetEnergy;
  final int money;

  final TextStyle digitStyle = const TextStyle(
    color: Colors.white60,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.attach_money_rounded,
                color: Colors.green,
                size: 30,
              ),
              AnimatedDigitWidget(
                value: money,
                enableSeparator: true,
                textStyle: digitStyle,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.bolt_rounded,
                color: Colors.yellow,
                size: 30,
              ),
              AnimatedDigitWidget(
                value: energy,
                enableSeparator: true,
                textStyle: digitStyle,
                duration: const Duration(seconds: 1),
                curve: Curves.easeOut,
              ),
              Text(
                '/',
                style: digitStyle,
              ),
              AnimatedDigitWidget(
                value: targetEnergy,
                enableSeparator: true,
                textStyle: digitStyle,
                duration: const Duration(seconds: 1),
                curve: Curves.easeOut,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
