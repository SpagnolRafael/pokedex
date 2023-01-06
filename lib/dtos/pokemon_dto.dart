import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/dtos/images_about.dart';
import 'package:pokedex/dtos/official_art.dart';
import 'package:pokedex/dtos/sprites.dart';
import 'package:pokedex/dtos/stat.dart';
import 'package:pokedex/dtos/stats.dart';
import 'package:pokedex/dtos/type.dart';
import 'package:pokedex/dtos/types.dart';
import 'package:pokedex/shared/app_colors.dart';

part 'pokemon_dto.g.dart';

enum ElementType { water, fire, earth, wind, stone, normal }

extension ElementTypeExt on ElementType {
  static ElementType fromType(String type) {
    if (type == 'water') return ElementType.water;
    if (type == 'fire') return ElementType.fire;
    if (type == 'earth') return ElementType.earth;
    if (type == 'wind') return ElementType.wind;
    if (type == 'stone') return ElementType.stone;
    return ElementType.normal;
  }

  static String label(ElementType type) {
    switch (type) {
      case ElementType.water:
        return "Agua";
      case ElementType.fire:
        return "Fogo";
      case ElementType.earth:
        return "Terra";
      case ElementType.wind:
        return "Ar";
      case ElementType.stone:
        return "Pedra";
      case ElementType.normal:
        return "Normal";
    }
  }

  static Color color(ElementType type) {
    switch (type) {
      case ElementType.water:
        return AppColors.elementWater;
      case ElementType.fire:
        return AppColors.elementFire;
      case ElementType.earth:
        return AppColors.elementEarth;
      case ElementType.wind:
        return AppColors.elementWind;
      case ElementType.stone:
        return AppColors.elementStone;
      case ElementType.normal:
        return AppColors.elementNormal;
    }
  }
}

@JsonSerializable()
class Pokemon {
  final int? id;
  final List<Types> types;
  final String name;
  final List<Stats> stats;
  final Sprites sprites;
  Pokemon({
    this.id,
    required this.types,
    required this.name,
    required this.stats,
    required this.sprites,
  });
  factory Pokemon.fixture() => Pokemon(
        id: 15,
        types: [
          Types(
            type: Type(name: 'water'),
          )
        ],
        name: 'Charmeleon',
        stats: [
          Stats(baseStats: 64, stat: Stat('attack')),
        ],
        sprites: Sprites(
            frontDefaultImage: '',
            other: ImagesAbout(officialArt: OfficialArt(frontDefault: ''))),
      );

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}
