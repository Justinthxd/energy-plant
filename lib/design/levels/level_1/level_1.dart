import 'dart:async';

import 'package:energy_builder/data/models/plant.dart';
import 'package:energy_builder/design/levels/level_1/bloc/level1_bloc.dart';
import 'package:energy_builder/design/widgets/plant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/plant_option.dart';

class Level1 extends StatefulWidget {
  const Level1({super.key});

  @override
  State<Level1> createState() => _Level1State();
}

class _Level1State extends State<Level1> {
  Timer timer = Timer(const Duration(), () {});

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = context.watch<Level1Bloc>();
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
            IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.update_rounded,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '${bloc.state.energy} / ${bloc.state.targetEnergy}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
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
                itemCount: bloc.state.plants.length,
                itemBuilder: (context, index) {
                  final plant = bloc.state.plants[index];
                  return WidgetPlant(plant: plant);
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
