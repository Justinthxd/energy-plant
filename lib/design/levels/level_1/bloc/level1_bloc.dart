import 'dart:async';

import 'package:energy_builder/data/models/plant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'level1_event.dart';
part 'level1_state.dart';

class Level1Bloc extends Bloc<Level1Event, Level1State> {
  Level1Bloc() : super(Level1State()) {
    on<Level1Event>((event, emit) {
      if (event is TogglePlant) {
        emit(state.copyWith(
            plants: state.plants
                .map((plant) => plant.id == event.plant.id
                    ? plant.copyWith(isActive: !plant.isActive)
                    : plant)
                .toList()));
      } else if (event is TestEvent) {
        state.test();
      }
    });
  }
}
