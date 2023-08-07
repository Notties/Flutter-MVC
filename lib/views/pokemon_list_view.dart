// lib/views/pokemon_list_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_mvc/controllers/pokemon_controller.dart';
import 'package:get/get.dart';

class PokemonListView extends StatelessWidget {
  PokemonListView({super.key});

  final PokemonController pokemonController = Get.put(PokemonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokémon List'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: pokemonController.pokemonList.length,
          itemBuilder: (context, index) {
            final pokemon = pokemonController.pokemonList[index];
            return ListTile(
              title: Text(pokemon.name),
              leading: Image.network(pokemon.imageUrl),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pokemonController.fetchPokemons();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
