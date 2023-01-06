import 'package:dio/dio.dart';
import 'package:pokedex/dtos/pokemon_dto.dart';

class PokemonRepository {
  final Dio dio;
  PokemonRepository(this.dio);

  Future<Pokemon> getPokemon(String name) async {
    final pokeDetails =
        await dio.get('https://pokeapi.co/api/v2/pokemon/$name');

    return Pokemon.fromJson(pokeDetails.data);
  }

  Future<List<Pokemon>> getPokemons() async {
    final response = await dio.get('https://pokeapi.co/api/v2/pokemon/');
    final List<dynamic> a = response.data['results'];
    List<Pokemon> pokemons = [];
    final urls = a.map((e) => e['url']).toList();

    for (var url in urls) {
      var result = await dio.get(url);
      pokemons.add(Pokemon.fromJson(result.data));
    }
    return pokemons;
  }
}
