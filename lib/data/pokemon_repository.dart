import 'package:dio/dio.dart';
import 'package:pokedex/domain/aggregates/pokemon_aggregate.dart';

class PokemonRepository {
  final Dio _dio;

  PokemonRepository(this._dio);

  Future<PokemonAggregate> getPokemon(int id) async {
    final response = await _dio.get('https://pokeapi.co/api/v2/pokemon/$id');
    return PokemonAggregate.fromMap(response.data);
  }
}
