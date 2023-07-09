import 'package:energy_builder/data/models/plant.dart';
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
    PlantType.hydroPlant => const Color.fromARGB(255, 47, 145, 231),
    PlantType.windPlant => const Color.fromARGB(255, 140, 140, 140),
    PlantType.solarPlant => const Color.fromARGB(255, 249, 198, 71),
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
    PlantType.hydroPlant => 100,
    PlantType.windPlant => 125,
    PlantType.solarPlant => 150,
    PlantType.electricPlant => 200,
    PlantType.chemicalPlant => 300,
    PlantType.nuclearPlant => 600,
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
