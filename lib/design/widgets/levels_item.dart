// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:energy_builder/data/dictionary/dictionary.dart';
import 'package:energy_builder/data/models/plant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:energy_builder/data/models/level.dart';
import 'package:provider/provider.dart';

import '../levels/provider/provider.dart';

class LevelsItem extends StatelessWidget {
  const LevelsItem({
    Key? key,
    required this.level,
  }) : super(key: key);

  final Level level;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LevelProvider>();
    return ListTile(
      splashColor: getDifficultyColor(level.difficulty).withOpacity(0.06),
      onTap: () {
        context.goNamed(level.push);
        provider.setPlants = List.generate(
          level.plants,
          (index) => PlantModel(id: index),
        );
        provider.setTargetEnergy = level.targetEnergy;
        provider.setMoney = level.money;
        provider.setTime = level.time;
      },
      title: Text(
        'Level ${level.id + 1}',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        getDifficultyName(level.difficulty),
        style: const TextStyle(
          color: Colors.white70,
        ),
      ),
      leading: Icon(
        Icons.bolt,
        size: 30,
        color: getDifficultyColor(level.difficulty),
      ),
      trailing: const Icon(
        Icons.play_arrow_rounded,
        size: 30,
        color: Colors.white70,
      ),
    );
  }
}
