// ignore_for_file: public_member_api_docs, sort_constructors_first
enum Difficulty { easy, medium, hard }

class Level {
  final int id;
  final Difficulty difficulty;
  final String push;
  final double money;
  final int targetEnergy;
  final int time;
  final int plants;

  Level({
    required this.id,
    required this.difficulty,
    required this.push,
    required this.money,
    required this.targetEnergy,
    required this.time,
    required this.plants,
  });
}
