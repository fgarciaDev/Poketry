class PokemonResponseModel {
  final int count;
  final String? nextUrl;
  final String? previousUrl;
  final List<dynamic> data;

  PokemonResponseModel(
      {required this.count,
      this.nextUrl,
      this.previousUrl,
      required this.data});

  factory PokemonResponseModel.fromJson(Map<String, dynamic> json) =>
      PokemonResponseModel(
          count: json['count'] as int,
          nextUrl: json['next'],
          previousUrl: json['previous'],
          data: json['results'] as List<dynamic>);
}
