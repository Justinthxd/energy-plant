import 'package:energy_builder/design/levels/level_1/provider.dart';
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
    final provider = context.watch<Level1Provider>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.green.withOpacity(0.2),
              Colors.blue.withOpacity(0.2),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 50),
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
      ),
    );
  }
}
