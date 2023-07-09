// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:energy_builder/data/models/level.dart';

class MainProvider extends ChangeNotifier {
  List<Level> levels = [
    Level(id: 0, difficulty: Difficulty.easy, push: '/level1'),
    Level(id: 1, difficulty: Difficulty.medium, push: '/level2'),
    Level(id: 2, difficulty: Difficulty.hard, push: '/level3'),
  ];

  get getLevels => levels;

  set setLevels(List<Level> levels) {
    this.levels = levels;
    notifyListeners();
  }
}
