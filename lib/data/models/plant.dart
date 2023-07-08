// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  final PlantType type;
  final int price;
  final int energy;
  final double duration;

  const PlantModel({
    this.id = 0,
    this.isActive = false,
    this.type = PlantType.hydroPlant,
    this.price = 0,
    this.energy = 0,
    this.duration = 0.0,
  });

  int getEnergy() {
    return switch (type) {
      PlantType.hydroPlant => 1,
      PlantType.windPlant => 3,
      PlantType.solarPlant => 4,
      PlantType.electricPlant => 5,
      PlantType.chemicalPlant => 14,
      PlantType.nuclearPlant => 30,
    };
  }

  int getPrice() {
    return switch (type) {
      PlantType.hydroPlant => 100,
      PlantType.windPlant => 125,
      PlantType.solarPlant => 150,
      PlantType.electricPlant => 200,
      PlantType.chemicalPlant => 300,
      PlantType.nuclearPlant => 600,
    };
  }

  double getEarning() {
    return switch (type) {
      PlantType.hydroPlant => 1.5,
      PlantType.windPlant => 2.5,
      PlantType.solarPlant => 2.7,
      PlantType.electricPlant => 3.9,
      PlantType.chemicalPlant => 4.1,
      PlantType.nuclearPlant => 5,
    };
  }

  PlantModel copyWith({
    int? id,
    bool? isActive,
    PlantType? type,
    int? price,
    int? energy,
    double? duration,
  }) {
    return PlantModel(
      id: id ?? this.id,
      isActive: isActive ?? this.isActive,
      type: type ?? this.type,
      price: price ?? this.price,
      energy: energy ?? this.energy,
      duration: duration ?? this.duration,
    );
  }
}
