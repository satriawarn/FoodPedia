import 'package:flutter/material.dart';
import 'package:foodpedia/api/mock_foodpedia_service.dart';
import 'package:foodpedia/components/components.dart';

import '../models/simple_recipe.dart';

class RecipeScreen extends StatelessWidget {
  final exploreService = MockFoodPediaService();

  RecipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: exploreService.getRecipes(),
        builder: (context, AsyncSnapshot<List<SimpleRecipe>> result) {
          if (result.connectionState == ConnectionState.done) {
            return RecipesGridView(recipes: result.data ?? []);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
