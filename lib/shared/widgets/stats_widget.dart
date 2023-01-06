import 'package:flutter/material.dart';
import 'package:pokedex/shared/app_colors.dart';

enum StatsType { life, attack, defense }

class StatsWidget extends StatelessWidget {
  final int stats;
  final StatsType type;
  const StatsWidget({required this.stats, required this.type, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: Colors.white,
          ),
          height: 7.94,
          width: 203.55,
        ),
        Container(
          height: 7.94,
          width: stats * 203.55 / 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: type == StatsType.life
                ? AppColors.life
                : type == StatsType.attack
                    ? AppColors.attack
                    : AppColors.defense,
          ),
        ),
      ],
    );
  }
}

    //LARGURA 203.55 (PELO FIGMA)

    //203.55 - 100%
    // X - 45%
