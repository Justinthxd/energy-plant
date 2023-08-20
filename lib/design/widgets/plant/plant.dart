import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:energy_builder/design/bloc/level_bloc/level_bloc.dart';
import 'package:energy_builder/design/widgets/plant/options_selector.dart';
import 'package:flutter/material.dart';

import 'package:energy_builder/data/dictionary/dictionary.dart';
import 'package:energy_builder/data/models/plant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetPlant extends StatefulWidget {
  const WidgetPlant({
    Key? key,
    required this.plant,
  }) : super(key: key);

  final PlantModel plant;

  @override
  State<WidgetPlant> createState() => _WidgetPlantState();
}

class _WidgetPlantState extends State<WidgetPlant>
    with SingleTickerProviderStateMixin {
  CustomPopupMenuController controller = CustomPopupMenuController();
  late AnimationController animationController;
  late AnimationController animateController;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.plant.getTime()),
    );

    animationController.forward();
    Timer(Duration(seconds: widget.plant.getTime()), () {
      if (mounted) {
        context.read<LevelBloc>().add(PlantIsReadyEvent(widget.plant.id));
        setState(() {});
      }
    });
  }

  _recolectPlant() {
    context.read<LevelBloc>().add(PlantIsNotReadyEvent(widget.plant.id));
    context.read<LevelBloc>().add(AddMoneyEvent(widget.plant.getEarning()));
    context.read<LevelBloc>().add(AddEnergyEvent(widget.plant.getEnergy()));
    isVisible = true;
    Timer(Duration(seconds: widget.plant.getTime()), () {
      if (mounted) {
        context.read<LevelBloc>().add(PlantIsReadyEvent(widget.plant.id));
        setState(() {});
      }
    });
    animateController.reset();
    animateController.forward();
    animationController.reset();
    animationController.forward();
  }

  _toggleMargin() {
    margin = 1;
    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) {
        margin = 0;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    // animateController.dispose();
    super.dispose();
  }

  double margin = 0;

  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu(
      pressType: PressType.singleClick,
      enablePassEvent: true,
      controller: controller,
      menuBuilder: () => OptionSelector(plant: widget.plant),
      child: GestureDetector(
        onTap: widget.plant.isReady
            ? () {
                _recolectPlant();
                _toggleMargin();
              }
            : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: EdgeInsets.all(margin),
          curve: Curves.bounceInOut,
          decoration: BoxDecoration(
            color: widget.plant.isReady
                ? getColor(widget.plant.type)
                : getColor(widget.plant.type).withOpacity(0.4),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Center(
                child: FadeOutUp(
                  manualTrigger: true,
                  delay: const Duration(seconds: 5),
                  controller: (controller) => animateController = controller,
                  duration: const Duration(milliseconds: 2500),
                  child: Visibility(
                    visible: isVisible,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.bolt,
                              color: Colors.yellow,
                              size: 25,
                            ),
                            Text(
                              widget.plant.getEnergy().round().toString(),
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 50),
                            const Icon(
                              Icons.attach_money,
                              color: Colors.green,
                              size: 25,
                            ),
                            Text(
                              widget.plant.getEarning().round().toString(),
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
              Positioned.fill(
                child: AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    return LinearProgressIndicator(
                      color: Colors.white12,
                      backgroundColor: Colors.transparent,
                      value: animationController.value,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
