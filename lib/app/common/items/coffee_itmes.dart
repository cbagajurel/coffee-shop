class CoffeeItem {
  final String name;
  final double price;
  final String description;
  final String image;
  final CoffeeType type;
  final CoffeeSize size;
  final SugarLevel sugarLevel;

  const CoffeeItem({
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.type,
    required this.size,
    required this.sugarLevel,
  });
}

enum CoffeeType { espresso, latte, cappuccino, macchiato, americano, mocha }

enum CoffeeSize { small, medium, large, extraLarge }

enum SugarLevel { none, one, two, three }

const List<CoffeeItem> coffeeItems = [
  CoffeeItem(
    name: 'Espresso',
    price: 1.00,
    type: CoffeeType.espresso,
    size: CoffeeSize.small,
    sugarLevel: SugarLevel.none,
    description:
        'A strong, concentrated coffee brewed by forcing hot water through finely ground coffee beans.',
    image: 'assets/images/espresso.png',
  ),
  CoffeeItem(
    name: 'Latte',
    price: 2.00,
    type: CoffeeType.latte,
    size: CoffeeSize.medium,
    sugarLevel: SugarLevel.one,
    description:
        'A latte is a coffee drink made with espresso and steamed milk.',
    image: 'assets/images/latte.png',
  ),
];
