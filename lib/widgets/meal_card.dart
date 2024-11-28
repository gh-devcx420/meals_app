import 'package:flutter/material.dart';
import 'package:meals_app/constants.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/widgets/meal_card_metadata.dart';
import 'package:transparent_image/transparent_image.dart';

class MealCard extends StatelessWidget {
  const MealCard({super.key, required this.meal, required this.onMealCardTap});

  final Meal meal;
  final Function() onMealCardTap;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kUniversalMealAppRoundness),
      ),
      margin: kCardMargin,
      clipBehavior: Clip.hardEdge,
      elevation: 3,
      child: InkWell(
        onTap: onMealCardTap,
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              height: 260,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                color: Colors.black.withOpacity(0.7),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealCardMetadata(
                          metaDataIcon: Icons.schedule_rounded,
                          metaDataText: '${meal.duration} Mins',
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        MealCardMetadata(
                          metaDataIcon: Icons.work,
                          metaDataText: complexityText,
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        MealCardMetadata(
                          metaDataIcon: Icons.currency_rupee_rounded,
                          metaDataText: affordabilityText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
