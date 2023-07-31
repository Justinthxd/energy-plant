// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:energy_builder/data/dictionary/dictionary.dart';
import 'package:energy_builder/data/models/plant.dart';

class PlantSelectorItem extends StatelessWidget {
  const PlantSelectorItem({
    Key? key,
    required this.plant,
    required this.type,
  }) : super(key: key);

  final PlantModel plant;
  final PlantType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Column(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              getIcon(type),
              size: 40,
              color: getColor(type),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.attach_money_rounded,
                    size: 12,
                    color: Colors.green,
                  ),
                  Text(
                    getPrice(type).toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
