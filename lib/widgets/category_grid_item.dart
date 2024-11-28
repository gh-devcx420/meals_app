import 'package:flutter/material.dart';
import 'package:meals_app/constants.dart';
import 'package:meals_app/models/meal_category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    required this.category,
    required this.onSelectCategory,
    super.key,
  });

  final MealCategory category;
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
      borderRadius: BorderRadius.circular(kUniversalMealAppRoundness),
      splashColor: category.color,
      highlightColor: category.color,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kUniversalMealAppRoundness),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              category.color,
              category.color.withOpacity(0.7),
            ],
          ),
        ),
        child: Padding(
          padding: kGridItemPadding,
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ),
    );
  }
}
