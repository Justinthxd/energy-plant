// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:energy_builder/data/models/plant.dart';
import 'package:flutter/material.dart';

enum Difficulty { easy, medium, hard }

class Level {
  final int id;
  final Difficulty difficulty;
  final String route;
  final double money;
  final int currentEnergy;
  final int targetEnergy;
  final int time;
  final List<PlantModel> plants;
  final Widget widget;

  Level({
    this.id = 0,
    this.difficulty = Difficulty.easy,
    this.route = '/',
    this.money = 0,
    this.currentEnergy = 0,
    this.targetEnergy = 0,
    this.time = 0,
    this.plants = const [],
    this.widget = const SizedBox(),
  });

  Level copyWith({
    int? id,
    Difficulty? difficulty,
    String? route,
    double? money,
    int? currentenergy,
    int? targetEnergy,
    int? time,
    List<PlantModel>? plants,
    Widget? widget,
  }) {
    return Level(
      id: id ?? this.id,
      difficulty: difficulty ?? this.difficulty,
      route: route ?? this.route,
      money: money ?? this.money,
      currentEnergy: currentenergy ?? currentEnergy,
      targetEnergy: targetEnergy ?? this.targetEnergy,
      time: time ?? this.time,
      plants: plants ?? this.plants,
      widget: widget ?? this.widget,
    );
  }
}
