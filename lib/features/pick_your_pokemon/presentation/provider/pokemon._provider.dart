import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/core/errors/failure.dart';
import 'package:pokemon_app/features/pick_your_pokemon/domain/entity/pokemon.dart';

import '../../data/model/pokemon_response.dart';
import '../../domain/usecase/get_random_pokemons.dart';

class PokemonProvider extends ChangeNotifier {
  late Pokemon pokemon;
  late String imgUrl;

  GetRandomPokemons getRandomPokemonUseCase;

  PokemonProvider(this.getRandomPokemonUseCase);

  Future getRandonPokemon() async {
    Either<Failure, Pokemon> pokemonOrFailureData =
        await getRandomPokemonUseCase.getPokemons();

    return pokemonOrFailureData.fold((l) => false, (newPokemon) {
      pokemon = newPokemon;
      notifyListeners();

      return true;
    });
  }
}
