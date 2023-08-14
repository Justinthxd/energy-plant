part of 'level_bloc.dart';

@immutable
sealed class LevelEvent {}

class LevelLoadedEvent extends LevelEvent {
  final Level level;

  LevelLoadedEvent(this.level);
}

class ActivatePlantEvent extends LevelEvent {
  final int id;
  final PlantType type;

  ActivatePlantEvent(this.id, this.type);
}

class PlantIsReadyEvent extends LevelEvent {
  final int id;

  PlantIsReadyEvent(this.id);
}

class PlantIsNotReadyEvent extends LevelEvent {
  final int id;

  PlantIsNotReadyEvent(this.id);
}

class AddMoneyEvent extends LevelEvent {
  final double money;

  AddMoneyEvent(this.money);
}

class RemoveMoneyEvent extends LevelEvent {
  final double money;

  RemoveMoneyEvent(this.money);
}

class AddEnergyEvent extends LevelEvent {
  final int energy;

  AddEnergyEvent(this.energy);
}

class RemoveEnergyEvent extends LevelEvent {
  final int energy;

  RemoveEnergyEvent(this.energy);
}
