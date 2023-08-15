import 'package:energy_builder/data/models/plant.dart';
import 'package:energy_builder/utils/keys.dart';
import 'package:flutter/material.dart';

import '../models/level.dart';

IconData getIcon(PlantType type) {
  return switch (type) {
    PlantType.hydroPlant => Icons.water_drop_rounded,
    PlantType.windPlant => Icons.air_rounded,
    PlantType.solarPlant => Icons.light_mode_rounded,
    PlantType.electricPlant => Icons.electric_bolt_rounded,
    PlantType.chemicalPlant => Icons.science_rounded,
    PlantType.nuclearPlant => Icons.abc,
  };
}

Color getColor(PlantType type) {
  return switch (type) {
    PlantType.hydroPlant => const Color.fromARGB(255, 0, 106, 199),
    PlantType.windPlant => const Color.fromARGB(255, 90, 90, 90),
    PlantType.solarPlant => const Color.fromARGB(255, 219, 158, 4),
    PlantType.electricPlant => const Color.fromARGB(255, 233, 64, 70),
    PlantType.chemicalPlant => Colors.purple,
    PlantType.nuclearPlant => const Color.fromARGB(255, 3, 85, 5),
  };
}

String getName(PlantType type) {
  return switch (type) {
    PlantType.hydroPlant => 'Hydro',
    PlantType.windPlant => 'Wind',
    PlantType.solarPlant => 'Solar',
    PlantType.electricPlant => 'Electric',
    PlantType.chemicalPlant => 'Chemical',
    PlantType.nuclearPlant => 'Nuclear',
  };
}

int getPrice(PlantType type) {
  return switch (type) {
    PlantType.hydroPlant => PlantPriceKeys.hydroPlant,
    PlantType.windPlant => PlantPriceKeys.windPlant,
    PlantType.solarPlant => PlantPriceKeys.solarPlant,
    PlantType.electricPlant => PlantPriceKeys.electricPlant,
    PlantType.chemicalPlant => PlantPriceKeys.chemicalPlant,
    PlantType.nuclearPlant => PlantPriceKeys.nuclearPlant,
  };
}

Color getDifficultyColor(Difficulty difficulty) {
  return switch (difficulty) {
    Difficulty.easy => Colors.green,
    Difficulty.medium => Colors.yellow,
    Difficulty.hard => Colors.red,
  };
}

String getDifficultyName(Difficulty difficulty) {
  return switch (difficulty) {
    Difficulty.easy => 'Easy',
    Difficulty.medium => 'Medium',
    Difficulty.hard => 'Hard',
  };
}
