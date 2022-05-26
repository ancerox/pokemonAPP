import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_app/features/pick_your_pokemon/data/datasource/pokemon_remote_datasource.dart';
import 'package:pokemon_app/features/pick_your_pokemon/data/repository/pokemon_repository_impl.dart';
import 'package:pokemon_app/features/pick_your_pokemon/domain/repository/pokemon_repository.dart';
import 'package:pokemon_app/features/pick_your_pokemon/domain/usecase/get_random_pokemons.dart';

import 'features/pick_your_pokemon/presentation/provider/pokemon._provider.dart';

final locator = GetIt.instance;

Future<void> init() async {
// Provider
  locator.registerLazySingleton(() => PokemonProvider(locator()));

// Use Case
  locator.registerLazySingleton(() => GetRandomPokemons(locator()));

// Repository
  locator.registerLazySingleton<PokemonRepository>(
      () => PokemonRepositoryIMPL(locator()));

// Data Resource
  locator.registerLazySingleton<PokemonRemoteDataSource>(
      () => PokemonRemoteDataSourceIMPL(locator()));

// External
  locator.registerLazySingleton(() => Dio());
}
