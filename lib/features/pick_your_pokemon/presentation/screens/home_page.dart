import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entity/pokemon.dart';
import '../components/componets.dart';
import '../provider/pokemon._provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isRequested = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff010101),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  ImageListView(
                    startIndex: 1,
                    duration: 10,
                  ),
                  SizedBox(height: 10),
                  ImageListView(
                    startIndex: 6,
                    duration: 14,
                  ),
                  ImageListView(
                    startIndex: 9,
                    duration: 19,
                  ),
                  ImageListView(
                    startIndex: 14,
                    duration: 24,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: 24,
            right: 24,
            child: Container(
              height: 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pokemons',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'You are in dangerous, look into the best Pokemons to save your life.',
                    style: TextStyle(
                        height: 1.2, fontSize: 18, color: Colors.white70),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        isRequested = true;
                      });
                      await Provider.of<PokemonProvider>(context, listen: false)
                          .getRandonPokemon();

                      Navigator.pushNamed(context, '/pokemon');
                      setState(() {
                        isRequested = false;
                      });
                    },
                    child: Container(
                      width: 140,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xff3000ff)),
                      child: isRequested
                          ? Center(child: CircularProgressIndicator())
                          : Text('I feel Lucky',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
