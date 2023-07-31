part of 'level_bloc.dart';

@immutable
abstract class LevelState {}

class LevelInitialState extends LevelState {}

class LevelLoadingState extends LevelState {}

class LevelStartState extends LevelState {}

class LevelRunningState extends LevelState {}

class LevelErrorState extends LevelState {
  final String message;

  LevelErrorState(this.message);
}

class LevelFinishedState extends LevelState {}
