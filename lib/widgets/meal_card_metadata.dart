import 'package:flutter/material.dart';

class MealCardMetadata extends StatelessWidget {
  const MealCardMetadata(
      {super.key, required this.metaDataIcon, required this.metaDataText});

  final IconData metaDataIcon;
  final String metaDataText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          metaDataIcon,
          size: 18,
          color: Colors.white,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          metaDataText,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
