import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/main.dart';
import 'package:meals_app/providers/favourites_provider.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:meals_app/widgets/settings_alert_dialogue.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({
    super.key,
    required this.changeThemeSeed,
  });

  final void Function(Color) changeThemeSeed;

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _currentPageIndex = 0;
  Color _selectedThemeColour = kSeedColour;
  Map<Filter, bool> currentFilters = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  };

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
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return const FiltersScreen();
          },
        ),
      );
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
    final availableMealsList = ref.watch(filteredMealsProvider);

    Widget activeScreen = CategoriesScreen(
      availableMeals: availableMealsList,
    );
    String activePageTitle = 'Meal Categories';

    if (_currentPageIndex == 1) {
      final favouriteMealList = ref.watch(favouriteMealsProvider);
      activeScreen = MealsScreen(
        meals: favouriteMealList,
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
