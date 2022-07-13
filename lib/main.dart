import 'package:flutter/material.dart';

import 'foodpedia_theme.dart';
import 'home.dart';

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
      home: const Home(),
    );
  }
}
