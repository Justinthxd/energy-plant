part of 'level_bloc.dart';

@immutable
sealed class LevelState {}

final class LevelInitialState extends LevelState {}

final class LevelLoadedState extends LevelState {
  final Level level;

  LevelLoadedState(this.level);
}
