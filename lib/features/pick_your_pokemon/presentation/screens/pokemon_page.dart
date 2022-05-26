import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokemon_app/features/pick_your_pokemon/domain/entity/pokemon.dart';
import 'package:pokemon_app/features/pick_your_pokemon/presentation/components/blur_container.dart';
import 'package:pokemon_app/features/pick_your_pokemon/presentation/provider/pokemon._provider.dart';
import 'package:provider/provider.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

bool isRequested = false;
late Pokemon pokemon;
late PokemonProvider pokemonProvider;

class _PokemonPageState extends State<PokemonPage> {
  // @override
  // void initState() {
  //   pokemonProvider = Provider.of<PokemonProvider>(context, listen: false);

  //   pokemon = pokemonProvider.pokemon;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    pokemonProvider = Provider.of<PokemonProvider>(context, listen: false);
    pokemon = pokemonProvider.pokemon;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SafeArea(
                child: Center(
                  child: SvgPicture.network(
                    pokemon.image,
                    width: 320,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: BlurContainer(
                  child: Container(
                    alignment: Alignment.center,
                    width: 160,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text('Pokemon Savior',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              pokemon.name!,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _InfoTile(
                    title: pokemon.weight.toString() + 'KG',
                    subtitle: 'Net Weigth'),
                _InfoTile(
                    title: pokemon.height.toString() + 'M',
                    subtitle: 'Total Heigth'),
              ],
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () async {
              setState(() {
                isRequested = true;
              });
              await Provider.of<PokemonProvider>(context, listen: false)
                  .getRandonPokemon()
                  .then((_) {
                setState(() {
                  isRequested = false;
                });
              });
            },
            child: Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff3000ff),
              ),
              child: isRequested
                  ? Center(child: CircularProgressIndicator())
                  : Text(
                      'Try again',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 36),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          style: const TextStyle(
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
