enum Complexity {
  Simple,
  Hard,
  Challenging,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final String title;
  final List<String> categories;
  final Complexity complexity;
  final int duration;
  final Affordability affordability;
  final List<String> ingredients;
  final List<String> steps;
  final String imageUrl;
  final bool isVegan;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegetarian;

  const Meal({
    required this.id,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.title,
    required this.categories,
    required this.complexity,
    required this.duration,
    required this.affordability,
    required this.isVegan,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegetarian,
  });
}
