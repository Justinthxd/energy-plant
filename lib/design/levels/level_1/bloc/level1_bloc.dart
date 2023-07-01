import 'package:energy_builder/data/models/plant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'level1_event.dart';
part 'level1_state.dart';

class Level1Bloc extends Bloc<Level1Event, Level1State> {
  Level1Bloc() : super(Level1State()) {
    on<Level1Event>((event, emit) {
      if (event is TogglePlant) {
        print('object');
        emit(state.copyWith());
      }
    });
  }
}
