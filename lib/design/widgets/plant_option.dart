import 'package:energy_builder/data/models/plant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/dictionary/dictionary.dart';
import '../levels/provider/provider.dart';

class PlantOption extends StatelessWidget {
  const PlantOption({super.key, required this.type});

  final PlantType type;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LevelProvider>();
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
              ? Colors.white.withOpacity(0.08)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const Spacer(),
            type == PlantType.nuclearPlant
                ? Image.asset(
                    "assets/images/atomic.png",
                    color: getColor(type),
                    height: 30,
                  )
                : Icon(
                    getIcon(type),
                    size: 30,
                    color: getColor(type),
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
