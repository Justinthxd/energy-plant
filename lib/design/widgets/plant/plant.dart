import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:energy_builder/design/widgets/plant/options_selector.dart';
import 'package:flutter/material.dart';

import 'package:energy_builder/data/dictionary/dictionary.dart';
import 'package:energy_builder/data/models/plant.dart';

class WidgetPlant extends StatelessWidget {
  const WidgetPlant({
    Key? key,
    required this.plant,
  }) : super(key: key);

  final PlantModel plant;

  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu(
      pressType: PressType.longPress,
      menuBuilder: () => optionsSelector(),
      child: Container(
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
      ),
    );
  }
}
