import 'package:flutter/material.dart';

enum StatType {
  hp, 
  attack, 
  defense, 
  speed, 
  other, 
}

class StatEntity {
  final StatType stat;
  final int value; 

  StatEntity({
    required this.stat,
    required this.value,
  }); 

  factory StatEntity.fromMap(Map<String, dynamic> map) {
    final name = map['stat']['name'] as String;
    final stat = _getType(name); 

    return StatEntity(
      stat: stat, 
      value: map['base_stat'] as int,
    );
  }

  Color get color {
    switch (stat) {
      case StatType.hp: 
        return Colors.green;
      case StatType.attack:
        return Colors.redAccent.shade400; 
      case StatType.defense:
        return Colors.yellow.shade600;
      case StatType.speed: 
        return Colors.purple;
      case StatType.other:
        return Colors.grey;
    }
  }

  String get name {
    switch (stat) {
      case StatType.hp: 
        return 'HP'; 
      case StatType.attack:
        return 'ATTACK';  
      case StatType.defense:
        return 'DEFENSE';
      case StatType.speed: 
        return 'SPEED';
      case StatType.other:
        return '';
    }
  }

  static StatType _getType(String name) {
    switch (name) {
      case 'hp':
        return StatType.hp;
      case 'attack':
        return StatType.attack;
      case 'defense':
        return StatType.defense;
      case 'speed':
        return StatType.speed;
      default: 
        return StatType.other;
    }
  }
}
