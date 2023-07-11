// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:energy_builder/data/models/level.dart';

class MainProvider extends ChangeNotifier {
  List<Level> levels = [
    Level(
      id: 0,
      plants: 4,
      difficulty: Difficulty.easy,
      push: '/level1',
      money: 1000,
      targetEnergy: 600,
      time: 120,
    ),
    Level(
      id: 1,
      plants: 6,
      difficulty: Difficulty.medium,
      push: '/level2',
      money: 1000,
      targetEnergy: 600,
      time: 180,
    ),
    Level(
      id: 2,
      plants: 9,
      difficulty: Difficulty.hard,
      push: '/level3',
      money: 1000,
      targetEnergy: 600,
      time: 260,
    ),
  ];

  get getLevels => levels;

  set setLevels(List<Level> levels) {
    this.levels = levels;
    notifyListeners();
  }

  String test = 'test';

  String get getTest => test;

  set setTest(String test) {
    this.test = test;
    notifyListeners();
  }
}
