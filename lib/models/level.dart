class Level {
  final int number;
  final int nbItemsToSort;
  final double itemOpacity;
  final int itemSpeed;
  final int score;
  final double minPeriod;
  final double maxPeriod;

  const Level({
    required this.number,
    required this.nbItemsToSort,
    required this.itemOpacity,
    required this.itemSpeed,
    required this.score,
    required this.minPeriod,
    required this.maxPeriod,
  });

  factory Level.one() => const Level(
        number: 1,
        nbItemsToSort: 5,
        itemOpacity: .5,
        itemSpeed: 100,
        score: 10,
        minPeriod: 1,
        maxPeriod: 3,
      );
}
