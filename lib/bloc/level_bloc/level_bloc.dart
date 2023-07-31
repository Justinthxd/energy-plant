import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'level_event.dart';
part 'level_state.dart';

class LevelBloc extends Bloc<LevelEvent, LevelState> {
  LevelBloc() : super(LevelInitialState()) {
    on<LevelEvent>((event, emit) {});
  }
}
