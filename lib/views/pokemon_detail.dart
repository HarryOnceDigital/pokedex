import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pokedex/models/pokemon_model.dart';

class PokemonDetail extends StatefulWidget {
  final Pokemon pokemon;

  PokemonDetail({required this.pokemon});

  @override
  // ignore: library_private_types_in_public_api
  _PokemonDetailState createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  late Map<String, dynamic> pokemonDetails = {};
  late int pokemonId;

  @override
  void initState() {
    super.initState();
    pokemonId = extractIdFromUrl(widget.pokemon.url);
    loadPokemonDetails();
  }

  int extractIdFromUrl(String url) {
    final List<String> parts = url.split('/');
    return int.tryParse(parts[parts.length - 2]) ?? 0;
  }

  void loadPokemonDetails() async {
    final response = await http.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemonId'),
    );

    if (response.statusCode == 200) {
      setState(() {
        pokemonDetails = json.decode(response.body);
      });
    }
  }

  // Función para convertir decagramos (dag) a kilogramos (kg)
  double convertToKilograms(int weightInDag) {
    return weightInDag / 10.0; // 1 dag = 1 kg
  }

  // Función para convertir decímetros (dm) a metros (m)
  double convertToMeters(int heightInDm) {
    return heightInDm / 10.0; // 1 dm = 0.1 m
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokemon.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              widget.pokemon.imageUrl,
              width: 400,
              height: 400,
            ),
            Text("Nombre: ${widget.pokemon.name}"),
            if (pokemonDetails.isNotEmpty)
              Column(
                children: [
                  // Mostrar peso en kilogramos con un decimal
                  Text(
                      "Peso: ${convertToKilograms(pokemonDetails['weight']).toStringAsFixed(1)} kg"),
                  // Mostrar altura en metros con un decimal
                  Text(
                      "Altura: ${convertToMeters(pokemonDetails['height']).toStringAsFixed(1)} m"),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
