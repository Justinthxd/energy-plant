import 'dart:async';

import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:energy_builder/bloc/level_bloc/level_bloc.dart';
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
  bool firstTime = true;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.plant.getTime()),
    );
    animationController.forward();
    Timer(Duration(seconds: widget.plant.getTime()), () {
      context.read<LevelBloc>().add(PlantIsReadyEvent(widget.plant.id));
      setState(() {});
    });
  }

  _recolectPlant() {
    context.read<LevelBloc>().add(PlantIsNotReadyEvent(widget.plant.id));
    context.read<LevelBloc>().add(AddMoneyEvent(widget.plant.getEarning()));
    context.read<LevelBloc>().add(AddEnergyEvent(widget.plant.getEnergy()));

    Timer(Duration(seconds: widget.plant.getTime()), () {
      context.read<LevelBloc>().add(PlantIsReadyEvent(widget.plant.id));
      setState(() {});
    });
    animationController.reset();
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu(
      pressType: PressType.singleClick,
      enablePassEvent: true,
      controller: controller,
      menuBuilder: () => optionsSelector(),
      child: GestureDetector(
        onTap: widget.plant.isReady
            ? () {
                _recolectPlant();
              }
            : null,
        child: Container(
          decoration: BoxDecoration(
            color: widget.plant.isReady
                ? getColor(widget.plant.type)
                : getColor(widget.plant.type).withOpacity(0.6),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: widget.plant.isReady ? Colors.white30 : Colors.black38,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Stack(
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
              !widget.plant.isReady
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: AnimatedBuilder(
                            animation: animationController,
                            builder: (context, child) {
                              return LinearProgressIndicator(
                                color: Colors.white24,
                                backgroundColor: Colors.transparent,
                                value: animationController.value,
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
