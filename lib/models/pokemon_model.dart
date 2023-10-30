class Pokemon {
  final String name; //nombre del Pokémon
  final String url; //url del Pokémon
  late String imageUrl; //imagen del Pokémon

  Pokemon({
    required this.name,
    required this.url,
  }) {
    final int id = int.parse(url.split('/').elementAt(6));
    //imageUrl ='https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
    imageUrl =
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      url: json['url'],
    );
  }
}
