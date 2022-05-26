import 'package:pokemon_app/features/pick_your_pokemon/domain/entity/pokemon.dart';

import 'package:pokemon_app/core/errors/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/exceptions.dart';
import '../../domain/repository/pokemon_repository.dart';
import '../datasource/pokemon_remote_datasource.dart';

class PokemonRepositoryIMPL extends PokemonRepository {
  PokemonRemoteDataSource pokemonRemoteDataSource;

  PokemonRepositoryIMPL(this.pokemonRemoteDataSource);

  @override
  Future<Either<Failure, Pokemon>> getRandomPokemon() async {
    try {
      Pokemon pokemon = await pokemonRemoteDataSource.getRandomPokemon();

      return Right(pokemon);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
