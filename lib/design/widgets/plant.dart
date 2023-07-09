import 'package:flutter/material.dart';

import 'package:energy_builder/data/dictionary/dictionary.dart';
import 'package:energy_builder/data/models/plant.dart';
import 'package:energy_builder/design/widgets/block.dart';
import 'package:provider/provider.dart';

import '../levels/provider/provider.dart';

class WidgetPlant extends StatelessWidget {
  const WidgetPlant({
    Key? key,
    required this.plant,
  }) : super(key: key);

  final PlantModel plant;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LevelProvider>();
    return GestureDetector(
      onTap: () {
        provider.activatePlant(plant);
      },
      child: AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        child: plant.isActive
            ? Container(
                decoration: BoxDecoration(
                  color: getColor(plant.type),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black38,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Center(
                  child: plant.type == PlantType.nuclearPlant
                      ? Image.asset(
                          "assets/images/atomic.png",
                          color: Colors.white,
                          height: 65,
                        )
                      : Icon(
                          getIcon(plant.type),
                          color: Colors.white,
                          size: 60,
                        ),
                ),
              )
            : const EmptyBlock(),
      ),
    );
  }
}
