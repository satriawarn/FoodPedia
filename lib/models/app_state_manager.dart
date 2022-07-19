import 'dart:async';
import 'package:flutter/material.dart';

class FoodpediaTab {
  static const int explore = 0;
  static const int recipes = 1;
  static const int toBuy = 2;
}

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;

  bool _loggedIn = false;

  bool _onboardingComplete = false;

  int _selectedTab = FoodpediaTab.explore;

  bool get isInitialized => _initialized;

  bool get isLoggedIn => _loggedIn;

  bool get isOnboardingComplete => _onboardingComplete;

  int get getSelectedTab => _selectedTab;

  void initializeApp() {
    Timer(const Duration(milliseconds: 2000), () {
      _initialized = true;
      notifyListeners();
    });
  }

  void login(String name, String password) {
    _loggedIn = true;
    notifyListeners();
  }

  void completeOnboarding() {
    _onboardingComplete = true;
    notifyListeners();
  }

  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

  void goToRecipes() {
    _selectedTab = FoodpediaTab.recipes;
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    _onboardingComplete = false;
    _initialized = false;
    _selectedTab = 0;

    initializeApp();
    notifyListeners();
  }
}
