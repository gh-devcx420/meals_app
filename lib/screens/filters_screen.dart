import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/constants.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/widgets/filter_switch.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Padding(
        padding: kUniversalScaffoldBodyPadding,
        child: Column(
          children: [
            FilterSwitch(
              title: 'Gluten Free',
              subTitle: 'Only include gluten free meals',
              filterValue: activeFilters[Filter.glutenFree]!,
              onFilterTap: (isChecked) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(Filter.glutenFree, isChecked);
              },
            ),
            FilterSwitch(
              title: 'Lactose Free',
              subTitle: 'Only include lactose free meals',
              filterValue: activeFilters[Filter.lactoseFree]!,
              onFilterTap: (newValue) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(Filter.lactoseFree, newValue);
              },
            ),
            FilterSwitch(
              title: 'Vegetarian',
              subTitle: 'Only include vegetarian meals',
              filterValue: activeFilters[Filter.vegetarian]!,
              onFilterTap: (newValue) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(Filter.vegetarian, newValue);
              },
            ),
            FilterSwitch(
              title: 'Vegan',
              subTitle: 'Only include vegan meals',
              filterValue: activeFilters[Filter.vegan]!,
              onFilterTap: (newValue) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(Filter.vegan, newValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}
