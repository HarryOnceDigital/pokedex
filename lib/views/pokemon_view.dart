import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Importa el controlador GetX el cual inyecta la dependencia
import 'package:pokedex/controller/pokemon_controller.dart';
import 'package:pokedex/views/pokemon_detail.dart';

// ignore: use_key_in_widget_constructors
class PokemonView extends StatelessWidget {
  //inyectamos la dependencia del controller
  final PokemonController controller = Get.put(PokemonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex por Harry Olvera'),
      ),
      body: Obx(
        () {
          if (controller.pokemonList.isEmpty) {
            return const Center(
              // Muestra un indicador de carga si la lista está vacía
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: controller.pokemonList.length,
              itemBuilder: (context, index) {
                final pokemon = controller.pokemonList[index];
                final pokemonNumber = (index + 1)
                    .toString()
                    .padLeft(3, '0'); // Añade el número de Pokémon

                return InkWell(
                  onTap: () {
                    Get.to(PokemonDetail(pokemon: pokemon));
                  },
                  child: Card(
                    elevation: 4, // Agrega una sombra para resaltar el elemento
                    // ignore: prefer_const_constructors
                    margin: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16), // Agrega espacio entre elementos
                    child: ListTile(
                      leading:
                          Text(pokemonNumber), // Muestra el número de Pokémon
                      title: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: pokemon.imageUrl,
                            width: 50,
                            height: 50,
                          ),
                          // ignore: prefer_const_constructors
                          SizedBox(
                              width:
                                  10), // Añade espacio entre la imagen y el nombre
                          Text(pokemon.name),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
