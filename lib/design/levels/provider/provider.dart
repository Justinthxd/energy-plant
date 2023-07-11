import 'dart:async';

import 'package:energy_builder/data/models/plant.dart';
import 'package:flutter/material.dart';

class LevelProvider extends ChangeNotifier {
  List<PlantModel> plants = [];

  List<PlantModel> get getPlants => plants;

  set setPlants(List<PlantModel> plants) {
    this.plants = plants;
    notifyListeners();
  }

  double money = 0;

  double get getMoney => money;

  set setMoney(double money) {
    this.money = money;
    notifyListeners();
  }

  // - - - - - - - - - - - - - - - - - - - - //

  int energy = 0;

  int targetEnergy = 1;

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

  int time = 0;

  int get getTime => time;

  set setTime(int time) {
    this.time = time;
    notifyListeners();
  }

  getTimeFormatted() {
    int minutes = 0;
    int seconds = time;

    for (int i = 0; seconds > 59; i++) {
      minutes++;
      seconds -= 60;
    }

    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  // - - - - - - - - - - - - - - - - - - - - //

  bool timerIsRunning = false;

  bool get getTimerIsRunning => timerIsRunning;

  set setTimerIsRunning(bool timerIsRunning) {
    this.timerIsRunning = timerIsRunning;
    notifyListeners();
  }

  Timer timer = Timer(Duration.zero, () {});

  startTimer() {
    if (!plants.any((plant) => plant.isActive)) {
      stopTimer();
      return;
    }

    if (!timer.isActive) {
      timerIsRunning = true;
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (time <= 0) {
          stopTimer();
        } else if (energy < targetEnergy) {
          logic();
          notifyListeners();
        } else {
          stopTimer();
        }
      });
    }
  }

  stopTimer() {
    timer.cancel();
    timerIsRunning = false;
  }

  // - - - - - - - - - - - - - - - - - - - - //

  void activatePlant(PlantModel plant, PlantType type) {
    if (plant.isActive) {
      return;
    }

    final index = plants.indexWhere((element) => element.id == plant.id);

    plants[index] = plant.copyWith(
      type: type,
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
      type: type,
    );

    // startTimer();
    notifyListeners();
  }

  setPlantReady(PlantModel plant) {
    final index = plants.indexWhere((element) => element.id == plant.id);

    plants[index] = plant.copyWith(
      isReady: true,
    );

    notifyListeners();
  }

  setPlantNotReady(PlantModel plant) {
    final index = plants.indexWhere((element) => element.id == plant.id);

    plants[index] = plant.copyWith(
      isReady: false,
    );

    notifyListeners();
  }

  // - - - - - - - - - - - - - - - - - - - - //

  void logic() {
    final activePlants = plants.where((plant) => plant.isActive).toList();

    setTime = getTime - 1;

    for (var i = 0; i < activePlants.length; i++) {
      setMoney = money + activePlants[i].getEarning();
      setEnergy = energy + activePlants[i].getEnergy();
      if (energy > targetEnergy) {
        setEnergy = targetEnergy;
        finished();
      }
    }
  }

  void finished() {
    for (var i = 0; i < plants.length; i++) {
      plants[i] = plants[i].copyWith(isActive: false);
    }
  }
}
