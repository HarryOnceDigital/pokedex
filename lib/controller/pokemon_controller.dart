import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// Importa el modelo de Pokémon
import 'package:pokedex/models/pokemon_model.dart';

class PokemonController extends GetxController {
  // Lista observable de Pokémon
  var pokemonList = <Pokemon>[].obs;

  @override
  void onInit() {
    // Llama a la función para obtener la lista de Pokémon al inicio
    fetchPokemonList();
    super.onInit();
  }

  void fetchPokemonList() async {
    final response = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=1008'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var pokemonData = data['results'] as List;
      pokemonList.value =
          pokemonData.map((pokemon) => Pokemon.fromJson(pokemon)).toList();
    }
  }
}
