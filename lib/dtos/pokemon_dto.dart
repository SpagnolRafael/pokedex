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

enum ElementType {
  water,
  fire,
  wind,
  rock,
  normal,
  fighting,
  flying,
  poison,
  ground,
  bug,
  ghost,
  steel,
  grass,
  electric,
  psychic,
  ice,
  dragon,
  dark,
  fairy,
  shadow,
  unknown,
}

extension ElementTypeExt on ElementType {
  static ElementType fromType(String type) {
    if (type == 'water') return ElementType.water;
    if (type == 'fire') return ElementType.fire;
    if (type == 'earth') return ElementType.ground;
    if (type == 'wind') return ElementType.wind;
    if (type == 'stone') return ElementType.rock;
    if (type == 'flying') return ElementType.flying;
    if (type == 'fighting') return ElementType.fighting;
    if (type == 'poison') return ElementType.poison;
    if (type == 'bug') return ElementType.bug;
    if (type == 'ghost') return ElementType.ghost;
    if (type == 'steel') return ElementType.steel;
    if (type == 'grass') return ElementType.grass;
    if (type == 'electric') return ElementType.electric;
    if (type == 'psychic') return ElementType.psychic;
    if (type == 'ice') return ElementType.ice;
    if (type == 'dragon') return ElementType.dragon;
    if (type == 'dark') return ElementType.dark;
    if (type == 'fairy') return ElementType.fairy;
    if (type == 'shadow') return ElementType.shadow;
    return ElementType.normal;
  }

  static String label(ElementType type) {
    switch (type) {
      case ElementType.water:
        return "Agua";
      case ElementType.fire:
        return "Fogo";
      case ElementType.wind:
        return "Ar";
      case ElementType.rock:
        return "Pedra";
      case ElementType.fighting:
        return "Lutador";
      case ElementType.flying:
        return "Voador";
      case ElementType.poison:
        return "Veneno";
      case ElementType.ground:
        return "Terra";
      case ElementType.bug:
        return "Inseto";
      case ElementType.ghost:
        return "Fantasma";
      case ElementType.steel:
        return "Aço";
      case ElementType.grass:
        return "Mato";
      case ElementType.electric:
        return "Eletrico";
      case ElementType.psychic:
        return "Psíquico";
      case ElementType.ice:
        return "Gelo";
      case ElementType.dragon:
        return "Dragão";
      case ElementType.dark:
        return "Escuridão";
      case ElementType.fairy:
        return "Fada";
      case ElementType.shadow:
        return "Sombrio";
      case ElementType.unknown:
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
      case ElementType.ground:
        return AppColors.elementEarth;
      case ElementType.wind:
        return AppColors.elementWind;
      case ElementType.rock:
        return AppColors.elementStone;
      case ElementType.flying:
        return AppColors.elementFlying;
      case ElementType.poison:
        return AppColors.elementPoison;
      case ElementType.bug:
        return AppColors.elementBug;
      case ElementType.ghost:
        return AppColors.elementGhost;
      case ElementType.steel:
        return AppColors.elementSteel;
      case ElementType.grass:
        return AppColors.elementGrass;
      case ElementType.electric:
        return AppColors.elementElectric;
      case ElementType.ice:
        return AppColors.elementIce;
      case ElementType.dragon:
        return AppColors.elementDragon;
      case ElementType.shadow:
      case ElementType.dark:
        return AppColors.elementShadow;
      case ElementType.fairy:
        return AppColors.elementFairy;
      case ElementType.normal:
      case ElementType.fighting:
      case ElementType.unknown:
      case ElementType.psychic:
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
