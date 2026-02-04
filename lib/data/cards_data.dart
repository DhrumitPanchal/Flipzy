import '../models/game_card.dart';

List<GameCard> gameCards = [
  // 🐶 Animals
  GameCard(id: 1, image: 'assets/images/animals/lion.png', type: CardType.animals),
  GameCard(id: 2, image: 'assets/images/animals/horse.png', type: CardType.animals),
  GameCard(id: 3, image: 'assets/images/animals/bear.png', type: CardType.animals),
  GameCard(id: 4, image: 'assets/images/animals/rabbit.png', type: CardType.animals),
  GameCard(id: 5, image: 'assets/images/animals/cow.png', type: CardType.animals),
  GameCard(id: 6, image: 'assets/images/animals/deer.png', type: CardType.animals),
  GameCard(id: 7, image: 'assets/images/animals/dog.png', type: CardType.animals),
  GameCard(id: 8, image: 'assets/images/animals/gorilla.png', type: CardType.animals),
  GameCard(id: 9, image: 'assets/images/animals/owl.png', type: CardType.animals),


  GameCard(id: 11, image: 'assets/images/fruit/apple.png', type: CardType.fruits),
  GameCard(id: 12, image: 'assets/images/fruit/banana.png', type: CardType.fruits),
  GameCard(id: 13, image: 'assets/images/fruit/dragon-fruit.png', type: CardType.fruits),
  GameCard(id: 14, image: 'assets/images/fruit/grapes.png', type: CardType.fruits),
  GameCard(id: 15, image: 'assets/images/fruit/kiwi.png', type: CardType.fruits),
  GameCard(id: 16, image: 'assets/images/fruit/mango.png', type: CardType.fruits),
  GameCard(id: 17, image: 'assets/images/fruit/orange.png', type: CardType.fruits),
  GameCard(id: 18, image: 'assets/images/fruit/papaya.png', type: CardType.fruits),
  GameCard(id: 19, image: 'assets/images/fruit/strawberry.png', type: CardType.fruits),
  GameCard(id: 20, image: 'assets/images/fruit/watermelon.png', type: CardType.fruits),


];

List<GameCard> getCardsByType(CardType type) {
  return gameCards.where((card) => card.type == type).toList();
}
