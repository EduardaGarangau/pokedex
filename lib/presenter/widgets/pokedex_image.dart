import 'package:flutter/material.dart';

class PokedexImage extends StatelessWidget {
  const PokedexImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'lib/assets/pokedexm.png',
      fit: BoxFit.contain,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
