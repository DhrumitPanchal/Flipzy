class GameCard {
  final int id;
  final String image;
  final  type;

  bool isFlipped;
  bool isMatched;

  GameCard({
    required this.id,
    required this.image,
    required this.type,
    this.isFlipped = false,
    this.isMatched = false,
  });
}

enum CardType {
  animals,
  fruits,
  vehicles,
  numbers,
}
