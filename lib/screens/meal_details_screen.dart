import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/constants.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/providers/favourites_provider.dart';
import 'package:meals_app/widgets/meal_details_section.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var mealHandler = ref.read(favouriteMealsProvider.notifier);
    var mealWatcher = ref.watch(favouriteMealsProvider);

    var isFavourite = mealWatcher.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              var isAddedAsFavourite = mealHandler.onToggleFavourite(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                isAddedAsFavourite
                    ? const SnackBar(
                        content: Text('Meal added as Favourite'),
                        duration: Duration(seconds: 1),
                      )
                    : const SnackBar(
                        content: Text('Meal removed as Favourite'),
                        duration: Duration(seconds: 1),
                      ),
              );
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween<double>(begin: 0.6, end: 1).animate(animation),
                  child: child,
                );
              },
              child: Icon(
                isFavourite ? Icons.star : Icons.star_border,
                key: ValueKey(isFavourite),
              ),
            ),
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
              child: Hero(
                tag: meal.id,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.fill,
                ),
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
