import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:flutter_mvc/models/pokemon_model.dart';

class PokemonController extends GetxController {
  RxList<Pokemon> pokemonList = <Pokemon>[].obs;

  Future<void> fetchPokemons() async {
    try {
      final response = await Dio().get('https://pokeapi.co/api/v2/pokemon');
      final List<dynamic> data = response.data['results'];

      pokemonList.assignAll(data.map((item) {
        return Pokemon(
          name: item['name'],
          imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${data.indexOf(item) + 1}.png',
        );
      }).toList());
    } catch (e) {
      print(e);
    }
  }
}
