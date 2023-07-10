import 'package:energy_builder/design/widgets/plant/plant.dart';
import 'package:flutter/material.dart';

import 'package:energy_builder/data/models/plant.dart';
import 'package:energy_builder/design/widgets/plant/empty.dart';

class Square extends StatelessWidget {
  const Square({
    Key? key,
    required this.plant,
  }) : super(key: key);

  final PlantModel plant;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      child: plant.isActive ? WidgetPlant(plant: plant) : Empty(plant: plant),
    );
  }
}
