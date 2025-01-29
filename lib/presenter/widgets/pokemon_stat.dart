import 'package:flutter/material.dart';

class PokemonStat extends StatelessWidget {
  final String name;
  final int value;
  final Color color; 

  const PokemonStat({
    super.key,
    required this.name,
    required this.value,
    required this.color, 
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '$name:',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: width / 2, 
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey.shade300,
            value: value / 100,
           color: color,
           minHeight: 8,
           borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }
}
