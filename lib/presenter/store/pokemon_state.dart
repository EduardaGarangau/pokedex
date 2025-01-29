import 'package:pokedex/domain/aggregates/pokemon_aggregate.dart';

abstract class GetPokemonState {
  final int value;
  final PokemonAggregate? pokemon;
  final String? error;

  GetPokemonState(
    this.value,
    this.pokemon,
    this.error,
  );
}

class LoadingGetPokemonState extends GetPokemonState {
  LoadingGetPokemonState(
    int value,
  ) : super(value, null, null);
}

class InitialGetPokemonState extends GetPokemonState {
  InitialGetPokemonState() : super(0, null, null);
}

class SuccessGetPokemonState extends GetPokemonState {
  SuccessGetPokemonState(
    int value,
    PokemonAggregate pokemon,
  ) : super(value, pokemon, null);
}

class ErrorGetPokemonState extends GetPokemonState {
  ErrorGetPokemonState(
    int value,
    String error,
  ) : super(0, null, error);
}
