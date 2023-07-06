import 'dart:async';

import 'package:energy_builder/data/models/plant.dart';
import 'package:flutter/material.dart';

class Level1Provider extends ChangeNotifier {
  List<PlantModel> plants = [
    for (int i = 0; i < 9; i++)
      PlantModel(
        id: i,
      ),
  ];

  List<PlantModel> get getPlants => plants;

  set setPlants(List<PlantModel> plants) {
    this.plants = plants;
    notifyListeners();
  }

  int money = 500;

  int get getMoney => money;

  set setMoney(int money) {
    this.money = money;
    notifyListeners();
  }

  PlantType currentPlantType = PlantType.hydroPlant;

  PlantType get getCurrentPlantType => currentPlantType;

  set setCurrentPlantType(PlantType currentPlantType) {
    this.currentPlantType = currentPlantType;
    notifyListeners();
  }

  // - - - - - - - - - - - - - - - - - - - - //

  int energy = 0;

  int targetEnergy = 500;

  int get getEnergy => energy;

  set setEnergy(int energy) {
    this.energy = energy;
    notifyListeners();
  }

  int get getTargetEnergy => targetEnergy;

  set setTargetEnergy(int targetEnergy) {
    this.targetEnergy = targetEnergy;
    notifyListeners();
  }

  // - - - - - - - - - - - - - - - - - - - - //

  Timer timer = Timer(Duration.zero, () {});

  startTimer() {
    if (!plants.any((plant) => plant.isActive)) {
      timer.cancel();
      return;
    }

    if (!timer.isActive) {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (energy < targetEnergy) {
          logic();
          notifyListeners();
        } else {
          timer.cancel();
        }
      });
    }
  }

  stopTimer() {
    timer.cancel();
  }

  // - - - - - - - - - - - - - - - - - - - - //

  void activatePlant(PlantModel plant) {
    if (plant.isActive) {
      return;
    }

    final index = plants.indexWhere((element) => element.id == plant.id);

    plants[index] = plant.copyWith(
      type: currentPlantType,
    );

    // Price - - - - - - - //

    if (money < plants[index].getPrice()) {
      return;
    }

    setMoney = (money - plants[index].getPrice());

    if (money < 0) {
      setMoney = 0;
    }

    // Active it - - - - - //

    plants[index] = plant.copyWith(
      isActive: true,
      type: currentPlantType,
    );

    startTimer();
    notifyListeners();
  }

  void buyPlant(PlantModel plant) {}

  // - - - - - - - - - - - - - - - - - - - - //

  void logic() {
    final activePlants = plants.where((plant) => plant.isActive).toList();

    for (var i = 0; i < activePlants.length; i++) {
      setMoney = money + activePlants[i].getEarning();
      setEnergy = energy + activePlants[i].getEnergy();
      if (energy > targetEnergy) {
        setEnergy = targetEnergy;
        // finished();
      }
    }
  }

  void finished() {
    for (var i = 0; i < plants.length; i++) {
      plants[i] = plants[i].copyWith(isActive: false);
    }
  }
}
