import 'package:flutter/material.dart';

import '../features/pick_your_pokemon/presentation/screens/home_page.dart';
import '../features/pick_your_pokemon/presentation/screens/pokemon_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {

      // If args is not of the correct type, return an error page.
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage());

      case '/pokemon':
        return MaterialPageRoute(builder: (_) => PokemonPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
