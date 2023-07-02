import 'package:energy_builder/data/models/plant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/dictionary/dictionary.dart';
import '../levels/level_1/provider.dart';

class PlantOption extends StatelessWidget {
  const PlantOption({super.key, required this.type});

  final PlantType type;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<Level1Provider>();
    return Column(
      children: [
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: provider.currentPlantType == type
                ? getColor(type)
                : Colors.transparent,
          ),
          onPressed: () {
            provider.setCurrentPlantType = type;
          },
          icon: Icon(
            getIcon(type),
            color: provider.currentPlantType == type
                ? Colors.white
                : getColor(type),
          ),
        ),
        Row(
          children: [
            Text(
              '${getPrice(type)}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const Icon(
              Icons.attach_money_rounded,
              color: Colors.green,
              size: 20,
            ),
          ],
        ),
      ],
    );
  }
}
