import 'package:flutter/material.dart';
import 'package:pokedex/shared/app_colors.dart';

enum ElementType { water, fire, earth, wind, stone, normal }

extension ElementTypeExt on ElementType {
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

class Pokemon {
  final ElementType type;
  Pokemon(this.type);
}
