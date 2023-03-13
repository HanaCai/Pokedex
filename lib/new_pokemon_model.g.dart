// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_pokemon_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewPokemonModelAdapter extends TypeAdapter<NewPokemonModel> {
  @override
  final int typeId = 5;

  @override
  NewPokemonModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewPokemonModel(
      name: fields[0] as String,
      category: fields[1] as String,
      description: fields[2] as String,
      type: (fields[3] as List).cast<String>(),
      image: fields[4] as Uint8List,
      quantity: fields[5] as int,
      color: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, NewPokemonModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.quantity)
      ..writeByte(6)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewPokemonModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
