import 'package:pokedex/domain/entities/stat_entity.dart';

class PokemonAggregate {
  final int id; 
  final String name; 
  final int weight;
  final int height; 
  final String image; 
  final List<StatEntity> stats; 

  PokemonAggregate({
    required this.id, 
    required this.name, 
    required this.weight, 
    required this.height, 
    required this.image, 
    required this.stats
  });

  factory PokemonAggregate.fromMap(Map<String, dynamic> map) {
    return PokemonAggregate(
      id: map['id'],
      name: map['name'],
      weight: map['weight'],
      height: map['height'],
      image: map['sprites']['front_default'],
      stats: (map['stats'] as List).map((e) => StatEntity.fromMap(e)).toList()
    );
  }
}