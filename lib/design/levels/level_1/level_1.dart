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
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Text(
                      'Level 1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
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
                    crossAxisCount: 3,
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
            ],
          ),
        ),
      ),
    );
  }
}
