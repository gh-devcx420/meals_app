import 'package:flutter/material.dart';
import 'package:meals_app/constants.dart';
import 'package:meals_app/data/available_categories.dart';
import 'package:meals_app/models/meal_category.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  void showMealsForCategory(BuildContext context, MealCategory category) {
    final filteredMeals = availableMeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return MealsScreen(
            title: category.title,
            meals: filteredMeals,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kUniversalScaffoldBodyPadding,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          children: [
            ...availableCategories.map(
              (category) {
                return CategoryGridItem(
                  category: category,
                  onSelectCategory: () {
                    showMealsForCategory(context, category);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
