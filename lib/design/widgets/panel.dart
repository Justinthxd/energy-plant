// ignore_for_file: public_member_api_docs, sort_constructors_first
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
              Text(
                '$money',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
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
              Text(
                '$energy / $targetEnergy',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
