import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Importamos la vista principal
import 'package:pokedex/views/pokemon_view.dart';

void main() {
  runApp(GetMaterialApp(
    //Configura la vista principal
    home: PokemonView(),
  ));
}
