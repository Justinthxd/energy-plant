import 'package:energy_builder/data/models/level.dart';
import 'package:energy_builder/data/models/plant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'level_event.dart';
part 'level_state.dart';

class LevelBloc extends Bloc<LevelEvent, LevelState> {
  LevelBloc() : super(LevelInitialState()) {
    on<LevelEvent>((event, emit) {
      if (event is LevelLoadedEvent) {
        emit(LevelLoadedState(event.level));
      } else if (event is ActivatePlantEvent) {
        final currentState = state as LevelLoadedState;
        final updatedLevel = currentState.level.copyWith(
          plants: currentState.level.plants.map((plant) {
            if (plant.id == event.id) {
              return plant.copyWith(isActive: true, type: event.type);
            } else {
              return plant;
            }
          }).toList(),
        );
        emit(LevelLoadedState(updatedLevel));
      } else if (event is PlantIsReadyEvent) {
        final currentState = state as LevelLoadedState;
        final updatedLevel = currentState.level.copyWith(
          plants: currentState.level.plants.map((plant) {
            if (plant.id == event.id) {
              return plant.copyWith(isReady: true);
            } else {
              return plant;
            }
          }).toList(),
        );
        emit(LevelLoadedState(updatedLevel));
      } else if (event is PlantIsNotReadyEvent) {
        final currentState = state as LevelLoadedState;
        final updatedLevel = currentState.level.copyWith(
          plants: currentState.level.plants.map((plant) {
            if (plant.id == event.id) {
              return plant.copyWith(isReady: false);
            } else {
              return plant;
            }
          }).toList(),
        );
        emit(LevelLoadedState(updatedLevel));
      } else if (event is AddMoneyEvent) {
        final currentState = state as LevelLoadedState;
        final updatedLevel = currentState.level.copyWith(
          money: currentState.level.money + event.money,
        );
        emit(LevelLoadedState(updatedLevel));
      } else if (event is AddMoneyEvent) {
        final currentState = state as LevelLoadedState;
        final updatedLevel = currentState.level.copyWith(
          money: currentState.level.money - event.money,
        );
        emit(LevelLoadedState(updatedLevel));
      } else if (event is AddEnergyEvent) {
        final currentState = state as LevelLoadedState;
        final updatedLevel = currentState.level.copyWith(
          currentenergy: currentState.level.currentenergy + event.energy,
        );
        emit(LevelLoadedState(updatedLevel));
      } else if (event is RemoveEnergyEvent) {
        final currentState = state as LevelLoadedState;
        final updatedLevel = currentState.level.copyWith(
          currentenergy: currentState.level.currentenergy - event.energy,
        );
        emit(LevelLoadedState(updatedLevel));
      }
    });
  }
}
