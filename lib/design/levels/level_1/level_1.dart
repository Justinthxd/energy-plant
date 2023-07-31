// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:energy_builder/bloc/level_bloc/level_bloc.dart';
import 'package:energy_builder/data/models/plant.dart';
import 'package:flutter/material.dart';

import 'package:energy_builder/data/constants/constants.dart';
import 'package:energy_builder/design/widgets/plant/square.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Level1 extends StatefulWidget {
  const Level1({
    Key? key,
  }) : super(key: key);

  @override
  State<Level1> createState() => _Level1State();
}

class _Level1State extends State<Level1> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<LevelBloc, LevelState>(
      listener: (context, state) {},
      child: BlocBuilder<LevelBloc, LevelState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: backgroundColor,
            body: Column(
              children: [
                const SizedBox(height: 50),
                // Panel(
                //   energy: provider.energy,
                //   targetEnergy: provider.targetEnergy,
                //   money: provider.money,
                // ),
                const SizedBox(height: 20),
                Expanded(
                  child: Center(
                    child: Container(
                      height: size.height * 0.5,
                      decoration: const BoxDecoration(),
                      child: GridView.builder(
                        padding: const EdgeInsets.all(15),
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                        ),
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          return const Square(plant: PlantModel());
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
