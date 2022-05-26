import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:pokemon_app/features/pick_your_pokemon/data/model/pokemon_response.dart';

abstract class PokemonRemoteDataSource {
  Future<PokemonResponse> getRandomPokemon();
}

class PokemonRemoteDataSourceIMPL extends PokemonRemoteDataSource {
  final Dio dio;
  PokemonRemoteDataSourceIMPL(this.dio);

  @override
  Future<PokemonResponse> getRandomPokemon() async {
    var rng = Random();
    final pokemonN = rng.nextInt(140).toString();

    final baseUrl = 'https://pokeapi.co/api/v2/pokemon/$pokemonN';

    final response = await dio.get(baseUrl);

    final img =
        response.data['sprites']['other']['dream_world']['front_default'];

    final pokemon = PokemonResponse.fromJson(response.data);

    pokemon.image = img;

    return pokemon;
  }
}
