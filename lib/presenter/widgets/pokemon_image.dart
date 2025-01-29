import 'package:flutter/material.dart';

class PokemonImage extends StatelessWidget {
  final String image;

  const PokemonImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      height: 180,
      width: 180,
      fit: BoxFit.cover,
    );
  }
}
