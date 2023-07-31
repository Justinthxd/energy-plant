import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:energy_builder/design/widgets/plant/options_selector.dart';
import 'package:flutter/material.dart';

import 'package:energy_builder/data/dictionary/dictionary.dart';
import 'package:energy_builder/data/models/plant.dart';

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
        onTap: widget.plant.isReady ? () {} : null,
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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
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
          ),
        ),
      ),
    );
  }
}
