import 'package:flutter/material.dart';
import 'package:meals_app/main.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:meals_app/widgets/settings_alert_dialogue.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({
    super.key,
    required this.changeThemeSeed,
  });

  final void Function(Color) changeThemeSeed;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentPageIndex = 0;
  Color _selectedThemeColour = kSeedColour;
  final List<Meal> _favouriteMeals = [];
  Map<Filter, bool> currentFilters = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  };

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
      ),
    );
  }

  void _toggleMealFavouriteStatus(Meal meal) {
    final bool isExisting = _favouriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favouriteMeals.remove(meal);
        _showInfoMessage('Removed from Favourites');
      });
    } else {
      setState(() {
        _favouriteMeals.add(meal);
        _showInfoMessage('Added to Favourites');
      });
    }
  }

  void onBottomNavigationBarItemTap(index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  void setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Meals') {
      setState(() {
        _currentPageIndex = 0;
      });
    }
    if (identifier == 'Filters') {
      final filterResult = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return FiltersScreen(
              activeFilters: currentFilters,
            );
          },
        ),
      );
      setState(() {
        currentFilters = filterResult;
      });
    }
  }

  void _openSettings() {
    showDialog(
      context: context,
      builder: (context) {
        return CustomAlertDialogue(
          onSelectAppColour: (colour) {
            setState(() {
              widget.changeThemeSeed(colour);
              _selectedThemeColour = colour;
            });
            Navigator.of(context).pop();
          },
          currentThemeColour: _selectedThemeColour,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoriesScreen(
      currentFilters: currentFilters,
      onToggleFavourite: _toggleMealFavouriteStatus,
    );
    String activePageTitle = 'Meal Categories';

    if (_currentPageIndex == 1) {
      activeScreen = MealsScreen(
        onToggleFavourite: _toggleMealFavouriteStatus,
        meals: _favouriteMeals,
      );
      activePageTitle = 'Your Favourites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
        actions: [
          InkWell(
            onTap: _openSettings,
            child: const Icon(Icons.settings),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      drawer: MainDrawer(
        onSelectScreen: setScreen,
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onBottomNavigationBarItemTap,
        currentIndex: _currentPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
