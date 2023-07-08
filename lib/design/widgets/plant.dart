import 'package:flutter/material.dart';

import 'package:energy_builder/data/dictionary/dictionary.dart';
import 'package:energy_builder/data/models/plant.dart';
import 'package:energy_builder/design/widgets/block.dart';
import 'package:provider/provider.dart';

import '../levels/level_1/provider.dart';

class WidgetPlant extends StatelessWidget {
  const WidgetPlant({
    Key? key,
    required this.plant,
  }) : super(key: key);

  final PlantModel plant;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<Level1Provider>();
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
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          const PopupMenuItem(
                              child: Icon(Icons.money_off_csred_rounded));
                        },
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                            ),
                            color: Colors.black12,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.more_vert_rounded,
                              size: 30,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
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
                  ],
                ),
              )
            : const EmptyBlock(),
      ),
    );
  }
}
