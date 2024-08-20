import 'package:flutter/material.dart';

class AppNavProvider extends ChangeNotifier {
  // Bottom Navbar items
  final List<NavigationDestination> _navItems = [
    const NavigationDestination(
      selectedIcon: Icon(Icons.pets),
      icon: Icon(Icons.pets_outlined),
      label: 'Pokémons',
    ),
    const NavigationDestination(
      selectedIcon: Icon(Icons.science),
      icon: Icon(Icons.science_outlined),
      label: 'Pokétry',
    ),
  ];
  List<NavigationDestination> get navItems => _navItems;

  // Default to Pokemons screen
  String _title = 'Pokémons';
  String get title => _title;
  set title(String newTitle) {
    _title = newTitle;
    notifyListeners();
  }

  int _index = 0;
  int get index => _index;
  set index(int newIndex) {
    _index = newIndex;
    _title = navItems[newIndex].label;
    notifyListeners();
  }
}
