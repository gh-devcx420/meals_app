import 'package:flutter/material.dart';
import 'package:meals_app/constants.dart';
import 'package:meals_app/widgets/filter_switch.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.activeFilters});

  final Map<Filter, bool> activeFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterStatus = false;
  var _lactoseFreeFilterStatus = false;
  var _vegetarianStatus = false;
  var _veganStatus = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterStatus = widget.activeFilters[Filter.glutenFree]!;
    _lactoseFreeFilterStatus = widget.activeFilters[Filter.lactoseFree]!;
    _vegetarianStatus = widget.activeFilters[Filter.vegetarian]!;
    _veganStatus = widget.activeFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) return;

          final filters = {
            Filter.glutenFree: _glutenFreeFilterStatus,
            Filter.lactoseFree: _lactoseFreeFilterStatus,
            Filter.vegetarian: _vegetarianStatus,
            Filter.vegan: _veganStatus,
          };

          Navigator.of(context).pop(filters);
        },
        child: Padding(
          padding: kUniversalScaffoldBodyPadding,
          child: Column(
            children: [
              FilterSwitch(
                title: 'Gluten Free',
                subTitle: 'Only include gluten free meals',
                filterValue: _glutenFreeFilterStatus,
                onFilterTap: (newValue) {
                  setState(() {
                    _glutenFreeFilterStatus = newValue;
                  });
                },
              ),
              FilterSwitch(
                title: 'Lactose Free',
                subTitle: 'Only include lactose free meals',
                filterValue: _lactoseFreeFilterStatus,
                onFilterTap: (newValue) {
                  setState(() {
                    _lactoseFreeFilterStatus = newValue;
                  });
                },
              ),
              FilterSwitch(
                title: 'Vegetarian',
                subTitle: 'Only include vegetarian meals',
                filterValue: _vegetarianStatus,
                onFilterTap: (newValue) {
                  setState(() {
                    _vegetarianStatus = newValue;
                  });
                },
              ),
              FilterSwitch(
                title: 'Vegan',
                subTitle: 'Only include vegan meals',
                filterValue: _veganStatus,
                onFilterTap: (newValue) {
                  setState(() {
                    _veganStatus = newValue;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
