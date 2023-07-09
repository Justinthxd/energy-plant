// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:energy_builder/data/dictionary/dictionary.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:energy_builder/data/models/level.dart';

class LevelsItem extends StatelessWidget {
  const LevelsItem({
    Key? key,
    required this.level,
  }) : super(key: key);

  final Level level;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed(level.push);
      },
      child: ListTile(
        splashColor: getDifficultyColor(level.difficulty).withOpacity(0.06),
        onTap: () {
          context.goNamed(level.push);
        },
        title: Text(
          'Level ${level.id + 1}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
        subtitle: Text(
          getDifficultyName(level.difficulty),
          style: const TextStyle(
            color: Colors.white60,
          ),
        ),
        leading: Icon(
          Icons.bolt,
          color: getDifficultyColor(level.difficulty),
        ),
        trailing: const Icon(
          Icons.play_arrow_rounded,
          size: 30,
          color: Colors.white70,
        ),
      ),
    );
  }
}
