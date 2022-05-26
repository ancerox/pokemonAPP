import 'package:dartz/dartz.dart';
import 'package:pokemon_app/features/pick_your_pokemon/domain/entity/pokemon.dart';

import '../../../../core/errors/failure.dart';
import '../repository/pokemon_repository.dart';

class GetRandomPokemons {
  final PokemonRepository pokemonRepository;

  const GetRandomPokemons(this.pokemonRepository);

  Future<Either<Failure, Pokemon>> getPokemons() async {
    return await pokemonRepository.getRandomPokemon();
  }
}
