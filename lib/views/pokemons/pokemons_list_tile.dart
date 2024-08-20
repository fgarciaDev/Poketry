import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:poketry/data/models/pokemon_model.dart';

class PokemonsListTile extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonsListTile({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        key: Key(pokemon.name),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey[300]!, // Adjust the color as needed
              width: 1, // Adjust the width as needed
            ),
          ),
        ),
        child: ListTile(
          key: Key('${pokemon.name}-tile'),
          contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          title: AutoSizeText(
            pokemon.name,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500),
            wrapWords: true,
            maxFontSize: 16,
            minFontSize: 10,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
