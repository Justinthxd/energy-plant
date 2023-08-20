import 'package:energy_builder/design/bloc/level_bloc/level_bloc.dart';
import 'package:flutter/material.dart';

import 'package:energy_builder/data/dictionary/dictionary.dart';
import 'package:energy_builder/data/models/plant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlantSelectorItem extends StatelessWidget {
  const PlantSelectorItem({
    Key? key,
    required this.plant,
    required this.type,
  }) : super(key: key);

  final PlantModel plant;
  final PlantType type;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        context.read<LevelBloc>().add(ActivatePlantEvent(plant.id, type));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: type == PlantType.nuclearPlant
                  ? Image.asset(
                      "assets/images/atomic.png",
                      color: getColor(type),
                      height: 30,
                    )
                  : Icon(
                      getIcon(type),
                      color: type == PlantType.windPlant
                          ? Colors.white
                          : getColor(type),
                      size: 35,
                    ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                // color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.attach_money_rounded,
                    size: 17,
                    color: Colors.green,
                  ),
                  Text(
                    getPrice(type).toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
