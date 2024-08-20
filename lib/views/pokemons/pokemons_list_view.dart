import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:poketry/data/providers/pokemon_provider.dart';
import 'package:poketry/views/pokemons/pokemons_list_tile.dart';
import 'package:provider/provider.dart';

class PokemonsListView extends StatefulWidget {
  const PokemonsListView({super.key});

  @override
  State<PokemonsListView> createState() => _PokemonsListView();
}

class _PokemonsListView extends State<PokemonsListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Provider.of<PokemonProvider>(context, listen: false).getPokemon();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // scrolled to end of list, fetch more pokemons!
      Provider.of<PokemonProvider>(context, listen: false).getPokemon();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: Provider.of<PokemonProvider>(context, listen: false).refresh,
      child: Consumer<PokemonProvider>(
        builder: (context, pokePorvider, child) {
          if (pokePorvider.pokemons.isEmpty) {
            if (pokePorvider.isLoading) {
              // centered / full screen on initial load
              return const Center(child: CircularProgressIndicator.adaptive());
            } else {
              return const Center(
                  child: AutoSizeText(
                      'Could not retrieve pokemon. Refresh to try again.'));
            }
          }

          return ListView.builder(
            controller: _scrollController,
            // Add 1 for the loading indicator at bottom of list
            itemCount: pokePorvider.pokemons.length + 1,
            itemBuilder: (context, index) {
              if (index == pokePorvider.pokemons.length) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Center(child: CircularProgressIndicator.adaptive()),
                );
              } else {
                return PokemonsListTile(pokemon: pokePorvider.pokemons[index]);
              }
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
