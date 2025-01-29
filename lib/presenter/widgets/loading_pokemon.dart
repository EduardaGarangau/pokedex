import 'package:flutter/material.dart';

class LoadingPokemon extends StatelessWidget {
  const LoadingPokemon({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final height = mediaQuery.height;
    final width = mediaQuery.width;

    return Positioned(
      bottom: height / 1.95,
      right: width / 2.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'LOADING...',
            style: TextStyle(
              color: Colors.purple.shade800,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 5), 
          SizedBox(
            width: 150,
            child: LinearProgressIndicator(
              minHeight: 8,
              backgroundColor: Colors.white,
              color: Colors.purple.shade800,
            ),
          ),
        ],
      ),
    );
  }
}
