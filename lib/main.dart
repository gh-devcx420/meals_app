import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'package:meals_app/theme.dart';

Color kSeedColour = const Color.fromARGB(255, 191, 0, 255);

void main() {
  runApp(
    const ProviderScope(
      child: MealsApp(),
    ),
  );
}

class MealsApp extends StatefulWidget {
  const MealsApp({super.key});

  @override
  State<MealsApp> createState() => _MealsAppState();
}

class _MealsAppState extends State<MealsApp> {
  late ThemeData lightTheme;
  late ThemeData darkTheme;
  final TextStyle kMealsAppTextStyle = const TextStyle(
    fontFamily: 'Lato',
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
  );

  ColorScheme generateColourScheme(Brightness brightness) {
    return ColorScheme.fromSeed(
      seedColor: kSeedColour,
      brightness: brightness,
    );
  }

  void changeSeedColour(Color newSeed) {
    setState(() {
      kSeedColour = newSeed;
      initializeThemes();
    });
  }

  @override
  void initState() {
    super.initState();
    initializeThemes();
  }

  void initializeThemes() {
    final lightColorScheme = generateColourScheme(Brightness.light);
    final darkColorScheme = generateColourScheme(Brightness.dark);

    lightTheme = AppTheme.mealAppLightTheme(
      lightColorScheme,
      kMealsAppTextStyle,
    );
    darkTheme = AppTheme.mealAppDarkTheme(
      darkColorScheme,
      kMealsAppTextStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: TabsScreen(
        changeThemeSeed: changeSeedColour,
      ),
    );
  }
}
