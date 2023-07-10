import 'package:energy_builder/design/widgets/plant_option.dart';
import 'package:flutter/material.dart';

import '../../../data/models/plant.dart';

class OptionPanel extends StatelessWidget {
  const OptionPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            children: const [
              PlantOption(type: PlantType.hydroPlant),
              PlantOption(type: PlantType.windPlant),
              PlantOption(type: PlantType.solarPlant),
              PlantOption(type: PlantType.electricPlant),
              PlantOption(type: PlantType.chemicalPlant),
              PlantOption(type: PlantType.nuclearPlant),
            ],
          ),
          Center(
            child: Row(
              children: [
                SizedBox(width: 10),
                Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white30,
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white30,
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
