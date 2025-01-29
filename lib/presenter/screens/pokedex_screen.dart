import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/presenter/store/pokemon_bloc.dart';
import 'package:pokedex/presenter/store/pokemon_event.dart';
import 'package:pokedex/presenter/store/pokemon_state.dart';
import 'package:pokedex/presenter/widgets/loading_pokemon.dart';
import 'package:pokedex/presenter/widgets/pokedex_image.dart';
import 'package:pokedex/presenter/widgets/pokemon.dart';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen({super.key});

  @override
  State<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PokemonBloc>();
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF6ab7f5),
                  Color.fromRGBO(107, 220, 69, 1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          const PokedexImage(),
          // Conteúdo
          BlocBuilder<PokemonBloc, GetPokemonState>(
            builder: (context, state) {
              if (state is LoadingGetPokemonState) {
                return const LoadingPokemon();
              } else if (state is SuccessGetPokemonState) {
                return Pokemon(
                  pokemon: state.pokemon!,
                  onNextTap: () => bloc.add(NextPokemonEvent()),
                  onPreviousTap: () => bloc.add(PreviousPokemonEvent()),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
