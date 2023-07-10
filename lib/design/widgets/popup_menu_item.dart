// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:energy_builder/data/models/plant.dart';
import 'package:flutter/material.dart';

class OptionsMenuItem extends StatelessWidget {
  const OptionsMenuItem({
    Key? key,
    required this.plant,
    required this.icon,
    this.color = Colors.white,
  }) : super(key: key);

  final PlantModel plant;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          size: 40,
          color: color,
        ),
      ),
    );
  }
}
