// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:energy_builder/data/models/level.dart';
import 'package:flutter/material.dart';

import 'package:energy_builder/design/widgets/plant/empty.dart';
import 'package:energy_builder/design/widgets/plant/plant.dart';

class Square extends StatelessWidget {
  const Square({
    Key? key,
    required this.id,
    required this.level,
  }) : super(key: key);

  final int id;
  final Level level;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      child: level.plants[id].isActive
          ? WidgetPlant(
              plant: level.plants[id],
            )
          : Empty(
              plant: level.plants[id],
            ),
    );
  }
}
