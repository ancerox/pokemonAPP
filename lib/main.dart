import 'package:flutter/material.dart';
import 'package:pokemon_app/features/pick_your_pokemon/domain/usecase/get_random_pokemons.dart';
import 'package:pokemon_app/injection.dart';
import 'package:provider/provider.dart';

import 'core/route_generator.dart';
import 'features/pick_your_pokemon/presentation/provider/pokemon._provider.dart';

import 'features/pick_your_pokemon/presentation/screens/home_page.dart';
import 'features/pick_your_pokemon/presentation/screens/splash_page.dart';
import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => PokemonProvider(locator<GetRandomPokemons>()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        title: 'Flutter Demo',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: SplashScreen(),
      ),
    );
  }
}
