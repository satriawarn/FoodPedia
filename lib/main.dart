import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'foodpedia_theme.dart';
import 'home.dart';
import 'models/grocery_manager.dart';
import 'models/tab_manager.dart';

void main() {
  runApp(const FoodPedia());
}

class FoodPedia extends StatelessWidget {
  const FoodPedia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = FoodPediaTheme.light();
    return MaterialApp(
        theme: theme,
        title: 'FoodPedia',
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => TabManager(),
            ),
            ChangeNotifierProvider(
              create: (context) => GroceryManager(),
            ),
          ],
          child: const Home(),
        ));
  }
}
