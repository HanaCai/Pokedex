import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'new_pokemon_model.g.dart';

@HiveType(typeId: 5)
class NewPokemonModel extends HiveObject {
  static const String boxKey = 'new_pokemon_model';

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String category;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final List<String> type;

  @HiveField(4)
  final Uint8List image;

  @HiveField(5)
  final int quantity;

  @HiveField(6)
  final int color;

  NewPokemonModel({
    required this.name,
    required this.category,
    required this.description,
    required this.type,
    required this.image,
    required this.quantity,
    required this.color,
  });
}
