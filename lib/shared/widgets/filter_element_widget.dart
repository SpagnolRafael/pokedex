import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/shared/app_colors.dart';

class FilterElementType extends StatelessWidget {
  final double radius;
  final Color color;
  final String label;
  final void Function()? onTap;
  const FilterElementType(
      {required this.color,
      required this.label,
      this.onTap,
      this.radius = 5,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
        width: 66.95,
        height: 24,
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.getFont(
              'Nunito',
              textStyle: const TextStyle(
                fontFamily: 'Nunito',
                color: AppColors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
