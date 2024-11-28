import 'package:flutter/material.dart';

class FilterSwitch extends StatelessWidget {
  const FilterSwitch({
    super.key,
    required this.filterValue,
    required this.title,
    required this.subTitle,
    required this.onFilterTap,
  });

  final bool filterValue;
  final ValueChanged<bool> onFilterTap;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      onChanged: onFilterTap,
      value: filterValue,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.primary),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context)
            .textTheme
            .labelSmall!
            .copyWith(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
