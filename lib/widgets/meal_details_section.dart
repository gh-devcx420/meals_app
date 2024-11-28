import 'package:flutter/material.dart';
import 'package:meals_app/constants.dart';

class MealDetailsSection extends StatelessWidget {
  const MealDetailsSection(
      {super.key, required this.titleText, required this.stepTextList});

  final String titleText;
  final List stepTextList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: kTitleContainerPadding,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(
              kUniversalMealAppRoundness,
            ),
          ),
          child: Center(
            child: Text(
              titleText,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        for (final stepText in stepTextList)
          Column(
            children: [
              Text(
                '•  $stepText',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const SizedBox(
                height: 8,
              )
            ],
          ),
      ],
    );
  }
}
