import 'package:energy_builder/data/constants/constants.dart';
import 'package:energy_builder/design/levels/provider/provider.dart';
import 'package:energy_builder/design/widgets/option_panel.dart';
import 'package:energy_builder/design/widgets/panel.dart';
import 'package:energy_builder/design/widgets/plant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Level1 extends StatefulWidget {
  const Level1({super.key});

  @override
  State<Level1> createState() => _Level1State();
}

class _Level1State extends State<Level1> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = context.watch<LevelProvider>();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 5),
          Panel(
            energy: provider.energy,
            targetEnergy: provider.targetEnergy,
            money: provider.money,
          ),
          const SizedBox(height: 20),
          Container(
            height: size.height * 0.5,
            decoration: const BoxDecoration(),
            child: GridView.builder(
              padding: const EdgeInsets.all(15),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
              ),
              itemCount: provider.plants.length,
              itemBuilder: (context, index) {
                final plant = provider.plants[index];
                return WidgetPlant(plant: plant);
              },
            ),
          ),
          const SizedBox(height: 20),
          const OptionPanel(),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
