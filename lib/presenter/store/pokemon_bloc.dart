// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/data/pokemon_repository.dart';
import 'package:pokedex/domain/aggregates/pokemon_aggregate.dart';
import 'package:pokedex/presenter/store/pokemon_event.dart';
import 'package:pokedex/presenter/store/pokemon_state.dart';
import 'package:bloc/bloc.dart';

class PokemonBloc extends Bloc<PokemonEvent, GetPokemonState> {
  final PokemonRepository repository;

  PokemonBloc({required this.repository}) : super(InitialGetPokemonState()) {
    on<NextPokemonEvent>(_onNextPokemon);
    on<PreviousPokemonEvent>(_onPreviousPokemon);

    add(NextPokemonEvent());
  }

  Future<void> _onNextPokemon(PokemonEvent event, Emitter<GetPokemonState> emit) async {
    emit(LoadingGetPokemonState(state.value));
    final newValue = state.value + 1;
    try {
      final pokemon = await _getPokemon(newValue);
      emit(SuccessGetPokemonState(newValue, pokemon));
    } catch (e) {
      emit(ErrorGetPokemonState(
        state.value,
        'Ocorreu um erro! Tente novamente mais tarde.',
      ));
    }
  }

  Future<void> _onPreviousPokemon(PokemonEvent event, Emitter<GetPokemonState> emit) async {
    if (state.value <= 1) return;

    emit(LoadingGetPokemonState(state.value));
    final newValue = state.value - 1;
    try {
      final pokemon = await _getPokemon(newValue);
      emit(SuccessGetPokemonState(newValue, pokemon));
    } catch (e) {
      emit(ErrorGetPokemonState(
        state.value,
        'Ocorreu um erro! Tente novamente mais tarde.',
      ));
    }
  }

  Future<PokemonAggregate> _getPokemon(int value) async {
    return await repository.getPokemon(value);
  }
}
