import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/widgets/meal_card.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {this.title,
      required this.meals,
      super.key,
      required this.onToggleFavourite});

  final String? title;
  final List<Meal> meals;
  final Function(Meal) onToggleFavourite;

  void mealDetails(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return MealDetailsScreen(
            meal: meal,
            onToggleFavourite: onToggleFavourite,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView(
      children: [
        for (final meal in meals)
          MealCard(
            meal: meal,
            onMealCardTap: () {
              mealDetails(context, meal);
            },
          ),
      ],
    );

    if (meals.isEmpty) {
      content = Center(
        child: Text(
          'Uh Oh! Nothing to See Here!',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
