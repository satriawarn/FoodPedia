import 'package:flutter/material.dart';
import 'package:foodpedia/models/profile_manager.dart';
import 'package:provider/provider.dart';

import 'foodpedia_theme.dart';
import 'models/app_state_manager.dart';
import 'models/grocery_manager.dart';
import 'models/tab_manager.dart';
import 'navigation/app_router.dart';

void main() {
  runApp(const FoodPedia());
}

class FoodPedia extends StatefulWidget {
  const FoodPedia({Key? key}) : super(key: key);

  @override
  State<FoodPedia> createState() => _FoodPediaState();
}

class _FoodPediaState extends State<FoodPedia> {
  final _groceryManager = GroceryManager();
  final _profileManager = ProfileManager();
  final _appStateManager = AppStateManager();
  late AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter(
        appStateManager: _appStateManager,
        groceryManager: _groceryManager,
        profileManager: _profileManager);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _groceryManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _appStateManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _profileManager,
        ),
      ],
      child: Consumer<ProfileManager>(
        builder: (context, profileManager, child) {
          ThemeData theme;
          if (profileManager.darkMode) {
            theme = FoodPediaTheme.dark();
          } else {
            theme = FoodPediaTheme.light();
          }

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            title: 'FoodPedia',
            home: Router(
              routerDelegate: _appRouter,
              backButtonDispatcher: RootBackButtonDispatcher(),
            ),
          );
        },
      ),
    );
  }
}
