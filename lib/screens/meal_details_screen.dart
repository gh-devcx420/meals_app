import 'package:flutter/material.dart';
import 'package:meals_app/constants.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/widgets/meal_details_section.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen(
      {super.key, required this.meal, required this.onToggleFavourite});

  final Meal meal;
  final Function(Meal meal) onToggleFavourite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavourite(meal);
            },
            icon: const Icon(Icons.star),
          ),
        ],
      ),
      body: Padding(
        padding: kUniversalScaffoldBodyPadding,
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kUniversalMealAppRoundness),
              ),
              clipBehavior: Clip.hardEdge,
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MealDetailsSection(
              titleText: 'Ingredients',
              stepTextList: meal.ingredients,
            ),
            const SizedBox(
              height: 2,
            ),
            MealDetailsSection(
              titleText: 'Steps',
              stepTextList: meal.steps,
            ),
          ],
        ),
      ),
    );
  }
}
