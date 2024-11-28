import 'package:flutter/material.dart';
import 'package:meals_app/constants.dart';
import 'package:meals_app/data/available_categories.dart';
import 'package:meals_app/data/meals_data.dart';
import 'package:meals_app/models/meal_category.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

import '../models/meals.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key,
      required this.onToggleFavourite,
      required this.currentFilters});

  final Function(Meal) onToggleFavourite;
  final Map<Filter, bool> currentFilters;

  void showMealsForCategory(BuildContext context, MealCategory category) {
    final availableMeals = mealList.where((meal) {
      if (currentFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (currentFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (currentFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (currentFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

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
            onToggleFavourite: onToggleFavourite,
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
