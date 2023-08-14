import 'package:energy_builder/data/models/plant.dart';

enum Difficulty { easy, medium, hard }

class Level {
  final int id;
  final Difficulty difficulty;
  final String route;
  final double money;
  final int currentenergy;
  final int targetEnergy;
  final int time;
  final List<PlantModel> plants;

  Level({
    this.id = 0,
    this.difficulty = Difficulty.easy,
    this.route = '/',
    this.money = 0,
    this.currentenergy = 0,
    this.targetEnergy = 0,
    this.time = 0,
    this.plants = const [],
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
  }) {
    return Level(
      id: id ?? this.id,
      difficulty: difficulty ?? this.difficulty,
      route: route ?? this.route,
      money: money ?? this.money,
      currentenergy: currentenergy ?? this.currentenergy,
      targetEnergy: targetEnergy ?? this.targetEnergy,
      time: time ?? this.time,
      plants: plants ?? this.plants,
    );
  }
}
