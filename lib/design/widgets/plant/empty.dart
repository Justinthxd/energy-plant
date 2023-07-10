import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:energy_builder/design/widgets/plant/plant_selector.dart';
import 'package:flutter/material.dart';

import 'package:energy_builder/data/models/plant.dart';

class Empty extends StatelessWidget {
  const Empty({
    Key? key,
    required this.plant,
  }) : super(key: key);

  final PlantModel plant;

  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu(
      pressType: PressType.singleClick,
      menuBuilder: () => plantSelector(plant),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white.withOpacity(0.03),
          ),
        ),
        child: const Icon(
          Icons.add_rounded,
          size: 40,
          color: Colors.white38,
        ),
      ),
    );
  }
}
