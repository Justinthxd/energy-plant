// ignore_for_file: public_member_api_docs, sort_constructors_first
enum PlantType {
  hydroPlant,
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
      PlantType.solarPlant => 2,
      PlantType.electricPlant => 10,
      PlantType.chemicalPlant => 25,
      PlantType.nuclearPlant => 50,
    };
  }

  int getPrice() {
    return switch (type) {
      PlantType.hydroPlant => 100,
      PlantType.solarPlant => 150,
      PlantType.electricPlant => 300,
      PlantType.chemicalPlant => 1000,
      PlantType.nuclearPlant => 2000,
    };
  }

  int getEarning() {
    return switch (type) {
      PlantType.hydroPlant => 1,
      PlantType.solarPlant => 2,
      PlantType.electricPlant => 10,
      PlantType.chemicalPlant => 15,
      PlantType.nuclearPlant => 20,
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
