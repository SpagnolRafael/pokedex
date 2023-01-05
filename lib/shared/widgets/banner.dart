import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/shared/app_colors.dart';
import 'package:pokedex/shared/assets.dart';
import 'package:pokedex/shared/screen_size.dart';
import 'package:pokedex/shared/widgets/custom_textfield.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.bannerColor.withOpacity(.1),
        ),
        width: ScreenSize.width(context),
        height: 152,
        child: Padding(
          padding: const EdgeInsets.only(left: 14.0),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pokedéx',
                    style: GoogleFonts.getFont(
                      'Nunito',
                      textStyle: const TextStyle(
                        fontFamily: 'Nunito',
                        color: AppColors.title,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Todas as espécies de pokemons\nestão esperando por voce',
                    style: GoogleFonts.getFont(
                      'Nunito',
                      textStyle: const TextStyle(
                        fontFamily: 'Nunito',
                        color: AppColors.title,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 19),
                ],
              ),
              Image.asset(Assets.pikachu)
            ],
          ),
        ),
      ),
    );
  }
}
