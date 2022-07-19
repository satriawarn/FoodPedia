import 'package:flutter/material.dart';

import '../models/foodpedia_pages.dart';
import '../models/models.dart';
import '../models/profile_manager.dart';
import '../screens/screens.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppStateManager appStateManager;
  final GroceryManager groceryManager;
  final ProfileManager profileManager;

  AppRouter({
    required this.appStateManager,
    required this.groceryManager,
    required this.profileManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
    groceryManager.addListener(notifyListeners);
    profileManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    groceryManager.removeListener(notifyListeners);
    profileManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if (!appStateManager.isInitialized) SplashScreen.page(),
        if (appStateManager.isInitialized && !appStateManager.isLoggedIn)
          LoginScreen.page(),
        if (appStateManager.isLoggedIn && !appStateManager.isOnboardingComplete)
          OnboardingScreen.page(),
        if (appStateManager.isOnboardingComplete)
          Home.page(appStateManager.getSelectedTab),
        if (groceryManager.isCreatingNewItem)
          GroceryItemScreen.page(onCreate: (item) {
            groceryManager.addItem(item);
          }, onUpdate: (item, index) {
            // No update
          }),
        // // 1
        // if (groceryManager.selectedIndex != -1)
        // // 2
        //   GroceryItemScreen.page(
        //       item: groceryManager.selectedGroceryItem,
        //       index: groceryManager.selectedIndex,
        //       onUpdate: (item, index) {
        //         // 3
        //         groceryManager.updateItem(item, index);
        //       },
        //       onCreate: (_) {
        //         // No create
        //       }),
        if (profileManager.didSelectUser)
          ProfileScreen.page(profileManager.getUser),
        if (profileManager.didTapUrl) WebViewScreen.page()
      ],
    );
  }

  bool _handlePopPage(// 1
      Route<dynamic> route,
      // 2
      result) {
    // 3
    if (!route.didPop(result)) {
      // 4
      return false;
    }

    // 5
    if (route.settings.name == FoodPediaPages.onboardingPath) {
      appStateManager.logout();
    }
    if (route.settings.name == FoodPediaPages.groceryItemDetails) {
      groceryManager.groceryItemTapped(-1);
    }

    if (route.settings.name == FoodPediaPages.profilePath) {
      profileManager.tapOnProfile(false);
    }

    if (route.settings.name == FoodPediaPages.urlPath) {
      profileManager.tapUrl(false);
    }
    return true;
  }

  // 9
  @override
  Future<void> setNewRoutePath(configuration) async => null;
}