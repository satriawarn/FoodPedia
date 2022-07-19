import 'package:flutter/material.dart';
import 'package:foodpedia/models/user.dart';


class ProfileManager extends ChangeNotifier {
  User get getUser => User(
        firstName: 'Erik',
        lastName: 'Satriawan',
        role: 'Green Bean of Flutter',
        profileImageUrl: 'assets/profile_pics/author.jpg',
        darkMode: _darkMode,
        points: 100,
      );

  bool get didSelectUser => _didSelectUser;

  bool get didTapUrl => _didTapUrl;

  bool get darkMode => _darkMode;

  var _didSelectUser = false;
  var _didTapUrl = false;
  var _darkMode = false;

  set darkMode(bool darkMode) {
    _darkMode = darkMode;
    notifyListeners();
  }

  void tapUrl(bool selected) {
    _didTapUrl = selected;
    notifyListeners();
  }

  void tapOnProfile(bool selected) {
    _didSelectUser = selected;
    notifyListeners();
  }
}
