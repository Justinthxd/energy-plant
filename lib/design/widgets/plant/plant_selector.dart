import 'dart:ui';

import 'package:energy_builder/data/models/plant.dart';
import 'package:energy_builder/design/widgets/plant/plant_selector_item.dart';
import 'package:flutter/material.dart';

import 'selector_divider.dart';

plantSelector(PlantModel plant) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                PlantSelectorItem(
                  plant: plant,
                  type: PlantType.hydroPlant,
                ),
                divider(),
                PlantSelectorItem(
                  plant: plant,
                  type: PlantType.windPlant,
                ),
                divider(),
                PlantSelectorItem(
                  plant: plant,
                  type: PlantType.solarPlant,
                ),
              ],
            ),
            Container(
              height: 1,
              width: 235,
              color: Colors.white10,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                PlantSelectorItem(
                  plant: plant,
                  type: PlantType.electricPlant,
                ),
                divider(),
                PlantSelectorItem(
                  plant: plant,
                  type: PlantType.chemicalPlant,
                ),
                divider(),
                PlantSelectorItem(
                  plant: plant,
                  type: PlantType.nuclearPlant,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
