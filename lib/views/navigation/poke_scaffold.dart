import 'package:flutter/material.dart';
import 'package:poketry/data/providers/app_nav_provider.dart';
import 'package:poketry/views/navigation/poke_app_bar.dart';
import 'package:poketry/views/navigation/poke_bottom_nav.dart';
import 'package:poketry/views/pokemons/pokemons_list_view.dart';
import 'package:poketry/views/poketry/poketry_view.dart';
import 'package:provider/provider.dart';

class PokeScaffold extends StatefulWidget {
  const PokeScaffold({super.key});

  @override
  State<PokeScaffold> createState() => _PokeScaffoldState();
}

class _PokeScaffoldState extends State<PokeScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PokeAppBar(),
        bottomNavigationBar: const PokeBottomNav(),
        body: Container(
          color: Colors.grey[100],
          child: SafeArea(
            child: [
              /// Pokemons page
              const PokemonsListView(),

              /// Research page
              const PoketryView(),
            ][Provider.of<AppNavProvider>(context).index],
          ),
        ));
  }
}
