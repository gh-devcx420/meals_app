import 'package:flutter/material.dart';
import 'package:meals_app/constants.dart';

class MealCategory {
  const MealCategory({
    required this.id,
    required this.title,
    this.color = kDefaultCardColour,
  });

  final String id;
  final String title;
  final Color color;
}
