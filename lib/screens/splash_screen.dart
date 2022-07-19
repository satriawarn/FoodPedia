import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import '../models/foodpedia_pages.dart';
import '../models/models.dart';

class SplashScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: FoodPediaPages.splashPath,
      key: ValueKey(FoodPediaPages.splashPath),
      child: const SplashScreen(),
    );
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<AppStateManager>(context, listen: false).initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              height: 200,
              image: AssetImage('assets/foodpedia_assets/logo.png'),
            ),
            Text('Initializing...'),
          ],
        ),
      ),
    );
  }
}
