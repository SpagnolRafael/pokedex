import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/shared/app_colors.dart';
import 'package:pokedex/shared/assets.dart';
import 'package:pokedex/shared/screen_size.dart';
import 'package:pokedex/shared/widgets/custom_textfield.dart';

class CustomBanner extends StatelessWidget {
  final TextEditingController controller;
  final void Function()? onTap;
  const CustomBanner({required this.controller, this.onTap, super.key});

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
                  Row(
                    children: [
                      CustomTextFormField(
                        controller: controller,
                      ),
                      InkWell(
                          onTap: onTap,
                          child: Container(
                            decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.subtitle,
                                      blurRadius: 15,
                                      offset: Offset(0, 4))
                                ],
                                color: AppColors.subtitle,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                )),
                            height: 31,
                            width: 40,
                            padding: const EdgeInsets.all(8),
                            child: SvgPicture.asset(Assets.customSearch),
                          ))
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.pikachu),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 60,
                      height: 4,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                            offset: Offset(0, 2),
                            color: AppColors.subtitle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
