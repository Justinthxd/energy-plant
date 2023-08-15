// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:energy_builder/bloc/level_bloc/level_bloc.dart';
import 'package:energy_builder/data/models/plant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OptionSelector extends StatefulWidget {
  const OptionSelector({
    Key? key,
    required this.plant,
  }) : super(key: key);

  final PlantModel plant;

  @override
  State<OptionSelector> createState() => _OptionSelectorState();
}

class _OptionSelectorState extends State<OptionSelector> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _option(
                Icons.monetization_on_rounded,
                const Color.fromARGB(255, 66, 203, 70),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _option(IconData icon, Color color) {
    return IconButton(
      onPressed: () {
        context.read<LevelBloc>().add(SellPlantEvent(widget.plant.id));
      },
      icon: Icon(
        icon,
        size: 40,
        color: color,
      ),
    );
  }
}
