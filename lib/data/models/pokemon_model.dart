class PokemonModel {
  final String name;
  final String url;

  PokemonModel({required this.name, required this.url});

  @override
  String toString() => 'Pokemon(name: $name, url: $url)';

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      PokemonModel(name: json['name'] as String, url: json['url'] as String);
}
