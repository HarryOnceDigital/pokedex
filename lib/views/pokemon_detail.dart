import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';

class PokemonDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetail({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              pokemon.imageUrl,
              width: 400, // Tamaño de la imagen
              height: 400,
            ),
            Text("Nombre: ${pokemon.name}"),
            // Aquí se puede agregar más información
          ],
        ),
      ),
    );
  }
}
