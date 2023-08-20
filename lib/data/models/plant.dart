// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:energy_builder/core/utils/keys.dart';

enum PlantType {
  hydroPlant,
  windPlant,
  solarPlant,
  electricPlant,
  chemicalPlant,
  nuclearPlant
}

class PlantModel {
  final int id;
  final bool isActive;
  final bool isReady;
  final PlantType type;
  final int price;
  final int energy;
  final int duration;

  const PlantModel({
    this.id = 0,
    this.isActive = false,
    this.isReady = false,
    this.type = PlantType.hydroPlant,
    this.price = 0,
    this.energy = 0,
    this.duration = 0,
  });

  int getEnergy() {
    return switch (type) {
      PlantType.hydroPlant => 2,
      PlantType.windPlant => 4,
      PlantType.solarPlant => 5,
      PlantType.electricPlant => 6,
      PlantType.chemicalPlant => 15,
      PlantType.nuclearPlant => 35,
    };
  }

  int getPrice() {
    return switch (type) {
      PlantType.hydroPlant => PlantPriceKeys.hydroPlant,
      PlantType.windPlant => PlantPriceKeys.windPlant,
      PlantType.solarPlant => PlantPriceKeys.solarPlant,
      PlantType.electricPlant => PlantPriceKeys.electricPlant,
      PlantType.chemicalPlant => PlantPriceKeys.chemicalPlant,
      PlantType.nuclearPlant => PlantPriceKeys.nuclearPlant,
    };
  }

  double getEarning() {
    return switch (type) {
      PlantType.hydroPlant => 5,
      PlantType.windPlant => 10,
      PlantType.solarPlant => 15,
      PlantType.electricPlant => 20,
      PlantType.chemicalPlant => 30,
      PlantType.nuclearPlant => 50,
    };
  }

  int getTime() {
    return switch (type) {
      PlantType.hydroPlant => 3,
      PlantType.windPlant => 5,
      PlantType.solarPlant => 10,
      PlantType.electricPlant => 15,
      PlantType.chemicalPlant => 20,
      PlantType.nuclearPlant => 30,
    };
  }

  PlantModel copyWith({
    int? id,
    bool? isActive,
    bool? isReady,
    PlantType? type,
    int? price,
    int? energy,
    int? duration,
  }) {
    return PlantModel(
      id: id ?? this.id,
      isActive: isActive ?? this.isActive,
      isReady: isReady ?? this.isReady,
      type: type ?? this.type,
      price: price ?? this.price,
      energy: energy ?? this.energy,
      duration: duration ?? this.duration,
    );
  }
}
