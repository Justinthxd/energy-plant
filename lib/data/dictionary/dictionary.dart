import 'package:energy_builder/data/models/plant.dart';
import 'package:flutter/material.dart';

IconData getIcon(PlantType type) {
  return switch (type) {
    PlantType.hydroPlant => Icons.water_drop_rounded,
    PlantType.solarPlant => Icons.light_mode_rounded,
    PlantType.electricPlant => Icons.electric_bolt_rounded,
    PlantType.chemicalPlant => Icons.science_rounded,
    PlantType.nuclearPlant => Icons.abc,
  };
}

Color getColor(PlantType type) {
  return switch (type) {
    PlantType.hydroPlant => const Color.fromARGB(255, 2, 121, 219),
    PlantType.solarPlant => Colors.yellow,
    PlantType.electricPlant => Colors.orangeAccent,
    PlantType.chemicalPlant => Colors.purple,
    PlantType.nuclearPlant => Colors.green,
  };
}

String getName(PlantType type) {
  return switch (type) {
    PlantType.hydroPlant => 'Hydro',
    PlantType.solarPlant => 'Solar',
    PlantType.electricPlant => 'Electric',
    PlantType.chemicalPlant => 'Chemical',
    PlantType.nuclearPlant => 'Nuclear',
  };
}

int getPrice(PlantType type) {
  return switch (type) {
    PlantType.hydroPlant => 100,
    PlantType.solarPlant => 200,
    PlantType.electricPlant => 300,
    PlantType.chemicalPlant => 400,
    PlantType.nuclearPlant => 500,
  };
}
