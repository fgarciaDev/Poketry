import 'package:flutter/material.dart';
import 'package:poketry/data/providers/app_nav_provider.dart';
import 'package:provider/provider.dart';

class PokeBottomNav extends StatefulWidget {
  const PokeBottomNav({super.key});

  @override
  State<PokeBottomNav> createState() => _PokeBottomNavState();
}

class _PokeBottomNavState extends State<PokeBottomNav> {
  @override
  Widget build(BuildContext context) {
    final selectedIndex = Provider.of<AppNavProvider>(context).index;
    final navItems = Provider.of<AppNavProvider>(context).navItems;

    return NavigationBar(
      onDestinationSelected: (int newIndex) {
        setState(() {
          Provider.of<AppNavProvider>(context, listen: false).index = newIndex;
        });
      },
      selectedIndex: selectedIndex,
      destinations: navItems,
    );
  }
}
