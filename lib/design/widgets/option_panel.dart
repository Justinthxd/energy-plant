import 'package:energy_builder/design/widgets/plant_option.dart';
import 'package:flutter/material.dart';

import '../../data/models/plant.dart';

class OptionPanel extends StatelessWidget {
  const OptionPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      decoration: const BoxDecoration(),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PlantOption(type: PlantType.hydroPlant),
          PlantOption(type: PlantType.solarPlant),
          PlantOption(type: PlantType.electricPlant),
        ],
      ),
    );
  }
}
