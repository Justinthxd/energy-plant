// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:energy_builder/data/dictionary/dictionary.dart';
import 'package:energy_builder/data/models/plant.dart';
import 'package:energy_builder/design/levels/provider/provider.dart';

class PlantSelectorItem extends StatelessWidget {
  const PlantSelectorItem({
    Key? key,
    required this.plant,
    required this.type,
  }) : super(key: key);

  final PlantModel plant;
  final PlantType type;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LevelProvider>();
    return Container(
      padding: const EdgeInsets.all(5),
      child: IconButton(
        onPressed: () {
          provider.activatePlant(plant, type);
        },
        icon: Icon(
          getIcon(type),
          size: 40,
          color: getColor(type),
        ),
      ),
    );
  }
}
