import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entity/pokemon.dart';

abstract class PokemonRepository {
  Future<Either<Failure, Pokemon>> getRandomPokemon();
}
