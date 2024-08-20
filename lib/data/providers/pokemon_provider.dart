import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:poketry/data/api.dart';
import 'package:poketry/data/models/pokemon_model.dart';
import 'package:poketry/data/models/pokemon_response_model.dart';

const pokeApiBaseUrl = 'pokeapi.co';

class PokemonProvider extends ChangeNotifier {
  // Top level list of pokemons
  final List<PokemonModel> _pokemons = [];
  List<PokemonModel> get pokemons => _pokemons;

  // Query Params
  Map<String, String> _queryParams = {'offset': '0', 'limit': '20'};

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getPokemon() async {
    _isLoading = true;
    final response =
        await fetchData(pokeApiBaseUrl, '/api/v2/pokemon/', _queryParams);
    if (response.statusCode == 200) {
      try {
        //  decode the response into our response model
        final dynamic bodyData = jsonDecode(response.body);
        final pokemonResponse = PokemonResponseModel.fromJson(bodyData);

        // decode the results into a list of PokemonModel objects
        final pokemonData = pokemonResponse.data
            .map((data) => PokemonModel.fromJson(data))
            .toList();
        _pokemons.addAll(pokemonData);

        if (pokemonResponse.nextUrl != null &&
            pokemonResponse.nextUrl!.isNotEmpty) {
          // decode the nextUr params so they can be fetched next time
          Uri parsedUrl = Uri.parse(pokemonResponse.nextUrl!);
          // Get the query parameters as a map
          _queryParams = parsedUrl.queryParameters;
          debugPrint('Query Params: $_queryParams');
        }
      } catch (e) {
        debugPrint('ERROR: $e');
      }
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    _pokemons.removeRange(0, _pokemons.length);
    _queryParams = {'offset': '0', 'limit': '20'};
    getPokemon();
    notifyListeners();
  }
}
