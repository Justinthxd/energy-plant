import 'dart:ui';

import 'package:energy_builder/data/constants/constants.dart';
import 'package:energy_builder/data/dictionary/dictionary.dart';
import 'package:energy_builder/data/models/level.dart';
import 'package:energy_builder/design/provider/provider.dart';
import 'package:energy_builder/design/widgets/levels_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Levels extends StatelessWidget {
  const Levels({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MainProvider>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            children: [
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  size: 30,
                  color: Colors.white38,
                ),
              ),
              const Text(
                'Select Level',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white38,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(
                    color: Colors.white.withOpacity(0.04),
                  ),
                );
              },
              itemCount: provider.levels.length,
              itemBuilder: (BuildContext context, int index) {
                final level = provider.levels[index];
                return LevelsItem(level: level);
              },
            ),
          ),
        ],
      ),
    );
  }
}
