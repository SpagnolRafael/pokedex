import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/dtos/pokemon_dto.dart';
import 'package:pokedex/shared/app_colors.dart';
import 'package:pokedex/shared/screen_size.dart';
import 'package:pokedex/shared/widgets/filter_element_widget.dart';
import 'package:pokedex/shared/widgets/stats_widget.dart';
import 'package:pokedex/view/home_page/components/header.dart';

class PokeDetailsScreen extends StatefulWidget {
  final Pokemon? pokemon;
  const PokeDetailsScreen({this.pokemon, super.key});

  @override
  State<PokeDetailsScreen> createState() => _PokeDetailsScreenState();
}

class _PokeDetailsScreenState extends State<PokeDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pokeDetails = ModalRoute.of(context)!.settings.arguments as Pokemon;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                color: AppColors.pokeDetailImg,
                width: ScreenSize.width(context),
                height: ScreenSize.width(context) * 80 / 100,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 220,
                    child: Image.network(
                        pokeDetails.sprites.other?.officialArt.frontDefault ??
                            ''),
                  ),
                ),
              ),
              Header(
                icon: Icons.arrow_back_ios,
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 11),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${pokeDetails.name[0].toUpperCase()}${pokeDetails.name.substring(1).toLowerCase()}',
                    style: GoogleFonts.getFont(
                      'Nunito',
                      textStyle: const TextStyle(
                        fontFamily: 'Nunito',
                        color: AppColors.pokecardTitle,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cod: #00${pokeDetails.id ?? '#Não localizado'}',
                        style: GoogleFonts.getFont(
                          'Nunito',
                          textStyle: const TextStyle(
                            fontFamily: 'Nunito',
                            color: AppColors.pokecardTitle,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: FilterElementType(
                          label: ElementTypeExt.label(ElementTypeExt.fromType(
                              pokeDetails.types.length > 1
                                  ? pokeDetails.types[1].type.name
                                  : pokeDetails.types[0].type.name)),
                          color: ElementTypeExt.color(ElementTypeExt.fromType(
                              pokeDetails.types[1].type.name)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Descrição',
                    style: GoogleFonts.getFont(
                      'Nunito',
                      textStyle: const TextStyle(
                        fontFamily: 'Nunito',
                        color: AppColors.pokecardTitle,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                      '"Charmeleon destrói seus oponentes sem pena com suas garras afiadas. Torna-se agressivo quando encontra um oponente forte e então a chama na ponta da sua cauda queima intensamente em uma cor azulada."',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.getFont(
                        'Nunito',
                        textStyle: const TextStyle(
                          fontFamily: 'Nunito',
                          color: AppColors.pokecardTitle,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Vida',
                              style: GoogleFonts.getFont(
                                'Nunito',
                                textStyle: const TextStyle(
                                  fontFamily: 'Nunito',
                                  color: AppColors.pokecardTitle,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            const SizedBox(width: 71),
                            StatsWidget(
                                stats: pokeDetails.stats[0].baseStats!,
                                type: StatsType.life),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              'Defesa',
                              style: GoogleFonts.getFont(
                                'Nunito',
                                textStyle: const TextStyle(
                                  fontFamily: 'Nunito',
                                  color: AppColors.pokecardTitle,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            const SizedBox(width: 58),
                            StatsWidget(
                                stats: pokeDetails.stats[2].baseStats!,
                                type: StatsType.defense),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              'Ataque',
                              style: GoogleFonts.getFont(
                                'Nunito',
                                textStyle: const TextStyle(
                                  fontFamily: 'Nunito',
                                  color: AppColors.pokecardTitle,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            const SizedBox(width: 57),
                            Align(
                              alignment: Alignment.center,
                              child: StatsWidget(
                                  stats: pokeDetails.stats[1].baseStats!,
                                  type: StatsType.attack),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
