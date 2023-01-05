import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/shared/app_colors.dart';
import 'package:pokedex/shared/widgets/custom_button.dart';
import 'package:pokedex/shared/assets.dart';
import 'package:pokedex/shared/screen_size.dart';

class WellcomeScreen extends StatelessWidget {
  const WellcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 13),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Image.asset(Assets.welcomeImage),
                  ),
                  Positioned(
                    left: 50,
                    child: Image.asset(Assets.logo),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Explore o mundo \ndos ',
                    style: GoogleFonts.getFont(
                      'Nunito',
                      textStyle: const TextStyle(
                        fontFamily: 'Nunito',
                        color: AppColors.title,
                        fontWeight: FontWeight.w700,
                        fontSize: 35,
                      ),
                    ),
                    children: [
                      TextSpan(
                        text: 'Pokémons',
                        style: GoogleFonts.getFont(
                          'Nunito',
                          textStyle: const TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600,
                            fontSize: 35,
                            color: AppColors.subtitle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Descubra todas as espécies de Pokémons',
                style: GoogleFonts.getFont(
                  'Nunito',
                  textStyle: const TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColors.title,
                  ),
                ),
              ),
              const SizedBox(height: 19),
              CustomButton(
                boxShadow: const [
                  BoxShadow(
                      color: AppColors.subtitle,
                      offset: Offset(0, 4),
                      blurRadius: 15),
                ],
                radius: 5,
                path: Assets.arrowNext,
                width: ScreenSize.width(context) * 60 / 100,
                text: 'Começar',
                color: AppColors.subtitle,
                style: GoogleFonts.getFont(
                  'Nunito',
                  textStyle: const TextStyle(
                    fontFamily: 'Nunito',
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                onTap: () => Navigator.pushNamed(context, '/home'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
