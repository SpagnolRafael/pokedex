import 'package:flutter/material.dart';
import 'package:pokedex/shared/app_colors.dart';
import 'package:pokedex/shared/assets.dart';

class Header extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  const Header({required this.icon, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: onTap,
          child: Icon(
            icon,
            color: AppColors.title,
          ),
        ),
        Image.asset(Assets.logo),
        Image.asset(
          Assets.userProfile,
        ),
      ],
    );
  }
}
