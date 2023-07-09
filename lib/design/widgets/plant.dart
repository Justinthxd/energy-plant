import 'dart:async';

import 'package:flutter/material.dart';

import 'package:energy_builder/data/dictionary/dictionary.dart';
import 'package:energy_builder/data/models/plant.dart';
import 'package:energy_builder/design/widgets/block.dart';
import 'package:provider/provider.dart';

import '../levels/level_1/provider.dart';

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
  Timer timer = Timer.periodic(Duration.zero, (timer) {});

  bool isActive = false;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 250), (timer) {
      isActive = !isActive;
      setState(() {});
    });
  }

  @override
  void deactivate() {
    timer.cancel();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<Level1Provider>();
    return GestureDetector(
      onTap: () {
        provider.activatePlant(widget.plant);
      },
      child: AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        child: widget.plant.isActive
            ? Container(
                decoration: BoxDecoration(
                  // color: getColor(widget.plant.type),
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black38,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: AnimatedContainer(
                  curve: Curves.linear,
                  duration: const Duration(milliseconds: 200),
                  margin: EdgeInsets.all(isActive ? 20 : 22),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
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
                ),
              )
            : const EmptyBlock(),
      ),
    );
  }
}
