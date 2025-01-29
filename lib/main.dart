import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/data/pokemon_repository.dart';
import 'package:pokedex/presenter/screens/pokedex_screen.dart';
import 'package:pokedex/presenter/store/pokemon_bloc.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(fontFamily: 'Oxanium'),
      home: BlocProvider(
        create: (_) => PokemonBloc(repository: PokemonRepository(Dio())),
        child: const PokedexScreen(),
      ),
    );
  }
}
