import 'package:energy_builder/data/models/plant.dart';
import 'package:flutter/material.dart';
import '../../data/dictionary/dictionary.dart';

class PlantOption extends StatelessWidget {
  const PlantOption({super.key, required this.type});

  final PlantType type;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: getColor(type),
      ),
      onPressed: () {},
      icon: Icon(
        getIcon(type),
        color: Colors.white,
      ),
    );
  }
}
