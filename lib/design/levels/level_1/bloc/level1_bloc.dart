import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'level1_event.dart';
part 'level1_state.dart';

class Level1Bloc extends Bloc<Level1Event, Level1State> {
  Level1Bloc() : super(Level1Initial()) {
    on<Level1Event>((event, emit) {
      // TODO: implement event handler
    });
  }
}
