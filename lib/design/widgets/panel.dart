import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../levels/provider/provider.dart';

class Panel extends StatelessWidget {
  const Panel({
    Key? key,
    required this.energy,
    required this.targetEnergy,
    required this.money,
  }) : super(key: key);

  final int energy;
  final int targetEnergy;
  final double money;

  final TextStyle digitStyle = const TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LevelProvider>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Level 1',
                style: TextStyle(
                  color: Colors.white24,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                provider.getTimeFormatted(),
                style: const TextStyle(
                  color: Colors.white24,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 10),
              Icon(
                provider.getTimerIsRunning
                    ? Icons.pause
                    : Icons.play_arrow_rounded,
                color: Colors.white54,
              ),
            ],
          ),
          Divider(
            height: 5,
            color: Colors.white.withOpacity(0.03),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Icon(
                Icons.bolt_rounded,
                color: Colors.yellow,
                size: 25,
              ),
              Text(
                '$energy',
                style: digitStyle,
              ),
              Text(
                '/',
                style: digitStyle.copyWith(color: Colors.white60),
              ),
              Text(
                '$targetEnergy',
                style: digitStyle.copyWith(
                  fontSize: 19,
                  color: Colors.white60,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.attach_money_rounded,
                color: Colors.green,
                size: 25,
              ),
              Text(
                '${money.round()}',
                style: digitStyle,
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const SizedBox(width: 5),
              SizedBox(
                width: 130,
                child: TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  tween: Tween(
                    begin: 0,
                    end: energy / targetEnergy,
                  ),
                  builder: (context, value, _) => LinearProgressIndicator(
                    color: Colors.yellow,
                    backgroundColor: Colors.black26,
                    value: value,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
