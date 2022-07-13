import 'package:flutter/material.dart';
import 'package:foodpedia/foodpedia_theme.dart';

class Card1 extends StatelessWidget {
  const Card1({Key? key}) : super(key: key);

  final String category = 'Editor\'s Choice';
  final String title = 'The Art of Dough';
  final String description = 'Learn to make the perfect bread.';
  final String chef = 'Dough Fundamental';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/mag1.png'), fit: BoxFit.cover),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Stack(
          children: [
            Text(
              category,
              style: FoodPediaTheme.darkTextTheme.bodyText1,
            ),
            Positioned(
                top: 20,
                child: Text(
                  title,
                  style: FoodPediaTheme.darkTextTheme.headline2,
                )),
            Positioned(
                bottom: 30,
                right: 0,
                child: Text(
                  description,
                  style: FoodPediaTheme.darkTextTheme.bodyText1,
                )),
            Positioned(
                bottom: 10,
                right: 0,
                child: Text(
                  chef,
                  style: FoodPediaTheme.darkTextTheme.bodyText1,
                ))
          ],
        ),
      ),
    );
  }
}
