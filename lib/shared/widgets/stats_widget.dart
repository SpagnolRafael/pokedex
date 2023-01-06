import 'package:flutter/material.dart';
import 'package:pokedex/shared/app_colors.dart';

enum StatsType { life, attack, defense }

class StatsWidget extends StatelessWidget {
  final int stats;
  final StatsType type;
  const StatsWidget({required this.stats, required this.type, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.black,
      ),
      height: 7.94,
      width: stats * 203.55 / 100,
      child: Container(
        height: 7.94,
        width: stats * .99,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: type == StatsType.life
              ? AppColors.life
              : type == StatsType.attack
                  ? AppColors.attack
                  : AppColors.defense,
        ),
      ),
    );
  }
}
