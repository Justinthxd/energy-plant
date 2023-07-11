import 'dart:async';

import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:energy_builder/design/levels/provider/provider.dart';
import 'package:energy_builder/design/widgets/plant/options_selector.dart';
import 'package:flutter/material.dart';

import 'package:energy_builder/data/dictionary/dictionary.dart';
import 'package:energy_builder/data/models/plant.dart';
import 'package:provider/provider.dart';

class WidgetPlant extends StatefulWidget {
  const WidgetPlant({
    Key? key,
    required this.plant,
  }) : super(key: key);

  final PlantModel plant;

  @override
  State<WidgetPlant> createState() => _WidgetPlantState();
}

class _WidgetPlantState extends State<WidgetPlant> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LevelProvider>();
    return CustomPopupMenu(
      pressType: PressType.longPress,
      menuBuilder: () => optionsSelector(),
      child: Container(
        decoration: BoxDecoration(
          color: getColor(widget.plant.type),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color:
                widget.plant.isReady ? Colors.yellowAccent : Colors.transparent,
            width: 5,
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black38,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: widget.plant.type == PlantType.nuclearPlant
                  ? Image.asset(
                      "assets/images/atomic.png",
                      color: Colors.white,
                      height: 65,
                    )
                  : Icon(
                      getIcon(widget.plant.type),
                      color: Colors.white,
                      size: 60,
                    ),
            ),
            TextButton(
              onPressed: () {
                provider.setPlantNotReady(widget.plant);
                Timer.periodic(const Duration(seconds: 5), (timer) {
                  provider.setPlantReady(widget.plant);
                });
              },
              child: const Text(
                'Generate',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
