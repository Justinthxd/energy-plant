// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'level1_bloc.dart';

class Level1State {
  List<PlantModel> plants;

  PlantType type;
  int energy;
  int targetEnergy;
  int money;

  Level1State({
    this.plants = const [],
    this.type = PlantType.hydroPlant,
    this.energy = 0,
    this.targetEnergy = 0,
    this.money = 0,
  });

  Level1State copyWith({
    List<PlantModel>? plants,
    PlantType? type,
    int? energy,
    int? targetEnergy,
    int? money,
  }) {
    return Level1State(
      type: type ?? this.type,
      energy: energy ?? this.energy,
      targetEnergy: targetEnergy ?? this.targetEnergy,
      money: money ?? this.money,
      plants: plants ?? this.plants,
    );
  }
}
