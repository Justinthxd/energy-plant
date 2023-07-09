enum Difficulty { easy, medium, hard }

class Level {
  final int id;
  final Difficulty difficulty;
  final String push;

  Level({
    required this.id,
    required this.difficulty,
    required this.push,
  });
}
