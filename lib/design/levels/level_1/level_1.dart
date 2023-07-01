import 'package:energy_builder/data/models/plant.dart';
import 'package:energy_builder/design/widgets/plant.dart';
import 'package:flutter/material.dart';

import '../../widgets/plant_option.dart';

class Level1 extends StatelessWidget {
  const Level1({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(25, 25, 25, 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.bolt,
              size: 100,
              color: Colors.green,
            ),
            const SizedBox(height: 20),
            Container(
              height: size.height * 0.5,
              decoration: const BoxDecoration(),
              child: GridView.builder(
                padding: const EdgeInsets.all(0),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return WidgetPlant(plant: PlantModel());
                },
              ),
            ),
            const SizedBox(height: 20),
            // add menu to change the plant type
            Container(
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
            ),
          ],
        ),
      ),
    );
  }
}
