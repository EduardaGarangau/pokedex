import 'package:flutter/material.dart';
import 'package:pokedex/domain/aggregates/pokemon_aggregate.dart';
import 'package:pokedex/domain/entities/stat_entity.dart';
import 'package:pokedex/presenter/utils/string_extension.dart';
import 'package:pokedex/presenter/widgets/pokemon_button.dart';
import 'package:pokedex/presenter/widgets/pokemon_image.dart';
import 'package:pokedex/presenter/widgets/pokemon_name.dart';
import 'package:pokedex/presenter/widgets/pokemon_stat.dart';

class Pokemon extends StatelessWidget {
  final PokemonAggregate pokemon;
  final VoidCallback onNextTap;
  final VoidCallback onPreviousTap;

  const Pokemon({
    super.key,
    required this.pokemon,
    required this.onNextTap,
    required this.onPreviousTap,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final height = mediaQuery.height;
    final width = mediaQuery.width;

    return Positioned(
      top: height / 3,
      left: width / 8,
      child: SizedBox(
        height: height / 2.05,
        width: width / 1.5,
        child: Column(
          children: [
            PokemonImage(
              image: pokemon.image,
            ),
            const SizedBox(height: 10),
            PokemonName(
              id: pokemon.id,
              name: pokemon.name.capitalize(),
            ),
            const SizedBox(
              height: 50,
            ),
            ...pokemon.stats.where((stat) => stat.stat != StatType.other).map(
                  (stat) => PokemonStat(
                    name: stat.name,
                    value: stat.value,
                    color: stat.color,
                  ),
                ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (pokemon.id > 1)
                  PokemonButton(
                    label: 'PREVIOUS',
                    onTap: onPreviousTap,
                  ),
                PokemonButton(
                  label: 'NEXT',
                  onTap: onNextTap,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
