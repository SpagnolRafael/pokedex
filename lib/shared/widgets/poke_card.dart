import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/dtos/pokemon_dto.dart';
import 'package:pokedex/shared/app_colors.dart';
import 'package:pokedex/shared/assets.dart';
import 'package:pokedex/shared/widgets/filter_element_widget.dart';

class PokeCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokeCard({required this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, '/poke-details', arguments: pokemon),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                blurRadius: 15,
                offset: const Offset(0, 4),
                color: AppColors.iconGrey.withOpacity(.5),
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 2.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${pokemon.name[0].toUpperCase()}${pokemon.name.substring(1).toLowerCase()}',
                    style: GoogleFonts.getFont(
                      'Nunito',
                      textStyle: const TextStyle(
                        fontFamily: 'Nunito',
                        color: AppColors.pokecardTitle,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3.4),
                  FilterElementType(
                    label: ElementTypeExt.label(ElementTypeExt.fromType(
                        pokemon.types.length > 1
                            ? pokemon.types[1].type.name
                            : pokemon.types[0].type.name)),
                    color: ElementTypeExt.color(ElementTypeExt.fromType(
                        pokemon.types.length > 1
                            ? pokemon.types[1].type.name
                            : pokemon.types[0].type.name)),
                  ),
                  const SizedBox(height: 5.6),
                  Text(
                    '#00${pokemon.id}',
                    style: GoogleFonts.getFont(
                      'Nunito',
                      textStyle: const TextStyle(
                        fontFamily: 'Nunito',
                        color: AppColors.pokecardTitle,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(Assets.pokeBg, width: 75),
                    Image.network(
                      pokemon.sprites.frontDefaultImage,
                      width: 80,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
