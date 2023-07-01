import 'package:flutter/material.dart';

import 'package:energy_builder/data/dictionary/dictionary.dart';
import 'package:energy_builder/data/models/plant.dart';
import 'package:energy_builder/design/widgets/block.dart';

class WidgetPlant extends StatelessWidget {
  const WidgetPlant({
    Key? key,
    required this.plant,
  }) : super(key: key);

  final PlantModel plant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        child: plant.isActive
            ? Container(
                height: 100,
                width: 100,
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
                child: Stack(
                  children: [
                    const Positioned(
                      top: 5,
                      right: 10,
                      child: Text(
                        '5',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Center(
                      child: Icon(
                        getIcon(plant.type),
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                  ],
                ),
              )
            : const EmptyBlock(),
      ),
    );
  }
}
