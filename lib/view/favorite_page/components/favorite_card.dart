import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/dtos/pokemon_dto.dart';
import 'package:pokedex/shared/app_colors.dart';
import 'package:pokedex/shared/widgets/filter_element_widget.dart';

class FavoriteCard extends StatelessWidget {
  final void Function(Pokemon pokemon)? callBack;
  final void Function()? onTap;
  final Pokemon pokemon;
  const FavoriteCard(
      {super.key, this.onTap, required this.pokemon, this.callBack});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final response = await Navigator.pushNamed(context, '/poke-details',
            arguments: pokemon);
        callBack!(pokemon);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: AppColors.white,
              boxShadow: const [
                BoxShadow(
                    blurRadius: 15,
                    offset: Offset(0, 4),
                    color: AppColors.iconGrey)
              ],
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              )),
          height: 70,
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(pokemon.sprites.frontDefaultImage),
              const VerticalDivider(width: 3, color: AppColors.iconGrey),
              const Spacer(),
              Column(
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
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      FilterElementType(
                        label: ElementTypeExt.label(ElementTypeExt.fromType(
                            pokemon.types[0].type.name)),
                        color: ElementTypeExt.color(ElementTypeExt.fromType(
                            pokemon.types[0].type.name)),
                      ),
                      const SizedBox(width: 5),
                      if (pokemon.types.length > 1)
                        FilterElementType(
                          label: ElementTypeExt.label(ElementTypeExt.fromType(
                              pokemon.types[1].type.name)),
                          color: ElementTypeExt.color(ElementTypeExt.fromType(
                              pokemon.types[1].type.name)),
                        ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: InkWell(
                  onTap: onTap,
                  child: const Icon(Icons.delete),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
