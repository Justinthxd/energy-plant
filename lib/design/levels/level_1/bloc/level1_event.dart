part of 'level1_bloc.dart';

abstract class Level1Event {
  const Level1Event();
}

class TogglePlant extends Level1Event {
  final PlantModel plant;

  const TogglePlant(this.plant);
}

class TestEvent extends Level1Event {
  const TestEvent();
}
