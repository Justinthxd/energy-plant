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
    return GestureDetector(
      onTap: () {
        provider.setCurrentPlantType = type;
      },
      child: Container(
        height: 90,
        width: 90,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: provider.currentPlantType == type
              ? getColor(type)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const Spacer(),
            Icon(
              getIcon(type),
              size: 30,
              color: provider.currentPlantType == type
                  ? Colors.white
                  : getColor(type),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${getPrice(type)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(
                    Icons.attach_money_rounded,
                    color: Colors.green,
                    size: 20,
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
