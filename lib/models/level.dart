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

  factory Level.tutorial() => const Level(
        number: 1,
        nbItemsToSort: 2,
        itemOpacity: .5,
        itemSpeed: 100,
        score: 10,
        minPeriod: 1,
        maxPeriod: 1.2,
      );

  factory Level.tutorialFixed() => const Level(
        number: 1,
        nbItemsToSort: 200,
        itemOpacity: .75,
        itemSpeed: 1,
        score: 0,
        minPeriod: 10,
        maxPeriod: 12,
      );
}
